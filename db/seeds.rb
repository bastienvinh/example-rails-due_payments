require 'due_payments/landlord'

DuePayments::Landlord.create(firstname: 'Ginai', lastname: 'Kevin', address: '7 th Heaven Street London', zip_code: 'LD4 7GH', email: 'hsorse@worse.com')
DuePayments::Landlord.create(firstname: 'Miragda', lastname: 'Miranda', address: '677, On Street main', zip_code: 'DD4 9GF', email: 'sinddyÉyopmail.com')
DuePayments::Landlord.create(firstname: 'Movement', lastname: 'ShipsPoloto', address: '42 th Minaris', zip_code: 'CBF 7GH', email: 'gustaveÉworse.com')
DuePayments::Landlord.create(firstname: 'Carry', lastname: 'Michelle', address: '9 th madendon', zip_code: 'LD1 456', email: 'gmiaidasÉgul.com')

DuePayments::Estate.create(name: 'Super Villa in Burkimgham', landlord_id: 1, :price_per_acre => 123.34, acre: 340, zip_code: 'UJK O79', 
address: '7 th heaven street', geolocalisation: '', coordinate_points: '', description: 'Super beauitful estate to etablish a lot of constructionss. Holded by old lord in UK',
total_price: 234552232.23)

DuePayments::Estate.create(name: 'Cambridge communauty Ral', landlord_id: 2, :price_per_acre => 40.10, acre: 50, zip_code: 'TGB UIO', 
address: '9, street power house', geolocalisation: '', coordinate_points: '', description: 'Well unused estate for now',
total_price: 234552232.23)


# TODO : modify these properties  
DuePayments::Estate.create(name: 'Cambridge communauty Ral', landlord_id: 2, :price_per_acre => 40.10, acre: 50, zip_code: 'T7H UOO', 
address: '736, managi nmurin', geolocalisation: '', coordinate_points: '', description: 'Well unused estate for now',
total_price: 234552232.23)


DuePayments::Estate.create(name: 'Cambridge communauty Ral', landlord_id: 1, :price_per_acre => 40.10, acre: 50, zip_code: 'YUP 4YH', 
address: '76, north pole street', geolocalisation: '', coordinate_points: '', description: 'Well unused estate for now',
total_price: 234552232.23)


DuePayments::Estate.create(name: 'Cambridge communauty Ral', landlord_id: 4, :price_per_acre => 40.10, acre: 50, zip_code: '123 UIO', 
address: '9, narry moodn', geolocalisation: '', coordinate_points: '', description: 'Well unused estate for now',
total_price: 234552232.23)


DuePayments::Estate.create(name: 'Cambridge communauty Ral', landlord_id: 3, :price_per_acre => 40.10, acre: 50, zip_code: 'OIU 45H', 
address: '12, jumper director', geolocalisation: '', coordinate_points: '', description: 'Well unused estate for now',
total_price: 234552232.23)


DuePayments::Estate.create(name: 'Cambridge communauty Ral', landlord_id: 1, :price_per_acre => 40.10, acre: 50, zip_code: '45KI CAD', 
address: '67, merry christhmas', geolocalisation: '', coordinate_points: '', description: 'Well unused estate for now',
total_price: 234552232.23)

DuePayments::Estate.create(name: 'Cambridge communauty Ral', landlord_id: 4, :price_per_acre => 40.10, acre: 50, zip_code: '43I KJH', 
address: '80, minim street om board', geolocalisation: '', coordinate_points: '', description: 'Well unused estate for now',
total_price: 234552232.23)


DuePayments::Data::DPMStatusReminder.create(status_id: 0, name: 'None')
DuePayments::Data::DPMStatusReminder.create(status_id: 1, name: 'Cancelled')
DuePayments::Data::DPMStatusReminder.create(status_id: 2, name: 'Normal')
DuePayments::Data::DPMStatusReminder.create(status_id: 3, name: 'Problem')
DuePayments::Data::DPMStatusReminder.create(status_id: 4, name: 'Unpaid')
DuePayments::Data::DPMStatusReminder.create(status_id: 5, name: 'Paid')

Reminder.new(before_date: false, name: 'Quaterly', number_of_days: 0, number_of_months: 4, recycle_period: true).save
Reminder.new(before_date: false, name: 'Twice a year', number_of_days: 0, number_of_months: 6, recycle_period: true).save

puts 'Seed database ...'
