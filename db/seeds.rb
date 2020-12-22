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
      "Vos goûts musicaux ont changé et vos vieux disques ne vous intéressent plus ? Vous pourriez les échanger.C'est exactement ce que nous vous proposons !Discotroc connecte les passionnés de musique et leurs disques à travers le monde. Votre discothèque devient virtuellement illimitée",
    url: 'https://discotroc.herokuapp.com/'
  ) #photo = "100_km.png"
picture =
  URI.open(
    'https://res.cloudinary.com/dtevenab3/image/upload/v1608074578/discotroc.png'
  )
discotroc.picture.attach(
  io: picture, filename: 'discotroc.png', content_type: 'image/png'
)
discotroc.save!
