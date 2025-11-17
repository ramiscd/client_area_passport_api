json.name @user.name

json.passport_statuses @user.passport_statuses do |status|
  json.name status.name
  json.current status.current
end