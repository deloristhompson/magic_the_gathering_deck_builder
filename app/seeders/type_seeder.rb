class TypeSeeder
  TYPES = [
    {
      name: 'Creature, Elf'
    }, {
      name: 'Creature, Rebel',
    }
  ]
  def self.seed!
    TYPES.each do |type_params|
      card_type = type_params[:name]
      type = Type.find_or_create_by!(
        name: card_type
      )

      type.assign_attributes(type_params)
      type.save!
    end
  end
end
