# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning Database"
Collaborator.destroy_all
Task.destroy_all
Event.destroy_all
Trip.destroy_all
User.destroy_all

puts "Creating users"
fausto = User.new(email: "fausto@tripper.com", password: "fausto123", first_name: "Fausto", last_name: "Magro")
fausto.photo.attach(io: File.open('app/assets/images/user_seeds/fausto.png'), filename: "fausto.png", content_type: "image/png")
fausto.save

alexis = User.new(email: "alexis@tripper.com", password: "alexis123", first_name: "Alexis", last_name: "Florentin")
alexis.photo.attach(io: File.open('app/assets/images/user_seeds/alexis.png'), filename: "alexis.png", content_type: "image/png")
alexis.save

gaetan = User.new(email: "gaetan@tripper.com", password: "gaetan123", first_name: "Gaetan", last_name: "Tripelon")
gaetan.photo.attach(io: File.open('app/assets/images/user_seeds/gaetan.png'), filename: "gaetan.png", content_type: "image/png")
gaetan.save

camila = User.new(email: "camila@tripper.com", password: "camila123", first_name: "Camila", last_name: "Pedraza")
camila.photo.attach(io: File.open('app/assets/images/user_seeds/camila.png'), filename: "camila.png", content_type: "image/png")
camila.save

# admin = User.new(email: "admin@tripper.com", password: "admin123", first_name: "Admin", last_name: "Tripper")
# admin.admin = true
# admin.save

puts "Creating trips"
trip1 = Trip.new(
  name: "Varigotti with Family",
  user: fausto,
  image_url: "https://images.unsplash.com/photo-1605449427208-be4ecba7563f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2340&q=80",
  image_background: "https://images.unsplash.com/photo-1605449427208-be4ecba7563f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2340&q=80"
)
trip1.save

trip2 = Trip.new(
  name: "Family Eurotrip",
  user: camila,
  image_url: "https://images.unsplash.com/photo-1570698473651-b2de99bae12f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bWFkcmlkfGVufDB8fDB8fHww&auto=format&fit=crop&w=900&q=60",
  image_background: "https://images.unsplash.com/photo-1585164917550-6f73d03dc019?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=926&q=80"
)
trip2.save

trip3 = Trip.new(
  name: "Trip to Croatia with friends",
  user: alexis,
  image_url: "https://images.unsplash.com/photo-1626699848008-7e419bc4e237?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGNyb2F0aWF8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60",
  image_background: "https://images.unsplash.com/photo-1568292551807-edf51b93f4a0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGNyb2F0aWF8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60"
)
trip3.save

trip4 = Trip.new(
  name: "Le Lavandou with friends",
  user: gaetan,
  image_url: "https://images.unsplash.com/photo-1647885457515-1ff4e9f095dd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bGF2YW5kb3V8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60",
  image_background: "https://images.unsplash.com/photo-1647885457515-1ff4e9f095dd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bGF2YW5kb3V8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60"
)
trip4.save

trip5 = Trip.new(
  name: "Project X in Sarajevo",
  user: alexis,
  image_url: "https://images.unsplash.com/photo-1574414237365-9b3e19c008ef?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHNhcmFqZXZvfGVufDB8fDB8fHww&auto=format&fit=crop&w=900&q=60",
  image_background: "https://images.unsplash.com/photo-1574414237365-9b3e19c008ef?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHNhcmFqZXZvfGVufDB8fDB8fHww&auto=format&fit=crop&w=900&q=60"
)
trip5.save

puts "Creating events"
Event.create(
  name: "TGV to Annecy",
  trip: trip1,
  event_type: "train",
  start_date: DateTime.new(2023, 7, 15, 18, 45),
  end_date: DateTime.new(2023, 7, 15, 22, 30),
  start_location: "Paris Gare de Lyon",
  end_location: "Annecy Gare"
)
Event.create(
  name: "Car ride with family to Varigotti",
  trip: trip1,
  event_type: "journey",
  start_date: DateTime.new(2023, 7, 17, 10),
  end_date: DateTime.new(2023, 7, 17, 15, 30),
  start_location: "Annecy",
  end_location: "Varigotti, Savone, Italie"
)
Event.create(
  name: "Biking with family",
  trip: trip1,
  event_type: "other",
  start_date: DateTime.new(2023, 7, 17, 16),
  end_date: DateTime.new(2023, 7, 17, 20, 30),
  start_location: "Varigotti, Savona, Italy",
  end_location: "Varigotti, Savona, Italy"
)
Event.create(
  name: "Scuba Diving",
  trip: trip1,
  event_type: "other",
  start_date: DateTime.new(2023, 7, 24, 16),
  end_date: DateTime.new(2023, 7, 24, 18, 30),
  start_location: "Savona, Italy",
  end_location: "Savona, Italy"
)
Event.create(
  name: "Car ride to Chamonix",
  trip: trip1,
  event_type: "journey",
  start_date: DateTime.new(2023, 7, 24, 8),
  end_date: DateTime.new(2023, 7, 24, 12),
  start_location: "Varigotti, Savona, Italy",
  end_location: "Chamonix-Mont-Blanc"
)
Event.create(
  name: "Trip home",
  trip: trip1,
  event_type: "journey",
  start_date: DateTime.new(2023, 7, 29, 11),
  end_date: DateTime.new(2023, 7, 29, 18),
  start_location: "Chamonix-Mont-Blanc",
  end_location: "Paris"
)
event1 = Event.create(
  name: "Flight to Madrid",
  trip: trip2,
  event_type: "flight",
  start_date: DateTime.new(2023, 5, 21, 10, 55),
  end_date: DateTime.new(2023, 5, 21, 13, 5),
  start_location: "Paris, France",
  end_location: "Madrid, Spain",
  provider: "Transavia",
  reservation_number: "YTR89Q",
  transport_number: "TO4638"
)
event2 = Event.create(
  name: "Madrid Apartment",
  trip: trip2,
  event_type: "stay",
  start_date: DateTime.new(2023, 5, 21, 14),
  end_date: DateTime.new(2023, 5, 23, 6, 30),
  start_location: "Calle de 2 de Mayo 10, Madrid, Spain",
  end_location: "Calle de 2 de Mayo 10, Madrid, Spain",
  provider: "AirBnB",
  notes: "Piso 4"
)
Event.create(
  name: "From Madrid to Palma",
  trip: trip2,
  event_type: "flight",
  start_date: DateTime.new(2023, 5, 23, 9, 30),
  end_date: DateTime.new(2023, 5, 23, 10, 55),
  start_location: "Madrid, Spain",
  end_location: "Palma, Spain",
  provider: "Iberia Express",
  reservation_number: "TY67MC",
  transport_number: "IB3924"
)
Event.create(
  name: "Car rental",
  trip: trip2,
  event_type: "rental",
  start_date: DateTime.new(2023, 5, 23, 12),
  end_date: DateTime.new(2023, 5, 28, 6, 30),
  start_location: "Palma Airport, Spain",
  end_location: "Palma Airport, Spain",
  provider: "Sixt"
)
event3 = Event.create(
  name: "Stay in Palma",
  trip: trip2,
  event_type: "stay",
  start_date: DateTime.new(2023, 5, 23, 15),
  end_date: DateTime.new(2023, 5, 28, 6, 30),
  provider: "AirBnB",
  start_location: "Carrer Princesa, 15, Can Picafort, Illes Balears",
  end_location: "Carrer Princesa, 15, Can Picafort, Illes Balears"
)
Event.create(
  name: "Flight to Madrid",
  trip: trip2,
  event_type: "flight",
  start_date: DateTime.new(2023, 5, 28, 8),
  end_date: DateTime.new(2023, 5, 28, 9),
  start_location: "Palma, Spain",
  end_location: "Madrid, Spain",
  provider: "Air Europa",
  transport_number: "UX6012",
  reservation_number: "DCBBCA"
)
Event.create(
  name: "Flight to Lisbon",
  trip: trip2,
  event_type: "flight",
  start_date: DateTime.new(2023, 5, 28, 9, 50),
  end_date: DateTime.new(2023, 5, 28, 10, 50),
  start_location: "Madrid, Spain",
  end_location: "Lisbon, Portugal",
  provider: "Air Europa",
  reservation_number: "AFF7UY",
  transport_number: "UX1153"
)
Event.create(
  name: "Lisbon Apt",
  trip: trip2,
  event_type: "stay",
  start_date: DateTime.new(2023, 5, 28, 14, 30),
  end_date: DateTime.new(2023, 5, 30, 10),
  provider: "AirBnB",
  start_location: "Beco do Maquinez 10, Lisbon, Portugal",
  end_location: "Beco do Maquinez 10, Lisbon, Portugal",
  notes: "Airbnb - Apartment #4 / Check-in after 3pm // Check-out before 11am"
)
Event.create(
  name: "Car rental from Lisbon to Porto through Sintra",
  trip: trip2,
  event_type: "rental",
  start_date: DateTime.new(2023, 5, 28, 11),
  end_date: DateTime.new(2023, 6, 5, 14),
  start_location: "Lisbon Airport, Portugal",
  end_location: "Porto Airport, Portugal",
  provider: "Alamo"
)
Event.create(
  name: "Sintra stay",
  trip: trip2,
  event_type: "stay",
  start_date: DateTime.new(2023, 5, 30, 17),
  end_date: DateTime.new(2023, 6, 1, 11),
  provider: "AirBnB",
  start_location: "Rua Ferraria 8, Sintra, Portugal",
  end_location: "Rua Ferraria 8, Sintra, Portugal",
  notes: "Check-in after 2pm // Check-out before 11am"
)
Event.create(
  name: "Quinta da Regaleira",
  trip: trip2,
  event_type: "visit",
  start_date: DateTime.new(2023, 5, 31, 10, 30),
  end_date: DateTime.new(2023, 5, 31, 16, 30),
  provider: "Quinta da Regaleira",
  start_location: "R. Barbosa du Bocage 5, 2710-567 Sintra, Portugal",
  end_location: "R. Barbosa du Bocage 5, 2710-567 Sintra, Portugal"
)
Event.create(
  name: "Pena Palace",
  trip: trip2,
  event_type: "visit",
  start_date: DateTime.new(2023, 5, 31, 10, 30),
  end_date: DateTime.new(2023, 5, 31, 16, 30),
  provider: "Peña Palace",
  start_location: "Estrada da Pena, 2710-609 Sintra, Portugal",
  end_location: "Estrada da Pena, 2710-609 Sintra, Portugal"
)
Event.create(
  name: "Monserrate",
  trip: trip2,
  event_type: "visit",
  start_date: DateTime.new(2023, 6, 1, 10),
  end_date: DateTime.new(2023, 6, 1, 13),
  provider: "Monserrate",
  start_location: "Sintra, Portugal",
  end_location: "Sintra, Portugal"
)
Event.create(
  name: "Porto stay",
  trip: trip2,
  event_type: "stay",
  start_date: DateTime.new(2023, 6, 1),
  end_date: DateTime.new(2023, 6, 5),
  provider: "AirBnB",
  start_location: "Rua da Alegria 120, Porto, Portugal",
  end_location: "Rua da Alegria 120, Porto, Portugal"
)
Event.create(
  name: "Fado show",
  trip: trip2,
  event_type: "show",
  start_date: DateTime.new(2023, 6, 4, 20),
  end_date: DateTime.new(2023, 6, 4, 22),
  provider: "Ideale Clube de Fado",
  start_location: "Rua do Ateneu Comercial do Porto 32, Porto, Portugal",
  end_location: "Rua do Ateneu Comercial do Porto 32, Porto, Portugal"
)
Event.create(
  name: "Flight to Bordeaux",
  trip: trip2,
  event_type: "flight",
  start_date: DateTime.new(2023, 6, 5, 16, 5),
  end_date: DateTime.new(2023, 6, 5, 18, 40),
  start_location: "Porto, Portugal",
  end_location: "Bordeaux, France"
)
Event.create(
  name: "Bordeaux stay",
  trip: trip2,
  event_type: "stay",
  start_date: DateTime.new(2023, 6, 5, 18),
  end_date: DateTime.new(2023, 6, 8, 10),
  provider: "AirBnB",
  start_location: "Chem. de Port Leyron, 33880 Baurech, France",
  end_location: "Chem. de Port Leyron, 33880 Baurech, France"
)
Event.create(
  name: "Train to Paris",
  trip: trip2,
  event_type: "train",
  start_date: DateTime.new(2023, 6, 8, 12, 20),
  end_date: DateTime.new(2023, 6, 8, 14, 41),
  provider: "Ouigo",
  start_location: "Gare Bordeaux Saint-Jean, Bordeaux, France",
  end_location: "Gare Paris Montparnasse, Paris, France",
  transport_number: "7656",
  reservation_number: "BZB8QY"
)
Event.create(
  name: "Restaurant Pain Vin Fromages",
  trip: trip2,
  event_type: "restaurant",
  start_date: DateTime.new(2023, 6, 10, 21, 15),
  end_date: DateTime.new(2023, 6, 10),
  start_location: "3 Rue Geoffroy l'Angevin, 75004 Paris",
  end_location: "3 Rue Geoffroy l'Angevin, 75004 Paris"
)
Event.create(
  name: "Sainte Chapelle",
  trip: trip2,
  event_type: "visit",
  start_date: DateTime.new(2023, 6, 11, 11),
  end_date: DateTime.new(2023, 6, 11, 13),
  start_location: "10 Bd du Palais, 75001 Paris",
  end_location: "10 Bd du Palais, 75001 Paris"
)
Event.create(
  name: "Chateau de Versailles",
  trip: trip2,
  event_type: "visit",
  start_date: DateTime.new(2023, 6, 11, 14, 30),
  end_date: DateTime.new(2023, 6, 11, 19, 30),
  start_location: "Place d'Armes, 78000 Versailles",
  end_location: "Place d'Armes, 78000 Versailles"
)
Event.create(
  name: "Monet's House",
  trip: trip2,
  event_type: "visit",
  start_date: DateTime.new(2023, 6, 12, 12, 30),
  end_date: DateTime.new(2023, 6, 12, 17),
  start_location: "84 Rue Claude Monet, 27620 Giverny",
  end_location: "84 Rue Claude Monet, 27620 Giverny"
)
Event.create(
  name: "Eiffel Tower",
  trip: trip2,
  event_type: "visit",
  start_date: DateTime.new(2023, 6, 12, 21, 30),
  end_date: DateTime.new(2023, 6, 12, 23, 30),
  start_location: "Champ de Mars, 5 Av. Anatole France, 75007 Paris",
  end_location: "Champ de Mars, 5 Av. Anatole France, 75007 Paris"
)
Event.create(
  name: "Orangerie Museum",
  trip: trip2,
  event_type: "visit",
  start_date: DateTime.new(2023, 6, 13, 10),
  end_date: DateTime.new(2023, 6, 13, 16, 45),
  start_location: "Jardin des Tuileries, 75001 Paris",
  end_location: "Jardin des Tuileries, 75001 Paris"
)
Event.create(
  name: "Louvre Museum",
  trip: trip2,
  event_type: "visit",
  start_date: DateTime.new(2023, 6, 14, 10),
  end_date: DateTime.new(2023, 6, 14, 18),
  start_location: "Louvre Museum, 75001 Paris",
  end_location: "Louvre Museum, 75001 Paris"
)
Event.create(
  name: "Vol vers le Lavandou",
  trip: trip4,
  event_type: "flight",
  start_date: DateTime.new(2023, 7, 16, 13, 20),
  end_date: DateTime.new(2023, 7, 16, 15, 5),
  provider: "Easyjet",
  seat_number: "12A",
  start_location: "Aéroport Paris-Charles de Gaulle, 95700 Roissy-en-France",
  end_location: "Aéroport de Toulon-Hyères, Bd de la Marine, 83400 Hyères"
)
Event.create(
  name: "Première cuite au Mix",
  trip: trip4,
  event_type: "restaurant",
  provider: "Le Mix",
  provider_phone: "04 89 66 91 85",
  start_date: DateTime.new(2023, 7, 16, 21),
  end_date: DateTime.new(2023, 7, 17, 3),
  start_location: "Le Mix Bar Lounge, Le Nouveau Port Du Lavandou, Le Lavandou, Var 83980, France",
  end_location: "Le Mix Bar Lounge, Le Nouveau Port Du Lavandou, Le Lavandou, Var 83980, France"
)
Event.create(
  name: "Marché artisanal nocturne (front de mer du Lavandou)",
  trip: trip4,
  event_type: "other",
  start_date: DateTime.new(2023, 7, 19),
  end_date: DateTime.new(2023, 7, 19),
  start_location: "Front de mer, 83980 Le Lavandou",
  end_location: "Front de mer, 83980 Le Lavandou"
)
Event.create(
  name: "Langoustes au restaurant Plage du Layet",
  trip: trip4,
  event_type: "restaurant",
  start_date: DateTime.new(2023, 7, 20, 12, 30),
  end_date: DateTime.new(2023, 7, 20),
  start_location: "Plage du Layet, 83980 Cavaliere",
  end_location: "Plage du Layet, 83980 Cavaliere"
)
Event.create(
  name: "Back to home",
  trip: trip4,
  event_type: "flight",
  start_date: DateTime.new(2023, 7, 23, 15, 40),
  end_date: DateTime.new(2023, 7, 23, 17, 25),
  provider: "Easyjet",
  seat_number: "12A",
  start_location: "Aéroport de Toulon-Hyères, Bd de la Marine, 83400 Hyères",
  end_location: "Aéroport Paris-Charles de Gaulle, 95700 Roissy-en-France"
)
Event.create(
  name: "Flight to Dubrovnik",
  trip: trip3,
  event_type: "flight",
  start_date: DateTime.new(2023, 7, 20, 9, 30),
  end_date: DateTime.new(2023, 7, 20, 14, 50),
  provider: "Transavia",
  start_location: "Orly Airport",
  end_location: "Dubrovnik Airport, Čilipi, Croatia"
)
Event.create(
  name: "Visite panoramique en bus décapotable",
  trip: trip3,
  event_type: "visit",
  start_date: DateTime.new(2023, 7, 22),
  end_date: DateTime.new(2023, 7, 22),
  start_location: "Dubrovnik, Croatia",
  end_location: "Dubrovnik, Croatia"
)
Event.create(
  name: "Grotte bleue",
  trip: trip3,
  event_type: "boat",
  start_date: DateTime.new(2023, 7, 22),
  end_date: DateTime.new(2023, 7, 22),
  provider: "Dubrovnik Islands Tours",
  start_location: "Dubrovnik, Croatia",
  end_location: "Dubrovnik, Croatia"
)
Event.create(
  name: "Trip to Split",
  trip: trip3,
  event_type: "bus",
  start_date: DateTime.new(2023, 7, 23, 5),
  end_date: DateTime.new(2023, 7, 23, 9, 32),
  provider: "Čazmatrans",
  start_location: "Dubrovnik, Croatia",
  end_location: "Split, Croatia"
)
Event.create(
  name: "Return to Dubrovnik",
  trip: trip3,
  event_type: "bus",
  start_date: DateTime.new(2023, 7, 23, 22),
  end_date: DateTime.new(2023, 7, 24, 2),
  provider: "Samoborček",
  start_location: "Split, Croatia",
  end_location: "Dubrovnik, Croatia"
)
Event.create(
  name: "Return to Paris",
  trip: trip3,
  event_type: "flight",
  start_date: DateTime.new(2023, 7, 24, 9, 10),
  end_date: DateTime.new(2023, 7, 24, 11, 40),
  provider: "Transavia",
  start_location: "Dubrovnik Airport, Čilipi, Croatia",
  end_location: "Orly Airport"
)
Collaborator.create(
  trip: trip1,
  user: alexis
)

Collaborator.create(
  trip: trip1,
  user: camila
)

Collaborator.create(
  trip: trip1,
  user: gaetan
)

Collaborator.create(
  trip: trip2,
  user: fausto
)

puts "Creating tasks"
Task.create(
  event: event1,
  content: "Get travel insurance",
  is_complete: true
)

Task.create(
  event: event1,
  content: "Buy carry-on bag"
)

Task.create(
  event: event1,
  content: "Check in and get boarding pass"
)

Task.create(
  event: event2,
  content: "Confirm check-in and check-out time"
)

Task.create(
  event: event2,
  content: "Ask what nearest metro stop is"
)

Task.create(
  event: event3,
  content: "Book parking spot nearby"
)
