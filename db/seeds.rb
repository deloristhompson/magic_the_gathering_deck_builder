if Rails.env.development?
  ColorSeeder.seed!
end

# if Rails.env.test?
#   ElfSeeder.seed!
#   ColorSeeder.seed!
# end
