puts "EventManager Initialized!"

lines = File.readlines "event_attendees.csv"
lines.each do |line|
	columns = line.split(",")
	puts columns
end
