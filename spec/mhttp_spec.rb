# frozen_string_literal: true

require 'rspec'
require 'socket'

RSpec.describe 'mhttp.rb' do
  before(:all) do
    # Start the server
    @server_pid = Process.spawn('ruby ./mhttp.rb')
    sleep(1) # lol do better

    # Client socket
    @socket = TCPSocket.new 'localhost', 9009
  end

  it 'receives an HTTP/0.9 request' do
    @socket.puts("GET /")
    response = @socket.gets
    expect(response).to eq("<html>This is the index.</html>\n")
  end

  it 'receives an unsupported (in 0.9) method request' do
    @socket.puts("HEAD /")
    # response = @socket.gets
    # expect(response).to eq("not supported")
  end

  after(:all) do
    @socket.close

    # Stop the server
    Process.kill('HUP', @server_pid)
  end
end

