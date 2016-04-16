json.user do
  json.id              @user.id
  json.name            @user.name
  json.email           @user.email
  json.phone           @user.phone
end

json.session do
  json.session_token   @session.session_token
end