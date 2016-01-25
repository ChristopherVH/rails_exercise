require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users.json',
  query_values: {
   'some_category[a_key]' => 'another value',
   'some_category[a_second_key]' => 'yet another value',
   'some_category[inner_inner_hash][key]' => 'value',
   'something_else' => 'aaahhhhh'
 }
).to_s



# puts RestClient.get(url)

def create_user
    url = Addressable::URI.new(
      scheme: 'http',
      host: 'localhost',
      port: '3000',
      path: '/users.json'
  ).to_s

  puts RestClient.post(
    url,
    { user: { name: "Mittens"} }
  )
end

#create_user

def show_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: '3000',
    path: '/users/2.json'
  ).to_s

  puts RestClient.get(url)
end

# show_user

def update_user(user_id)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: '3000',
    path: "/users/#{user_id}.json"
  ).to_s

  puts RestClient.patch(url, { user: {email: 'drypants@ranhome.com'}})
end

update_user(5)

# def destroy_user
#   url = Addressable::URI.new(
#     scheme: 'http',
#     host: 'localhost',
#     port: '3000',
#     path: '/users/3.json'
#   ).to_s
#
#   puts RestClient.delete(url)
# end

# destroy_user
