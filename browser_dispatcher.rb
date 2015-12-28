require "selenium-webdriver"

class BrowserDispatcher

  def initialize
    @driver = Selenium::WebDriver.for :firefox
    @driver.navigate.to "https://www.youtube.com/watch?v=a66_g9XngIg"
    prevent_autoplay
  end

  def go(url)
    puts "going to #{url}"
    @driver.navigate.to url
  end

  private
  def prevent_autoplay
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until { @autoplay = @driver.find_element(:id, "autoplay-checkbox") }

    # Wait for YouTube to do it's thing
    sleep 2

    if @autoplay && @autoplay.selected?
      @autoplay.click
    end
  end
end
