json.links @links do |link|
  json.id       link.id
  json.companion do
    json.id         link.companion.id
    json.username   link.companion.username
  end
  json.traveller do
    json.id         link.traveller.id
    json.username   link.traveller.username
  end
end
