require 'rest-client'

def check_profile_info(user)

  response = API.get('http://195.13.194.180:8090/api/profile',
                                 headers: {'Authorization' => user.auth_token },
                                 cookies: {})
  assert_status_code(200, response, "Check profile info")

  response_hash = JSON.parse(response)

  #Check if id is correct
  assert_equal(user.id, response_hash['id'], 'Ids dont match!')
  #Check if email is correct
  assert_equal(user.email, response_hash['email'], 'Email is not correct!')
  #Check if email is correct
  assert_equal(user.firstName, response_hash['firstName'], 'firstName is not correct!')
end