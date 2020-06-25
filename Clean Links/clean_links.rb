require "csv"

def cleanLinks (file, removal_text)
    contents = CSV.open "#{file}.csv", headers: true, header_converters: :symbol
    contents.each do |row|
        link = row[:links]
        CSV.open("purged.csv", "a") do |csv|
            csv << [removeRef(link, removal_text)]
        end
    end
    puts "Done! Please double-check your links to make sure they work." 
    puts "If not, delete the purged.csv file and try again."
    puts "Double check your removal text. Last time, you entered: #{removal_text}."
end

def removeRef (link, removal_text)
    removal_spot = link.index(removal_text)
    link[0..removal_spot]
end

puts "Welcome to LinkCleaner 5000!"
puts "If you make a mistake at any point while running this program, simply press Ctrl + C and start again."
puts "..."
puts "What is the name of the CSV file containing your unclean links? Don't include the extension."
file_name = gets.chomp
puts "Where do you want to chop the links? For example, if you're cleaning Amazon links, you may want to remove /ref and everything that comes after it."
puts "Whatever you enter, I'll remove it and EVERYTHING that follows."
removal_text = gets.chomp

cleanLinks(file_name, removal_text)