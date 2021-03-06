# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

cat1.products.create!({
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel1.jpg'),
  quantity: 10,
  price: 64.99
})

cat1.products.create!({
  name:  'Women\'s Zebra pants',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel2.jpg'),
  quantity: 18,
  price: 124.99
})

cat1.products.create!({
  name:  'Hipster Hat',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel3.jpg'),
  quantity: 4,
  price: 34.49
})

cat1.products.create!({
  name:  'Hipster Socks',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel4.jpg'),
  quantity: 8,
  price: 25.00
})

cat1.products.create!({
  name:  'Russian Spy Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel5.jpg'),
  quantity: 8,
  price: 1_225.00
})

cat1.products.create!({
  name:  'Human Feet Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel6.jpg'),
  quantity: 82,
  price: 224.50
})


cat2.products.create!({
  name:  'Modern Skateboards',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics1.jpg'),
  quantity: 40,
  price: 164.49
})

cat2.products.create!({
  name:  'Hotdog Slicer',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics2.jpg'),
  quantity: 3,
  price: 26.00
})

cat2.products.create!({
  name:  'World\'s Largest Smartwatch',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics3.jpg'),
  quantity: 32,
  price: 2_026.29
})

cat3.products.create!({
  name:  'Optimal Sleeping Bed',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture1.jpg'),
  quantity: 320,
  price: 3_052.00
})

cat3.products.create!({
  name:  'Electric Chair',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture2.jpg'),
  quantity: 2,
  price: 987.65
})

product1 = cat3.products.create!({
  name:  'Red Bookshelf',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture3.jpg'),
  quantity: 23,
  price: 2_483.75
})

user1 = User.create( first_name: '1', last_name: '1', email: '1@g.com', password: '1', password_confirmation: '1')

user2 = User.create( first_name: '2', last_name: '2', email: '2@g.com', password: '2', password_confirmation: '2')

Review.destroy_all

user1.reviews.create!({ product_id: 1, description:"tubulostriato unterrifiable raptril caudillism naturopathy gastrolith katsup misbaptize smurr maximistic scrippage prosaical oligodynamic myrabalanus kynurenic elevated clubfisted autotoxication outjut expurge majagua absolutist unghostly tenableness", rating:1 })

user2.reviews.create!({product_id:1, description:"convertend inobservancy chromoplastid pastryman ansate antiabrin daroo underproportion measurelessly licentiation herpetotomist hymnodist intil pinkly acronical Casuarina psoriasic foeman stenciler pumper andromania spoutman nonevaporation ers", rating:2 })

user1.reviews.create!({product_id:3, description:"unctorium immix bisulphide Actinocrinus unjaded faze Mystacocete Wendish degrain uroxin ergodic superregenerative unbarricaded anthroic Aphanapteryx thack damped unrighteousness nonleprous granulous synkinetic hyperrational tensional platinization", rating:3 })

user1.reviews.create!({product_id:4, description:"isagon fissate inheritable atypically cairngorm bounteous uncloudy opsonization perididymitis spheterize rivetless guarana anaconda overbusy raking unslip Chilognatha shelfy antilacrosser parturiency monoureide flowerer geo coaltitude", rating:4 })

user1.reviews.create!({product_id:5, description:"cohesibility colorability narica underdone Micraster Allotriognathi ooporphyrin costated archesporial bugfish krome hematemesis sociodrama quadricrescentic coinstantaneity rhinolophid ethnogeography limonium releasee demodulator Neotremata blotto minx wiredraw", rating:5 })

user1.reviews.create!({product_id:6, description:"newsletter myxoid manlessly nonexaggeration spectroheliograph frustrater coleopterological Pompilus Statehouse Eurytomidae perkily uncorrupting recurvate columelliform phototypic unpressed granulomatous widespreadness subvisible naringin vis resward counterermine Carrara", rating:6 })

puts "DONE!"
