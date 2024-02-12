User.create!(email: "admin@gmail.com", password: "password", role: "admin")

all_movies = [
  {
    title: 'Animal',
    genre: '2023 ‧ Action/Crime ‧ 3h 21m',
    description: 'In the film, Ranvijay Singh, a violent man learns about an assassination attempt on his estranged father and sets out on a path of revenge and destruction. The film was officially announced in January 2021. Principal photography began in April 2022 and wrapped by April 2023, with cinematography by Amit Roy.',
    image: 'animal.jpg'
  },
  {
    title: "Hanu-Man",
    genre: "2024 ‧ Action/Superhero ‧ 2h 30m",
    description: "The film follows the story of Hanumanthu, who gets the power of Lord Hanuman to save the people of Anjanadri, and faces off against Michael after coming in contact with a mysterious gem. The film was officially announced in May 2021.",
    image: "hanuman.jpeg"
  },
  {
    title: 'The Dark Knight',
    genre: 'Action/Crime ‧ 2h 32m',
    description: 'The Dark Knight is a 2008 superhero film directed, produced, and co-written by Christopher Nolan. Based on the DC Comics character Batman, the film is the second installment of Nolan\'s The Dark Knight Trilogy and a sequel to 2005\'s Batman Begins.',
    image: 'dark_knight.jpg'
  },
  {
    title: 'Jurassic Park',
    genre: 'Action/Adventure ‧ 2h 7m',
    description: 'Jurassic Park is a 1993 American science fiction adventure film directed by Steven Spielberg. It is the first installment in the Jurassic Park franchise, and is based on the 1990 novel of the same name by Michael Crichton.',
    image: 'jurassic_park.jpg'
  },
  {
    title: 'Avatar',
    genre: 'Action/Adventure ‧ 2h 42m',
    description: 'Avatar is a 2009 American science fiction film directed, written, produced, and co-edited by James Cameron and stars Sam Worthington, Zoe Saldana, Stephen Lang, Michelle Rodriguez, and Sigourney Weaver.',
    image: 'avatar.jpg'
  },
  {
    title: 'Interstellar',
    genre: 'Sci-Fi/Adventure ‧ 2h 49m',
    description: 'Interstellar is a 2014 epic science fiction film directed and produced by Christopher Nolan. It stars Matthew McConaughey, Anne Hathaway, Jessica Chastain, Bill Irwin, Ellen Burstyn, John Lithgow, Michael Caine, and Matt Damon.',
    image: 'interstellar.jpg'
  },
  {
    title: 'The Shawshank Redemption',
    genre: 'Drama/Crime ‧ 2h 22m',
    description: 'The Shawshank Redemption is a 1994 American drama film written and directed by Frank Darabont, based on the 1982 Stephen King novella Rita Hayworth and Shawshank Redemption.',
    image: 'shawshank_redemption.jpg'
  }
]

all_movies.each do |all_movies|
  movie = Movie.create!(title: all_movies[:title], genre: all_movies[:genre], description: all_movies[:description])
  image_path = Rails.root.join('public', 'images', all_movies[:image])

  movie.update(image: image_path) if File.exist?(image_path)
end

theaters_data = [
  { name: 'Velocity', location: 'Indore', capacity: 78 },
  { name: 'PVR', location: 'Ujjain', capacity: 104 },
  { name: 'Abhinav', location: 'Dewas', capacity: 208 }
]

theaters_data.each do |data|
  Theater.create!(data)
end

shows_data = [
  { start_time: '11:00', end_time: '14:00', movie: Movie.first, theater: Theater.first, show_date: Date.today, total_seats: Theater.first.capacity, available_seats: Theater.first.capacity },
  { start_time: '10:15', end_time: '13:15', movie: Movie.second, theater: Theater.second, show_date: Date.today, total_seats: Theater.second.capacity, available_seats: Theater.second.capacity },
  { start_time: '18:00', end_time: '21:00', movie: Movie.second, theater: Theater.second, show_date: Date.tomorrow, total_seats: Theater.second.capacity, available_seats: Theater.second.capacity },
  { start_time: '15:00', end_time: '18:00', movie: Movie.third, theater: Theater.third, show_date: Date.tomorrow, total_seats: Theater.third.capacity, available_seats: Theater.third.capacity },
  { start_time: '17:30', end_time: '20:30', movie: Movie.third, theater: Theater.third, show_date: Date.tomorrow, total_seats: Theater.third.capacity, available_seats: Theater.third.capacity },
]

shows_data.each do |show|
  Show.create!(show)
end
