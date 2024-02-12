# Movie Ticket Booking System

This is a Ruby on Rails application for managing movie ticket bookings.

## Features

- Users can sign up, sign in, and manage their accounts.
- Users can browse available movies and shows.
- Users can book movie tickets for specific shows.
- Admins can manage movies, theaters, and show schedules.

## Prerequisites

Make sure you have the following installed on your system:

- Ruby (version 3.0.0)
- Rails (version 7.1.3)
- PostgreSQL
- Node (version > 18)
- Yarn (version 1.22.21)
## Installation

To run this project locally, follow these steps:

1. Clone the repository:

   ```bash
   git clone https://github.com/AJAYJAITWAL/movie_booking_system.git

2. Navigate to the project directory
   ```bash
   cd movie_booking_system

3. Install dependencies
   ```bash
   bundle install

4. Configuration
   ```bash
    yarn build
    yarn build:css

5. Set up the database (Set Postgres username and password in the database.yml file if needed)
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed

6. Start the server
   ```bash
   rails server

7. Visit http://localhost:3000 in your web browser to access the application.

8. Run Rspec
   ```bash
    bundle exec rspec spec

9. Login credentials
   ```bash
   email: 'admin@gmail.com'
   password: 'password'

   
