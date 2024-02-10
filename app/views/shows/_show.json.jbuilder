json.extract! show, :id, :movie_id, :start_time, :end_time, :total_seats, :available_seats, :created_at, :updated_at
json.url show_url(show, format: :json)
