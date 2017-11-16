if Rails.env.development?
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
