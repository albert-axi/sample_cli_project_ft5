class CLI
    def initialize
        Scraper.new.scrape_courses
    end

    def start
        puts "Welcome to the Academy Xi Courses"
        puts ""
        list_courses
        input = prompt_user.to_i
        selected_course = Course.all[input - 1]
        selected_course.print_course
    end

    def list_courses
        Course.all.each.with_index(1) do |course, index|
            puts "#{index}. #{course.title}"
        end
    end

    def prompt_user
        puts "Input the number of the course that you want to view"
        puts ""
        gets
    end
end
