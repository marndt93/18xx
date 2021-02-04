# frozen_string_literal: true

# File original exported from 18xx-maker/export-rb
# https://github.com/18xx-maker/export-rb
# rubocop:disable Lint/RedundantCopDisableDirective, Layout/LineLength, Layout/HeredocIndentation

module Engine
  module Config
    module Game
      module G1877
        JSON = <<-'DATA'
{
   "filename":"1877",
   "modulename":"1877",
   "currencyFormatStr":"Bs.%d",
   "bankCash":99999,
   "certLimit":{
      "2":21,
      "3":16,
      "4":13,
      "5":11,
      "6":9,
      "7":9
   },
   "startingCash":{
      "2":420,
      "3":315,
      "4":252,
      "5":210,
      "6":180,
      "7":142
   },
   "capitalization":"incremental",
   "layout":"flat",
   "mustSellInBlocks":false,
   "locationNames":{
      "E2":"Acarigua",
      "H3":"Barcelona",
      "D3":"Barquisimeto",
      "G6":"Cabruta",
      "F5":"Calabozo",
      "F1":"Caracas",
      "A6":"Colombia",
      "B5":"San Cristobal",
      "H5":"El Pilar",
      "I4":"Guayana City",
      "L5":"Guyana",
      "B1":"Maracaibo",
      "C4":"El Vigía",
      "F3":"San Juan de Los Morros",
      "J1":"Trinidad & Tobago",
      "G4":"Zaraza"
   },
   "tiles":{
      "5":"unlimited",
      "7":"unlimited",
      "8":"unlimited",
      "9":"unlimited",
      "441":"unlimited",
      "442":"unlimited",
      "444":"unlimited",
      "80":"unlimited",
      "81":"unlimited",
      "82":"unlimited",
      "83":"unlimited",
      "38":"unlimited",
      "X1":{
         "count":"unlimited",
         "color":"green",
         "code":"city=revenue:50;city=revenue:50;path=a:1,b:_0;path=a:_1,b:5;label=C"
      },
      "X2":{
         "count":"unlimited",
         "color":"green",
         "code":"city=revenue:50;path=a:0,b:_0;label=M"
      },
      "X3":{
         "count":"unlimited",
         "color":"brown",
         "code":"city=revenue:60,slots:2;path=a:1,b:_0;path=a:_0,b:5;label=C"
      },
      "X4":{
         "count":"unlimited",
         "color":"brown",
         "code":"city=revenue:60;path=a:0,b:_0;label=M"
      }
   },
   "market":[
      [
         "0l",
         "0a",
         "0a",
         "0a",
         "40",
         "45",
         "50p",
         "55s",
         "60p",
         "65p",
         "70s",
         "80p",
         "90p",
         "100p",
         "110p",
         "120s",
         "135p",
         "150p",
         "165p",
         "180p",
         "200p",
         "220",
         "245",
         "270",
         "300",
         "330",
         "360",
         "400",
         "440",
         "490",
         "540",
         "600"
      ]
   ],
   "corporations":[
      {
         "float_percent":20,
         "sym":"BPC",
         "name":"Ferroviario de Barquisimento y Puerto Caballo",
         "logo":"1877/BPC",
         "shares":[
            40,
            20,
            20,
            20
         ],
         "max_ownership_percent":60,
         "tokens":[
            0
         ],
         "always_market_price":true,
         "color":"dodgerblue"
      },
      {
         "float_percent":20,
         "sym":"BSC",
         "name":"Ferroviario de Barinas y San Cristobál",
         "logo":"1877/BSC",
         "shares":[
            40,
            20,
            20,
            20
         ],
         "max_ownership_percent":60,
         "tokens":[
            0
         ],
         "always_market_price":true,
         "text_color":"black",
         "color":"lightgreen"
      },
      {
         "float_percent":20,
         "sym":"Cap",
         "name":"Capital Line",
         "logo":"1877/CAP",
         "shares":[
            40,
            20,
            20,
            20
         ],
         "max_ownership_percent":60,
         "tokens":[
            0
         ],
         "always_market_price":true,
         "text_color":"black",
         "color":"#FFD700"
      },
      {
         "float_percent":20,
         "sym":"CLG",
         "name":"Ferroviario de Caracas y La Guaira",
         "logo":"1877/CLG",
         "shares":[
            40,
            20,
            20,
            20
         ],
         "max_ownership_percent":60,
         "tokens":[
            0
         ],
         "always_market_price":true,
         "color":"deeppink"
      },
      {
         "float_percent":20,
         "sym":"E&M",
         "name":"Ferroviario de Encontrados y Machiques",
         "logo":"1877/EM",
         "shares":[
            40,
            20,
            20,
            20
         ],
         "max_ownership_percent":60,
         "tokens":[
            0
         ],
         "always_market_price":true,
         "color":"darkmagenta"
      },
      {
         "float_percent":20,
         "sym":"FCC",
         "name":"Ferroviario de Caracas y Cúa",
         "logo":"1877/FCC",
         "shares":[
            40,
            20,
            20,
            20
         ],
         "max_ownership_percent":60,
         "tokens":[
            0
         ],
         "always_market_price":true,
         "color":"red"
      },
      {
         "float_percent":20,
         "sym":"LESJ",
         "name":"Ferroviario de La Encrucijada y San Juan de Los Morros",
         "logo":"1877/LESJ",
         "shares":[
            40,
            20,
            20,
            20
         ],
         "max_ownership_percent":60,
         "tokens":[
            0
         ],
         "always_market_price":true,
         "text_color":"black",
         "color":"orange"
      },
      {
         "float_percent":20,
         "sym":"M&M",
         "name":"Ferroviario de Machiques y Maracaibo",
         "logo":"1877/MM",
         "shares":[
            40,
            20,
            20,
            20
         ],
         "max_ownership_percent":60,
         "tokens":[
            0
         ],
         "always_market_price":true,
         "color":"saddlebrown"
      },
      {
         "float_percent":20,
         "sym":"PCB",
         "name":"Ferroviario de Puerto Cabello y Barquisimeto",
         "logo":"1877/PCB",
         "shares":[
            40,
            20,
            20,
            20
         ],
         "max_ownership_percent":60,
         "tokens":[
            0
         ],
         "always_market_price":true,
         "color":"darkgreen"
      },
      {
         "float_percent":20,
         "sym":"Sans",
         "name":"Ferroviario de San Juan de Los Morros y San Fernando de Apure",
         "logo":"1877/SANS",
         "shares":[
            40,
            20,
            20,
            20
         ],
         "max_ownership_percent":60,
         "tokens":[
            0
         ],
         "always_market_price":true,
         "text_color":"black",
         "color":"aqua"
      },
      {
         "float_percent":20,
         "sym":"SMB",
         "name":"Ferroviario de Sabana de Mendoza y Barquisimeto",
         "logo":"1877/SMB",
         "shares":[
            40,
            20,
            20,
            20
         ],
         "max_ownership_percent":60,
         "tokens":[
            0
         ],
         "always_market_price":true,
         "color":"silver",
         "text_color":"black"
      },
      {
         "float_percent":20,
         "sym":"TCM",
         "name":"Tucucas Copper Mining Railway",
         "logo":"1877/TCM",
         "shares":[
            40,
            20,
            20,
            20
         ],
         "max_ownership_percent":60,
         "tokens":[
            0
         ],
         "always_market_price":true,
         "color":"black"
      }
   ],
   "trains":[
      {
         "name":"2",
         "distance":2,
         "price":100,
         "rusts_on":"4",
         "num":40
      },
      {
         "name":"2+",
         "distance":2,
         "price":100,
         "obsolete_on":"4",
         "num":3
      },
      {
         "name":"3",
         "distance":3,
         "price":250,
         "num":10
      },
      {
         "name":"4",
         "distance":4,
         "price":300,
         "num":40,
         "events":[
            {
               "type":"signal_end_game"
            }
         ]
      }
   ],
   "hexes":{
      "white":{
         "":[
            "D5",
            "E4",
            "E6",
            "G2",
            "G8",
            "H7",
            "I6",
            "J5",
            "D1"
         ],
         "border=edge:2,type:impassable;border=edge:1,type:impassable":[
            "C2"
         ],
         "border=edge:4,type:impassable":[
            "B3"
         ],
         "border=edge:2,type:impassable":[
            "K4"
         ],
         "border=edge:5,type:impassable":[
            "J3"
         ],
         "upgrade=cost:15,terrain:mountain":[
            "I2",
            "C4"
         ],
         "city=revenue:0;upgrade=cost:15,terrain:mountain":[
            "D3",
            "C4"
         ],
         "city=revenue:0":[
            "E2",
            "H3",
            "F5",
            "B5",
            "F3",
            "G4"
         ],
         "upgrade=cost:10,terrain:water":[
            "F7"
         ],
         "city=revenue:0;upgrade=cost:10,terrain:water":[
            "G6",
            "I4",
            "H5"
         ]
      },
      "red":{
         "offboard=revenue:yellow_20|green_30;path=a:4,b:_0":[
            "A6"
         ],
         "offboard=revenue:yellow_20|green_30;path=a:2,b:_0":[
            "L5"
         ],
         "offboard=revenue:yellow_20|green_30;path=a:1,b:_0":[
            "J1"
         ]
      },
      "yellow":{
         "city=revenue:40;city=revenue:40;path=a:1,b:_0;path=a:_1,b:5;label=C":[
            "F1"
         ],
         "city=revenue:40;path=a:0,b:_0;label=M;border=edge:5,type:impassable":[
            "B1"
         ]
      }
   },
   "phases":[
      {
         "name":"2",
         "train_limit":4,
         "tiles":[
            "yellow"
         ],
         "operating_rounds":2,
         "corporation_sizes":[
            5
         ]
      },
      {
         "name":"2+",
         "on":"2+",
         "train_limit":4,
         "tiles":[
            "yellow"
         ],
         "operating_rounds":2,
         "corporation_sizes":[
            5
         ]
      },
      {
         "name":"3",
         "on":"3",
         "train_limit":4,
         "tiles":[
            "yellow",
            "green"
         ],
         "operating_rounds":2,
         "corporation_sizes":[
            5
         ]
      },
      {
         "name":"4",
         "on":"4",
         "train_limit":3,
         "tiles":[
            "yellow",
            "green",
            "brown"
         ],
         "operating_rounds":2,
         "corporation_sizes":[
            5
         ]
      }
   ]
}
        DATA
      end
    end
  end
end

# rubocop:enable Lint/RedundantCopDisableDirective, Layout/LineLength, Layout/HeredocIndentation
