require 'socket'
require 'json'

host = 'localhost'
port = 2000
path = "/index.html"

socket = TCPSocket.open(host, port)
puts socket.gets
while true
	puts "Which request do you want to send? (GET or POST)"
	answer = gets.chomp
	response = case answer
	when "GET" then
		request = "GET /index.html HTTP/1.0\r\n\r\n"
	when "POST" then
		puts "Enter name."
		name = gets.chomp
		puts "Enter email."
		email = gets.chomp
		viking = {:viking => {:name=>name, :email=>email} }.to_json
		request = "POST / HTTP/1.0\r\nContent-Length: #{viking.length}\r\n#{viking}\r\n"
	when "QUIT" then
		request = "QUIT\r\n\r\n"
	else
		puts "I don't know how to #{answer}."
	end		
	puts request
	socket.print(request)
	while response = socket.gets
		puts response
	end
	puts "end"
end
