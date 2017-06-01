json.array! @shelters do |shelter|
  json.extract! shelter, :name
  json.provider shelter.provider.name
end