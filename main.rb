require 'mini_exiftool'
require 'pathname'

photos = Pathname.glob('*.jpg')
photos.each do |p|
  puts p.to_s
  data = MiniExiftool.new(p.to_s)
  data['Description'] = data['Image_Description']
  data['Caption-Abstract'] = data['Image_Description']
  data['Date_Created'] = data['Date_Time_Original']
  data['Modify_Date'] = data['Date_Time_Original']
  data['Create_Date'] = data['Date_Time_Original']
  data.save
  puts 'Saved'
end
