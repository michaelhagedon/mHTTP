# frozen_string_literal: true

require 'socket'

server = TCPServer.new 9009

loop do
  client = server.accept
  client.puts '<html>some HTML</html>'
end
