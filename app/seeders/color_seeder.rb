class ColorSeeder
  COLORS = [
    {
      name: 'Red'
    }, {
      name: 'White'
    }, {
      name: 'Blue'
    }, {
      name: 'Black'
    }, {
      name: 'Green'
    }
  ]

  def self.seed!
    COLORS.each do |color|
      card_name = color[:name]
      new_name = Color.find_or_create_by!(name: card_name)
      new_name.assign_attributes(color)
      new_name.save!
    end
  end
end
