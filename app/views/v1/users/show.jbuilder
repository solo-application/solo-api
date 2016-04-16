json.user do
  json.id              @user.id
  json.username        @user.username
  json.companions @user.companions do |companion|
    json.id            companion.id
    json.username      companion.username
  end
end
