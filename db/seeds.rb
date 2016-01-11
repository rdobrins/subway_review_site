30.times do |i|
  Station.create(
    name: "Chinatown Station #{i}",
    address: "33 Harrison Ave",
    city: "Boston",
    state: "MA",
    zip: "02134"
  )
end

Station.create(
  name: "Arlington Station",
  address: "399 Boylston St",
  city: "Boston",
  state: "MA",
  zip: "01234"
)

User.create(
  first_name: "Bob",
  last_name: "Saget",
  email: "b@gmail.com",
  password: "password"
)

User.create(
  first_name: "Test",
  last_name: "Admin",
  email: "admin@gmail.com",
  password: "password",
  role: "admin"
)

Review.create(
  body: "review for station with id one and a user with id one",
  user_id: 1,
  station_id: 1,
  rating: 4
)
