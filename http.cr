require "ecr"
require "http/server"

require "./rayons"

port = 8080

class ItemView
  @item: Rayons::Item

  def initialize
    @item = Rayons.new.get_random_item
  end

  ECR.def_to_s("index.ecr")
end

server = HTTP::Server.new(port) do |context|
  context.response.content_type = "text/html"
  context.response.print ItemView.new.to_s
end

puts "Listening on http://0.0.0.0:#{port}"
server.listen
