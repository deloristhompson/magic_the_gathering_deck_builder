if Rails.env.development?
  ColorSeeder.seed!
end

if Rails.env.test?
  CardSeeder.seed!
  TypeSeeder.seed!
  ColorSeeder.seed!
end
