from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import requests
import datetime

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///test.db'
db = SQLAlchemy(app)

lst_countrtinfo=requests.get("https://api.covid19api.com/countries")
lst_c=lst_countrtinfo.json()
lst_countrysummary=(requests.get("https://api.covid19api.com/summary")).json()
lst=lst_countrysummary["Countries"]

for i in lst:
    print(i)
    print()

class Country(db.Model):

    id = db.Column(db.Integer, primary_key=True)
    country = db.Column(db.String(120), nullable=False)
    slug = db.Column(db.String(80), nullable=False)
    iso2 = db.Column(db.String(50), nullable=False)

    def __repr__(self):
        return '<country %r , slug %r, iso2 %r>' % self.country, self.slug, self.iso2

class CountrySummary(db.Model):

    id = db.Column(db.Integer, primary_key=True)
    country = db.Column(db.String(120), nullable=False)
    countrycode = db.Column(db.String(20), nullable=False)
    slug =  db.Column(db.String(80), nullable=False)
    newconfirmed = db.Column(db.Integer, nullable=False)
    totalconfirmed = db.Column(db.Integer, nullable=False)
    newdeaths = db.Column(db.Integer,nullable=False)
    totaldeaths = db.Column(db.Integer, nullable=False)
    newrecovered = db.Column(db.Integer,nullable=False)
    totalrecovered = db.Column(db.Integer, nullable=False)
    date = db.Column(db.String(120),nullable=False)


db.create_all()

for i in lst_c:
    u = Country(country = i['Country'], slug = i['Slug'],iso2 = i['ISO2'])
    db.session.add(u)
    db.session.commit()

for i in lst:
    u = CountrySummary(country = i['Country'], countrycode = i['CountryCode'], slug = i['Slug'], newconfirmed = i['NewConfirmed'], totalconfirmed = i['TotalConfirmed'], newdeaths = i['NewDeaths'], totaldeaths = i['TotalDeaths'], newrecovered = i['NewRecovered'], totalrecovered = i['TotalRecovered'], date = i['Date'])
    db.session.add(u)
    db.session.commit()

    