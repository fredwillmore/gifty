# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.where( { name: 'Admin', key: 'admin' } ).first_or_create
Role.where( { name: 'Merchant', key: 'merchant' } ).first_or_create
Role.where( { name: 'Default', key: 'default' } ).first_or_create

User.where( { email: 'feely@aztronaut.com', first_name: 'Feely', last_name: 'Feelgood', title: 'Mr' } ).first_or_create { |u|
  u.password = 'helloooo'
  u.password_confirmation = 'helloooo'
  u.role_ids = [Role.where({key: 'default'}).first.id]
}
User.where( { email: 'felix@aztronaut.com', first_name: 'Felix', last_name: 'Feelgood', title: 'Mr' } ).first_or_create { |u|
  u.password = 'helloooo'
  u.password_confirmation = 'helloooo'
  u.role_ids = [Role.where({key: 'default'}).first.id]
}
User.where( { email: 'yy@example.com', first_name: 'Yvonne', last_name: 'Yarkington', title: 'Mrs' } ).first_or_create { |u|
  u.password = 'helloooo'
  u.password_confirmation = 'helloooo'
  u.role_ids = [Role.where({key: 'merchant'}).first.id]
}
User.where( { email: 'boss@aztronaut.com', first_name: 'Boss', last_name: 'Hoggy', title: 'Mr' } ).first_or_create { |u|
  u.password = 'helloooo'
  u.password_confirmation = 'helloooo'
  u.role_ids = [Role.where({key: 'admin'}).first.id]
}

# TODO: there are lots more place types than this - how do we manage presentation without overloading the UI
# this current list is taken straight from googlePlaces::PlaceTypes
# when we add more, might consider a separate field for google key (or is that just my key? don't remember)
MerchantType.where( key: 'art_gallery' ).first_or_create name: 'Art Gallery', icon_key: 'artgallery'
MerchantType.where( key: 'bar' ).first_or_create name: 'Bar', icon_key: 'bar'
MerchantType.where( key: 'bicycle_store' ).first_or_create name: 'Bicycle Store', icon_key: 'bicycle_shop'
MerchantType.where( key: 'book_store' ).first_or_create name: 'Book Store', icon_key: 'book'
MerchantType.where( key: 'clothing_store' ).first_or_create name: 'Clothing Store', icon_key: 'clothes'
MerchantType.where( key: 'department_store' ).first_or_create name: 'Department Store', icon_key: 'departmentstore'
MerchantType.where( key: 'electronics_store' ).first_or_create name: 'Electronics Store', icon_key: 'phones'
MerchantType.where( key: 'furniture_store' ).first_or_create name: 'Furniture Store', icon_key: 'homecenter'
MerchantType.where( key: 'hair_care' ).first_or_create name: 'Hair Care', icon_key: 'barber'
MerchantType.where( key: 'hardware_store' ).first_or_create name: 'Hardware Store', icon_key: 'tools'
MerchantType.where( key: 'home_goods_store' ).first_or_create name: 'Home Goods Store', icon_key: 'home-2'
MerchantType.where( key: 'jewelry_store' ).first_or_create name: 'Jewelry Store', icon_key: 'jewelry'
MerchantType.where( key: 'liquor_store' ).first_or_create name: 'Liquor Store', icon_key: 'liquor'
MerchantType.where( key: 'pet_store' ).first_or_create name: 'Pet Store', icon_key: 'pets'
MerchantType.where( key: 'restaurant' ).first_or_create name: 'Restaurant', icon_key: 'restaurant'
MerchantType.where( key: 'shoe_store' ).first_or_create name: 'Shoe Store', icon_key: 'shoes'
# non-google place types - have to wait on these for seed data
MerchantType.where( key: 'baby_store' ).first_or_create name: 'Baby Clothes/Accessories', icon_key: 'nursery'
MerchantType.where( key: 'vintage_store' ).first_or_create name: 'Vintage/Thrift Shop', icon_key: '2hand'
MerchantType.where( key: 'music_store' ).first_or_create name: 'Music Store', icon_key: 'music'
MerchantType.where( key: 'toy_store' ).first_or_create name: 'Toy Store', icon_key: 'toys'

thing = YAML.load_file('db/merchants.yml')

thing['merchants'].each do |merchant|
  Merchant.where( name: merchant[:name] ).first_or_create.tap do |m|
    athing = m
    m.merchant_type_ids = merchant[:merchant_type].map do |mt| MerchantType.where(key: mt).first.id rescue nil end.compact
    m.locations = [
      Location.create(latitude: merchant[:lat], longitude: merchant[:lng]) do |l|
        l.reverse_geocode
        l.save!
      end
    ]
    m.save!
  end
end

#
#Merchant.where( name: n ).first_or_create.tap do |m|
#
#m.locations = [
#    Location.where(address: "915 SE 35th ave apt 303 Portland OR 97214").first_or_create,
#    Location.where(address: "216 S Austin Blvd, Oak Park, IL 60304").first_or_create,
#    Location.where(address: "3425 Collins ave, miami beach, FL").first_or_create
#]
#m.save!

#names.each do |n|
#  Merchant.where( name: n ).first_or_create.tap do |m|
#    m.locations = []
#    rand(1..3).times do
#      m.locations << Location.where(address: "915 SE 35th ave apt 303 Portland OR 97214").first_or_create
#    end
#    m.save!
#  end
#end

##might save this but prob not
#names = [
#  'Acme, inc.',
#  'Widget Corp',
#'123 Warehousing',
#'Demo Company',
#'Smith and Co.',
#'Foo Bars',
#'ABC Telecom',
#'Fake Brothers',
#'QWERTY Logistics',
#'Demo, inc.',
#'Sample Company',
#'Sample, inc',
#'Acme Corp',
#'Allied Biscuit',
#'Ankh-Sto Associates',
#'Extensive Enterprise',
#'Galaxy Corp',
#'Globo-Chem',
#'Mr. Sparkle',
#'Globex Corporation',
#'LexCorp',
#'LuthorCorp',
#'North Central Positronics',
#'Omni Consimer Products',
#'Praxis Corporation',
#'Sombra Corporation',
#'Sto Plains Holdings',
#'Tessier-Ashpool',
#'Wayne Enterprises',
#'Wentworth Industries',
#'ZiffCorp',
#'Bluth Company',
#'Strickland Propane',
#'Thatherton Fuels',
#'Three Waters',
#'Water and Power',
#'Western Gas & Electric',
#'Mammoth Pictures',
#'Mooby Corp',
#'Gringotts',
#'Thrift Bank',
#'Flowers By Irene',
#'The Legitimate Businessmens Club',
#'Osato Chemicals',
#'Transworld Consortium',
#'Universal Export',
#'United Fried Chicken',
#'Virtucon',
#'Kumatsu Motors',
#'Keedsler Motors',
#'Powell Motors',
#'Industrial Automation',
#'Sirius Cybernetics Corporation',
#'U.S. Robotics and Mechanical Men',
#'Colonial Movers',
#'Corellian Engineering Corporation',
#'Incom Corporation',
#'General Products',
#'Leeding Engines Ltd.',
#'Blammo',
#'Input, Inc.',
#'Mainway Toys',
#'Videlectrix',
#'Zevo Toys',
#'Ajax',
#'Axis Chemical Co.',
#'Barrytron',
#'Carrys Candles',
#'Cogswell Cogs',
#'Spacely Sprockets',
#'General Forge and Foundry',
#'Duff Brewing Company',
#'Dunder Mifflin',
#'General Services Corporation',
#'Monarch Playing Card Co.',
#'Krustyco',
#'Initech',
#'Roboto Industries',
#'Primatech',
#'Sonky Rubber Goods',
#'St. Anky Beer',
#'Stay Puft Corporation',
#'Vandelay Industries',
#'Wernham Hogg',
#'Gadgetron',
#'Burleigh and Stronginthearm',
#'BLAND Corporation',
#'Nordyne Defense Dynamics',
#'Petrox Oil Company',
#'Roxxon',
#'McMahon and Tate',
#'Sixty Second Avenue',
#'Charles Townsend Agency',
#'Spade and Archer',
#'Megadodo Publications',
#'Rouster and Sideways',
#'C.H. Lavatory and Sons',
#'Globo Gym American Corp',
#'The New Firm',
#'SpringShield',
#'Compuglobalhypermeganet',
#'Data Systems',
#'Gizmonic Institute',
#'Initrode',
#'Taggart Transcontinental',
#'Atlantic Northern',
#'Niagular',
#'Plow King',
#'Big Kahuna Burger',
#'Big T Burgers and Fries',
#'Chez Quis',
#'Chotchkies',
#'The Frying Dutchman',
#'Klimpys',
#'The Krusty Krab',
#'Monks Diner',
#'Milliways',
#'Minuteman Cafe',
#'Taco Grande',
#'Tip Top Cafe',
#'Moes Tavern',
#'Central Perk',
#'Chasers'
#]
