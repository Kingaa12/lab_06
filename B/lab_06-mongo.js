use weatherData

db.createCollection("mayors")

db.createCollection("cities")

db.mayors.insertOne({"firstname": "John","lastname": "Doe","birthdate": "1970-01-01","political_party": "Independent","terms_served": [{"start_year": 1998,"end_year": 2002,"city": "CityA"}]})

var mayorId = db.mayors.findOne({"firstname": "John", "lastname": "Doe"})._id

db.cities.insertOne({
"name": "CityA",
"years": [
    {
        "year": 1999,
        "population": 100000,
        "income_distribution": {
            "percent_poor": 20,
            "percent_middle": 50,
            "percent_wealthy": 30
        },
        "weather": {
            "total_precipitation": 500,
            "temperature": {
                "annual_high": 30,
                "annual_low": -5
            }
        },
        "mayor": mayorId
    }]
})

db.mayors.updateOne(
{ "_id": ObjectId("65db974903d053d624025118") },
{ $set: { "lastname": "Anastasio" } }
);

db.mayors.deleteOne({ "_id": ObjectId("65db974903d053d624025118") });