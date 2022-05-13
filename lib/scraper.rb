class Scraper
    BASE_URL = "https://academyxi.com"

    def get_page url = BASE_URL
        Nokogiri::HTML(open(url))
    end

    def scrape_courses
        doc = get_page

        doc.css(".list-entry-col").collect do |course|
            title = course.css(".entry-title").text.strip
            desc = course.css("p").text.strip
            url = course.css("a").attr("href").value

            Course.new(title: title, desc: desc, url: url)
        end.first
    end

    def scrape_course_content url
        page_url = url.include?(BASE_URL) ? url : "#{BASE_URL}#{url}"
        doc = get_page page_url

        p_content = doc.css("div.elementor-text-editor p").first
        p_content.text.strip
    end
end