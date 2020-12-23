# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

User.destroy_all
Project.destroy_all

admin = User.new(email: 'bouillaux@hotmail.fr', password: 'azerty')
admin.save!

discotroc =
  Project.new(
    title: 'discotroc ',
    description:
      "Your musical tastes have changed and your old records no longer interest you? You could trade them in. That's exactly what we offer! Discotroc connects music lovers and their records across the world. Your nightclub becomes virtually unlimited",
    url: 'https://discotroc.herokuapp.com/'
  )
discotroc.save!
