require 'pry'
require_relative 'constants'
require_relative 'grid'
require_relative 'toy_robot'

grid = Grid.new(WIDTH, DEPTH)
toy  = ToyRobot.new(grid)

puts "Enter your commands:"
command_string = STDIN.gets.chomp
puts "\n-------------\n"

commands = command_string.split(" ")
index_of_first_place = commands.index(PLACE)

commands.each_with_index do |command, i|
  next unless i >= index_of_first_place
  case command
  when PLACE
    # get coordinates from next command
    coords = *commands[i+1].split(",")
    toy.place(*coords)
  when MOVE
    toy.move
  when LEFT
    toy.left
  when RIGHT
    toy.right
  when REPORT
    toy.report
  end
end
