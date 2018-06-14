class Blogpost
  attr_accessor :id, :content, :title

  def initialize(content, title)
    self.content = content
    self.title = title
  end
end