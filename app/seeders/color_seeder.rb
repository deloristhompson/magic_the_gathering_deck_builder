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
      named_color = Color.find_or_create_by!(name: name)
      named_color.save!
    end
  end
end
