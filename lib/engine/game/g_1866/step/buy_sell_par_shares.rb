# frozen_string_literal: true

require_relative '../../../step/buy_sell_par_shares'

module Engine
  module Game
    module G1866
      module Step
        class BuySellParShares < Engine::Step::BuySellParShares
          def actions(entity)
            return [] if entity == current_entity && @round.stock? && @round.player_passed[entity]
            return ['choose_ability'] unless choices_ability(entity).empty?
            return [] unless entity == current_entity
            return ['sell_shares'] if must_sell?(entity)

            player_debt = @game.player_debt(entity)
            actions = []
            actions << 'buy_shares' if can_buy_any?(entity) && player_debt.zero?
            actions << 'par' if can_ipo_any?(entity) && player_debt.zero?
            actions << 'payoff_player_debt' if player_debt.positive? && entity.cash.positive?
            actions << 'sell_shares' if can_sell_any?(entity)
            actions << 'pass' unless actions.empty?
            actions
          end

          def bought?
            super || bought_stock_token? || paid_off_player_debt?
          end

          def bought_stock_token?
            @round.current_actions.any? { |x| x.instance_of?(Action::ChooseAbility) && x.choice != 'SELL' }
          end

          def can_buy?(entity, bundle)
            return false if @game.player_sold_shares[entity][bundle.corporation]

            super
          end

          def choices_ability(entity)
            return {} if !entity.company? || (entity.company? && !@game.stock_turn_token_company?(entity))
            return {} if @game.stock_turn_token_removed?(active_entities[0])

            choices = {}
            operator = entity.company? ? entity.owner : entity
            valid_token = @game.stock_turn_token?(operator)
            token_permium = @game.stock_turn_token_premium?(operator)
            if @game.player_debt(operator).zero? && !@game.game_end_triggered? &&
              ((valid_token && @round.operating?) || (valid_token && !@round.operating? && !token_permium)) &&
              @game.num_certs(operator) < @game.cert_limit
              get_par_prices(operator).sort_by(&:price).each do |p|
                par_str = @game.par_price_str(p)
                choices[par_str] = par_str
              end
            end
            if @round.operating?
              price = @game.format_currency(active_entities[0].share_price.price)
              choices['SELL'] = "Sell the Stock Turn Token (#{price})"
            end
            choices
          end

          def description
            'Initial Stock Round'
          end

          def did_sell?(corporation, entity)
            super || @game.player_sold_shares[entity][corporation]
          end

          def get_par_prices(entity, corp = nil)
            return get_minor_national_par_prices(entity, corp) if @game.minor_national_corporation?(corp)
            return [@game.forced_formation_par_prices(corp).last] if @game.germany_or_italy_national?(corp)

            par_type = @game.phase_par_type(corp)
            par_prices = @game.par_prices_sorted.select do |p|
              extra = if corp.nil? && entity.player? && @game.stock_turn_token_premium?(entity)
                        @round.round_num * (@game.players.size - 1) * 5
                      else
                        0
                      end
              multiplier = corp.nil? || @game.major_national_corporation?(corp) ? 1 : 2
              p.types.include?(par_type) && (p.price * multiplier) + extra <= entity.cash &&
                @game.can_par_share_price?(p, corp)
            end
            par_prices.reject! { |p| p.price == @game.class::MAX_PAR_VALUE } if par_prices.size > 1
            par_prices
          end

          def get_minor_national_par_prices(entity, corp)
            par_rows = @game.class::MINOR_NATIONAL_PAR_ROWS[corp.name]
            share_price = @game.stock_market.share_price(par_rows[0], par_rows[1])
            return [] unless share_price.price <= entity.cash

            [share_price]
          end

          def log_skip(entity)
            if @round.stock? && @round.player_passed[entity]
              @log << "#{entity.name} have passed and is out of the ISR"
            else
              super
            end
          end

          def process_choose_ability(action)
            entity = action.entity
            choice = action.choice
            if choice == 'SELL'
              @game.sell_stock_turn_token(active_entities[0])
              entity.name = @game.stock_turn_token_name(entity.owner)
              track_action(action, entity.owner)
            else
              share_price = nil
              get_par_prices(entity.owner).each do |p|
                next unless choice == @game.par_price_str(p)

                share_price = p
              end
              if share_price
                @game.purchase_stock_turn_token(entity.owner, share_price)
                entity.name = @game.stock_turn_token_name(entity.owner)
                track_action(action, entity.owner)
                log_pass(entity.owner)
                pass!
              end
            end
          end

          def process_par(action)
            share_price = action.share_price
            corporation = action.corporation
            entity = action.entity
            raise GameError, "#{corporation} can't be parred" unless @game.can_par?(corporation, entity)

            if corporation.par_via_exchange
              @game.stock_market.set_par(corporation, share_price)

              # Select the president share to buy
              share = corporation.ipo_shares.first

              # Move all to the market
              bundle = ShareBundle.new(corporation.shares_of(corporation))
              @game.share_pool.transfer_shares(bundle, @game.share_pool)

              # Buy the share from the bank
              bundle = share.to_bundle
              @game.share_pool.buy_shares(action.entity,
                                          bundle,
                                          exchange: corporation.par_via_exchange,
                                          exchange_price: bundle.price)

              # Close the concession company
              corporation.par_via_exchange.close!

              @game.after_par(corporation)
              track_action(action, corporation)

            elsif @game.minor_national_corporation?(corporation)
              @game.stock_market.set_par(corporation, share_price)

              # Select the president share to buy
              share = corporation.ipo_shares.first

              # Move all to the market
              bundle = ShareBundle.new(corporation.shares_of(corporation))
              @game.share_pool.transfer_shares(bundle, @game.share_pool)

              # Buy the share from the bank
              @game.share_pool.buy_shares(action.entity,
                                          share.to_bundle,
                                          exchange: :free,
                                          exchange_price: share.price_per_share)

              @game.after_par(corporation)
              track_action(action, corporation)

            elsif corporation.id == @game.class::ITALY_NATIONAL
              @game.forced_formation_major(@game.corporation_by_id(@game.class::ITALY_NATIONAL), %w[K2S SAR LV PAP TUS])
              track_action(action, corporation)

            elsif corporation.id == @game.class::GERMANY_NATIONAL
              @game.forced_formation_major(@game.corporation_by_id(@game.class::GERMANY_NATIONAL), %w[PRU HAN BAV WTB SAX])
              track_action(action, corporation)

            else
              super
            end

            log_pass(action.entity)
            pass!
          end

          def process_pass(action)
            @round.player_passed[action.entity] = true if @round.stock?

            super
          end

          def process_payoff_player_debt(action)
            player = action.entity
            @game.payoff_player_loan(player)
            track_action(action, player)
            log_pass(player)
            pass!
          end

          def paid_off_player_debt?
            @round.current_actions.any? { |x| x.instance_of?(Action::PayoffPlayerDebt) }
          end

          def sold?
            super || sold_stock_token?
          end

          def sold_stock_token?
            @round.current_actions.any? { |x| x.instance_of?(Action::ChooseAbility) && x.choice == 'SELL' }
          end
        end
      end
    end
  end
end
