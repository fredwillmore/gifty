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
  u.role_ids = [Role.where({key: 'admin'}).first.id]
}
User.where( { email: 'yy@example.com', first_name: 'Yvonne', last_name: 'Yarkington', title: 'Mrs' } ).first_or_create { |u|
  u.password = 'helloooo'
  u.password_confirmation = 'helloooo'
  u.role_ids = [Role.where({key: 'default'}).first.id]
}
User.where( { email: 'boss@aztronaut.com', first_name: 'Boss', last_name: 'Hoggy', title: 'Mr' } ).first_or_create { |u|
  u.password = 'helloooo'
  u.password_confirmation = 'helloooo'
  u.role_ids = [Role.where({key: 'merchant'}).first.id]
}
