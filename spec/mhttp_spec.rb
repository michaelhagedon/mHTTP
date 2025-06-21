# frozen_string_literal: true

require 'rspec'
require 'socket'

RSpec.describe 'mhttp.rb' do
  it 'receives an HTTP/0.9 request' do
    socket = TCPSocket.new 'localhost', 9009
    socket.puts("GET /")
    response = socket.gets
    expect(response).to eq("<html>some HTML</html>\n")
    socket.close
  end
end
