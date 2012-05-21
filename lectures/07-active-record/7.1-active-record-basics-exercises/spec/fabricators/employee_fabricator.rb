Fabricator(:employee) do
  name { Faker::Name.name }
  address { Faker::Address.street_address }
  start_date { Date.today }
end

Fabricator(:role) do
  name { Faker::Name.name }
  department { Faker::Lorem.words(num = 1)}
end
