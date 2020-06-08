require 'open-uri'
require 'pdf-reader'
require 'csv'
require 'docx'

Dir.foreach('place files here') do |file|
    next if file == "." || file == ".."
    if file.include? ".pdf"
        name = file.to_s
        begin
            reader = PDF::Reader.new("place files here/#{name}")
            reader.pages.each do |page|
                email = page.text.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9_-]+)/)
                CSV.open("emails.csv", "a") do |csv|
                    csv << [email] unless !email
                end
            end
        rescue
            puts "Unable to read #{name}"
        end 
    elsif file.include? ".docx"
        name = file.to_s
        reader = Docx::Document.open("place files here/#{name}")
        reader.paragraphs.each do |para|
            email = para.text.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9_-]+)/)
            CSV.open("emails.csv", "a") do |csv|
                csv << [email] unless !email
            end
        end
    end
end

puts "Done!"