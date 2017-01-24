json.array! @meals do |meal|
  date_format = meal.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'
  json.id meal.id
  json.title meal.title
  json.start meal.start.strftime(date_format)
  json.end meal.end.strftime(date_format)
  json.color meal.color unless meal.color.blank?
  json.allDay meal.all_day_event? ? true : false
  json.update_url meal_path(meal, method: :patch)
  json.edit_url edit_meal_path(meal)
end
