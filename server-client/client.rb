require 'socket'

hostname = 'localhost'
port = 2000

s = TCPSocket.open(hostname, port)


	puts s.read

s.close
