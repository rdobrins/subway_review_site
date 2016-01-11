User.create(
  first_name: "Bob",
  last_name: "Saget",
  email: "b@gmail.com",
  password: "password"
)

30.times do |i|
  Station.create(
    name: "Chinatown Station #{i}",
    address: "33 Harrison Ave",
    city: "Boston",
    state: "MA",
    zip: "02134",
    user_id: 1
  )
end

Station.create(
  name: "Arlington Station",
  address: "399 Boylston St",
  city: "Boston",
  state: "MA",
  zip: "01234",
  user_id: 1
)
