counter = 1

Dir.foreach('/Users/brandon/Downloads/Art Toys/') do |filename|
    path = '/Users/brandon/Downloads/Art Toys'
    file = path + "/" + filename
    newfile = path + "/" + "Best Art Toys For Kids #{counter}.jpg"
    if filename.include?(".jpg") || filename.include?(".jpeg")
        File.rename(file, newfile)
    end
    counter += 1
end