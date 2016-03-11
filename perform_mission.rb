require './Rover'
fileObj = File.new('missioninput.txt', 'r')
line_with_plateau_dims = fileObj.gets
while (line_with_pos = fileObj.gets)
  rover = Rover.new

  items = line_with_pos.split(' ')
  rover.init(items[0].to_i, items[1].to_i, items[2])

  line_with_mission_params = fileObj.gets
  rover.process(line_with_mission_params)

  puts rover.status
end
fileObj.close
