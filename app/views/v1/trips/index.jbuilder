json.trips @trips do |trip|
  json.id                 trip.id
  json.country_name       trip.country_name
  json.hotel              trip.hotel
  json.transport          trip.transport
  json.start_date         trip.start_date
end
