class ElfSeeder
  ELVES = [
    {
      name: "Skyshroud Poacher",
      artist: 'Ron Spencer',
      text: 'Search your library for and Elf card
      and put that card into play.
      Then shuffle your library.',
      mana_cost: '{2}{G}{G}',
      cmc: '4',
      power: '2',
      toughness: '2'
    }, {
      name: "Wellwisher",
      artist: 'Christopher Rush',
      text: 'You gain 1 life for each Elf in play.',
      mana_cost: '{1}{G}',
      cmc: '2',
      power: '1',
      toughness: '1'
    }, {
      name: "Taunting Elf",
      artist: 'Rebecca Guay',
      text: 'All creatures able to block Taunting Elf do so',
      mana_cost: '{G}',
      cmc: '1',
      power: '0',
      toughness: '1'
    }, {
      name: 'Thornweald Archer',
      artist: 'Dave Kendall',
      text: 'Reach (This creature can block creatures with flying),
      Deathtouch (Whenever this creature deals damage to a creature, destroy that creature)',
      mana_cost: '{1}{G}',
      cmc: '2',
      power: '2',
      toughness: '1'
    }, {
      name: 'Viridian Zealot',
      artist: 'Kev Walker',
      text: '1G, Sacrifice Viridian Zealot:
      Destroy target artifact or enchantment.',
      mana_cost: '{G}{G}',
      cmc: '2',
      power: '2',
      toughness: '1'
    }
  ]

  SUM = [
    {
      name: 'UnCommon'
    }
  ]
  def self.seed!
    ELVES.each do |card_params|
      card_name = card_params[:name]
      card_artist = card_params[:artist]
      card_mana = card_params[:mana_cost]
      card_cmc = card_params[:cmc]
      card_power = card_params[:power]
      card_toughness= card_params[:toughness]
      card_text = card_params[:text]

      card = Card.find_or_create_by!(
        name: card_name,
        artist: card_artist,
        mana_cost: card_mana,
        cmc: card_cmc,
        power: card_power,
        toughness: card_toughness,
        text: card_text
      )
      card.assign_attributes(card_params)
      card.save!
    end
  end
end


# {
#   name:
#   artist:
#   text:
#   mana_cost:
#   cmc:
#   power:
#   toughness:
# }
