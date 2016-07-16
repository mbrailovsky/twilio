# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
imagesDir = "db/images/"
catalogItems = CatalogItem.create([
                                      {id: 1, name: 'Item1', price: 1000, image: File.open("#{imagesDir}/1_angel.jpg")},
                                      {id: 2, name: 'Item2', price: 2000, image: File.open("#{imagesDir}/2_bowl.jpg")},
                                      {id: 3, name: 'Item3', price: 3000, image: File.open("#{imagesDir}/3_candle.jpg")},
                                      {id: 4, name: 'Item4', price: 4000, image: File.open("#{imagesDir}/4_centerpiece.jpg")},
                                      {id: 5, name: 'Item5', price: 5000, image: File.open("#{imagesDir}/5_dish.jpg")},
                                      {id: 6, name: 'Item6', price: 6000, image: File.open("#{imagesDir}/6_lamp.jpg")},
                                      {id: 7, name: 'Item7', price: 7000, image: File.open("#{imagesDir}/7_lantern.jpg")},
                                      {id: 8, name: 'Item8', price: 8000, image: File.open("#{imagesDir}/8_paintings.jpg")},
                                      {id: 9, name: 'Item9', price: 9000, image: File.open("#{imagesDir}/9_vase.jpg")},
                                      {id: 10, name: 'Item10', price: 10000, image: File.open("#{imagesDir}/10_tray.jpg")},
                                  ])

User.create! :email => 'admin@example.com', :password => 'supersecret', :password_confirmation => 'supersecret'
