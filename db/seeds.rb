# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
games = Game.create([{title: 'The Legend of Zelda: Breath of the Wild',
                      description: 'An open world The Legend of Zelda game full of discovery, exploration and adventure.',
                      image_url: 'https://images-na.ssl-images-amazon.com/images/I/717QQ088aRL._AC_SL1500_.jpg',
                      price: 49.99, release_date: Date.new(2017,3,3), game_console: 'Nintendo Switch'},
                     {title: 'Super Mario 3D All-Stars',
                      description: '3 Mario games in 1 collection',
                      image_url: 'https://images-na.ssl-images-amazon.com/images/I/81tkL0RYLQL._AC_SL1500_.jpg',
                      price: 49.99, release_date: Date.new(2020,9,18), game_console: 'Nintendo Switch'},
                     {title: 'Hyrule Warriors: Age of Calamity',
                      description: 'A prequel to The Legend of Zelda: Breath of the Wild',
                      image_url: 'https://images-na.ssl-images-amazon.com/images/I/91cC-adDU6L._AC_SL1500_.jpg',
                      price: 49.99, release_date: Date.new(2020,11,20), game_console: 'Nintendo Switch'},
                     {title: 'Paper Mario: The Origami King',
                      description: 'A Paper Mario game on the switch',
                      image_url: 'https://images-na.ssl-images-amazon.com/images/I/81fiJoH9krL._AC_SL1500_.jpg',
                      price: 49.99, release_date: Date.new(2020,7,17), game_console: 'Nintendo Switch'},
                     {title: 'Super Mario 3D World + Bowser\'s Fury',
                      description: 'A 3D Mario game on the switch',
                      image_url: 'https://images-na.ssl-images-amazon.com/images/I/81QixbutCXL._AC_SL1500_.jpg',
                      price: 49.99, release_date: Date.new(2021,2,12), game_console: 'Nintendo Switch'},
                     {title: 'Marvel’s Spider-Man: Miles Morales',
                     description: 'A Spider-Man game on the PS5',
                     image_url: 'https://images-na.ssl-images-amazon.com/images/I/81wXH8IqhKL._AC_SL1500_.jpg',
                     price: 49.99, release_date: Date.new(2020,11,12), game_console: 'PS5'},
                     {title: 'Sackboy: A Big Adventure',
                      description: 'A Sackboy game on the PS5',
                      image_url: 'https://images-na.ssl-images-amazon.com/images/I/91MrTxrYdyL._AC_SL1500_.jpg',
                      price: 59.99, release_date: Date.new(2020,11,12), game_console: 'PS5'},
                     {title: 'FIFA 21',
                     description: 'A FIFA game on the XBOX',
                     image_url: 'https://images-na.ssl-images-amazon.com/images/I/8110jFc6oXL._AC_SL1500_.jpg',
                     price: 49.99, release_date: Date.new(2020,10,9), game_console: 'Xbox Series X'},
                     {title: 'Lego Star Wars: The Skywalker Saga',
                      description: 'A Lego Star Wars game on the XBOX',
                      image_url: 'https://m.media-amazon.com/images/I/81IXB+Qy0GL._AC_SL1500_.jpg',
                      price: 49.99, release_date: Date.new(2021,3,31), game_console: 'Xbox Series X'}])
