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

User.create! :email => 'admin@example.com', :password => 'supersecret', :password_confirmation => 'supersecret',
	:login_id => 'admin', :first_name => 'Admin', :last_name => 'Admin', :street_address => '2600 Tower Oaks Blvd',
        :city => 'Rockville', :state => 'MD', :zip => '20852', :cc_number => '1111222233334444', :cc_exp_date => '01/2090',
        :cvv => '111', :security_answer => 'admin answer'

securityQuestions = SecurityQuestion.create([
                                      {id: 1, question: 'What is the name of your first pet?'},
                                      {id: 2, question: 'Where did you go to high school?'},
                                      {id: 3, question: 'Which city were you born?'},
                                      {id: 4, question: 'Which is your favority city to visit?'},
                                      {id: 5, question: 'What is your favorite food?'}
                                  ])
