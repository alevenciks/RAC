require 'rest-client'

def sign_up_positive
  payload = {
      'email' => 'aleksejs@siltumnica.com',
      'firstName' => 'Aleksejs',
      'lastName' => 'Levenciks',
      'password' => 'password1'
  }.to_json

  response = API.post('http://195.13.194.180:8090/api/sign-up',
                                            headers: {'Content-Type' => 'application/json'},
                                            cookies: {},
                                            payload: payload)

  # Check if 200OK is received
  assert_status_code(200, response, "Sign up")
end