# frozen_string_literal: true

require 'view/actionable'
require 'view/company'
require 'view/players'
require 'view/undo_and_pass'

require 'engine/action/bid'

module View
  class AuctionRound < Snabberb::Component
    include Actionable

    needs :selected_company, default: nil, store: true

    def render
      @round = @game.round
      @current_entity = @round.current_entity

      h(:div, [
        h(UndoAndPass, undo: @game.actions.size.positive?),
        *render_companies,
        h(View::Players, game: @game),
      ].compact)
    end

    def render_companies
      @round.companies.map do |company|
        h(Company, company: company, bids: @round.bids[company])
      end
    end
  end
end
