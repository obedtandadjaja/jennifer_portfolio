# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

jennifer = User.create([
		first_name: "Jennifer",
		last_name: "Wiriawan",
		age: 18,
		phone_number: "+65-8619-5705",
		occupation: "Design studet at Lasalle",
		bio: "Love obed"
	])