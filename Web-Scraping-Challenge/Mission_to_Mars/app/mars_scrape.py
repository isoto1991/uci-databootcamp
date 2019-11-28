from splinter import Browser
from bs4 import BeautifulSoup
import time

def init_browser(): 
    executable_path = {"executable_path": "chromedriver.exe"}
    return Browser("chrome", **executable_path, headless=False)

def scrape(): 
    browser = init_browser()
    
    #create empty dictionaries to hold all the scraped data
    mars = {
        "mars_news_title": news_title, 
        "mars_news_p": news_p, 
        "mars_image": mars_image(browser), 
        "mars_hemisphers": mars_hemispheres(browser), 
        "mars_weather": mars_weather(browser), 
    }

    browser.quit()
    return mars_scrape_dict 

def mars_nasa_news(browser): 

    #collect the latest News Title and Paragraph Text
    NASA_url = "https://mars.nasa.gov/news/"
    browser.visit(NASA_url)
    html = browser.html
    soup = BeautifulSoup(html, "html.parser")

    news_title = soup.find("div", "a", class_="content_title").get_text()
    mars_news["news_p"] = soup.find("div", class_="article_teaser_body").get_text()

    browser.quit()

    return mars_news     