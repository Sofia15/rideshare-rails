# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

Passenger.destroy_all
Driver.destroy_all
Trip.destory_all

csv_text = File.read(Rails.root.join('lib', 'seeds', 'passengers.csv'))

csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  passenger = Passenger.new
  passenger.passenger_id = row["passenger_id"]
  passenger.name = row["name"]
  passenger.phone_num = row["phone_num"]

  passenger.save!
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'drivers.csv'))

csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  driver = Driver.new
  driver.driver_id = row["driver_id"]
  driver.name = row["name"]
  driver.vin = row["vin"]

  driver.save!
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'trips.csv'))

csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  trip = Trip.new
  trip.trip_id = row["trip_id"]
  trip.driver_id = row["driver_id"]
  trip.passenger_id = row["passenger_id"]
  trip.date = row["date"]
  trip.rating = row["rating"]
  trip.cost = rand(1..600)

  trip.save!
end
