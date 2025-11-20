json.array! @addresses do |address|
  json.id address.id
  json.street address.street
  json.city address.city
  json.state address.state
  json.country address.country
  json.zip_code address.zip_code
  json.complement address.complement
  json.user_id address.user_id
end
