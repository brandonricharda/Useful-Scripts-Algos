require 'docx'
require 'csv'

@file = Docx::Document.open('./Files/Schedules/FILE_GOES_HERE.docx')

@months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

@raw_text = []
@result = {}

def text_sort
    current_date = ""
    current_project = ""
    @raw_text.each do |paragraph|
        current_date = paragraph.text.strip if date?(paragraph)
        current_project = paragraph.text.strip if project_name?(paragraph)
        if worker_name?(paragraph)
            @result[paragraph.text.strip] = [] unless @result[paragraph]
            @result[paragraph.text.strip] << current_date
            @result[paragraph.text.strip] << current_project
        end
    end
end

def initial_parse
    @file.paragraphs.each do |paragraph|
        @raw_text << paragraph unless paragraph.text.empty? || time?(paragraph)
    end
end

#if the paragraph starts with a number, it's the time
def time?(paragraph)
    return paragraph.text[0].match(/\A\d+\z/)
end

#if the paragraph contains a month, it's a date
def date?(paragraph)
    result = false
    @months.each do |month|
        result = true if paragraph.text.include?(month) && !paragraph.text.include?("Schedule")
    end
    result
end

#if the paragraph contains an emphasized character, it's a project name
def project_name?(paragraph)
    return paragraph.to_html.include?("strong")
end

#if the paragraph contains between one and two words and no digits, it's a worker's name
def worker_name?(paragraph)
    return paragraph.text.split(" ").length.between?(1, 2) && !paragraph.text.match?(/\d/)
end

#driver script that creates the CSV file
def create_sheet
    initial_parse
    text_sort
    @result.each do |worker, projects|
        CSV.open("./Files/Finished Files/#{worker}.csv", "a") do |csv|
            projects.each do |project|
                csv << [project]
            end
        end
    end
end