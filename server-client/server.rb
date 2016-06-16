require 'socket'
require 'json'

server = TCPServer.open(2000)
loop{
	client = server.accept
	client.puts(Time.now.ctime)
	request = client.gets
	method = case request.split(" ")[0]
	when "GET" then
		client.puts "test"
		filename = request.split(" ")[1].split("/")[-1]
		if File.exist?(filename)
			 client.puts File.read(filename)
		else
			client.puts "404 File does not exist."
		end
	when "POST" then
		client.gets
		params = JSON.parse(client.gets)
		sub = "<li>Name: #{params['viking']['name']}</li><li>Email: #{params['viking']['email']}</li>"
		client.puts File.read("thanks.html").gsub('<%= yield %>', sub)
	when "QUIT" then
		client.puts "Closing the connection. Bye!"
		client.close
	else
		client.puts "I don't know how to #{request.split(" ")[0]}."
	end
}
