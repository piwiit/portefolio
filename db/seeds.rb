# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
Project.destroy_all
User.destroy_all

admin = User.new(email: 'essais@hotmail.fr', password: 'azerty')
admin.save!
10.times do
  discotroc =
    Project.new(
      title: 'Discotroc',
      description:
        "Vos goûts musicaux ont changé et vos vieux disques ne vous intéressent plus ? Vous pourriez les échanger.C'est exactement ce que nous vous proposons !Discotroc connecte les passionnés de musique et leurs disques à travers le monde. Votre discothèque devient virtuellement illimitée",
      url: 'https://discotroc.herokuapp.com/'
    )
  picture =
    URI.open(
      'https://res.cloudinary.com/dtevenab3/image/upload/v1608074578/Capture_d_%C3%A9cran_de_2020-12-16_00-13-54_qqlnfp.png'
    )
  discotroc.picture.attach(
    io: picture, filename: 'discotroc.png', content_type: 'picture/png'
  )
  discotroc.save!
end
