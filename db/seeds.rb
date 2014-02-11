# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Song.delete_all
Artist.delete_all

beat = Artist.create(name: "The Beatles", genre: "Rock", photo_url: "http://johnrieber.files.wordpress.com/2013/03/down-the-abbey-road-the-beatles-25438292-1600-1200.jpg")
beat.songs.create(title: "Yellow Submarine", year: 1966)
beat.songs.create(title: "Here Comes the Sun", year: 1969)
beat.songs.create(title: "While My Guitar Gently Weeps", year: 1968)

joel = Artist.create(name: "Billy Joel", genre: "Rock", photo_url: "http://assets-s3.rollingstone.com/assets/images/artists/304x304/billy-joel.jpg")
joel.songs.create(title: "The Entertainer", year: 1974)
joel.songs.create(title: "River of Dreams", year: 1993)