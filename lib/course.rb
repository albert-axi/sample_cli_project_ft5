class Course
    attr_accessor :title, :desc, :content, :url

    @@all=[]

    def initialize attributes
        attributes.each do |key, value| 
            send("#{key}=", value)
        end
        
        self.class.all << self
    end

    def print_course
        system("clear")
        puts "==============================="
        puts "TITLE: #{title}"
        puts "==============================="
        puts Scraper.new.scrape_course_content url
    end

    def self.all
        @@all
    end
end