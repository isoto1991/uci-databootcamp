from flask import Flask, render_template, redirect
from flask_pymongo import PyMongo
import mars_scrape

app = Flask(__name__)

# use flask to set up to the mongo server
app.config["MONGO_URI"] = "mongodb://localhost:27017/mars_app"
mongo = PyMongo(app)

@app.route("/")
def index(): 
    mars_news = mongo.db.mars_news.find_one()
    return render_template("index.html", mars_news=mars_news)

@app.route("/scrape")
def scraper():
    mars_news = mongo.db.mars_news
    mars_news_data = mars_scrape.scrape()
    mars_news.update({}, mars_news_data, upsert=True)
    return redirect("/", code=302)

if __name__ == "__main__": 
    app.run(debug=True)
