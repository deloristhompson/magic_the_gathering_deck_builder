# class RaritySeeder
#   RARITES = [
#     {
#       name: "Common",
#       card_id: Card.first.id
#       },{
#         name: "Uncommon",
#         card_id: Card.second.id
#         }, {
#           name: "Rare",
#           card_id: Card.third.id
#         }
#       ]
#
#       def self.seed!
#         RARITES.each do |rarity_params|
#           card_name = rarity_params[:name]
#           card_ids = rarity_params[:card_id]
#
#           rarity = Rarity.find_or_create_by!(
#             name: card_name,
#             card_id: card_ids
#           )
#           rarity.assign_attributes(rarity_params)
#           rarity.save!
#         end
#       end
#     end
