require 'rest-client'

def create_blogpost_positive(blogpost, user)
  payload = {
      'content' => blogpost.content,
      'title' => blogpost.title
  }.to_json

  response = API.post('http://195.13.194.180:8090/api/post',
                      headers: {'Content-Type' => 'application/json', 'Authorization' => user.auth_token},
                      cookies: {},
                      payload: payload)

  assert_status_code(200, response, "Create blogpost")

  response_hash = JSON.parse(response)

  # Check if blogpost created with correct title and content
  assert_equal(blogpost.content, response_hash['content'], 'Blogpost content is not correct')
  assert_equal(blogpost.title, response_hash['title'], 'Blogpost title is not correct')

  blogpost.id = response_hash['id']
end

def get_blogpost_positive(blogpost, user)
  response = API.get('http://195.13.194.180:8090/api/post?id=' + blogpost.id.to_s,
                     headers: {'Authorization' => user.auth_token},
                     cookies: {})

  assert_status_code(200, response, "Get blogpost")

  response_hash = JSON.parse(response)

  # Check if returned blogpost is equal to created
  assert_equal(blogpost.id, response_hash['id'], 'Returned blogpost id is not correct')
  assert_equal(blogpost.title, response_hash['title'], 'Returned blogpost title is not correct')
  assert_equal(blogpost.content, response_hash['content'], 'Returned blogpost content is not correct')
end

def update_blogpost_positive(blogpost, user)
  newContent = String.new(rand(36**20).to_s(36))
  newTitle = String.new(rand(36**10).to_s(36))

  payload = {
      'content' => newContent,
      'title' => newTitle
  }.to_json

  response = API.put('http://195.13.194.180:8090/api/post?post_id=' + blogpost.id.to_s,
                      headers: {'Content-Type' => 'application/json', 'Authorization' => user.auth_token},
                      cookies: {},
                      payload: payload)

  assert_status_code(200, response, "Blogpost updated")

  response_hash = JSON.parse(response)

  # Check if blogpost updated correctly
  assert_equal(newContent, response_hash['content'], 'Blogpost content is not correct')
  assert_equal(newTitle, response_hash['title'], 'Blogpost title is not correct')

  blogpost.content = response_hash['content']
  blogpost.title = response_hash['title']
end