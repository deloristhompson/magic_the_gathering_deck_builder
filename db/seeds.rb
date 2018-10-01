if Rails.env.development? || Rails.env.production?
  ColorSeeder.seed!
  types = MTG::Type.all
  types.each do |type|
    Type.find_or_create_by!(name: type)
  end
end

if Rails.env.test?
  types = MTG::Type.all
  types.each do |type|
    Type.find_or_create_by!(name: type)
  end
end
