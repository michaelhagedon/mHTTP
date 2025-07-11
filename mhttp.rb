# frozen_string_literal: true

require 'socket'

server = TCPServer.new 9009

loop do
  client = server.accept
  request = client.gets
  client.puts '<html>This is the index.</html>'
end
