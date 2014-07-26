# Creating initial users
pass = '12345678'
User.where(first_name: 'Andrei', last_name: 'Bondarev', email: 'andrei.bondarev13@gmail.com').first_or_create(password: pass, password_confirmation: pass, organization_id: 1)
User.where(first_name: 'James', last_name: 'Flowers', email: 'jflowers@me.com').first_or_create(password: pass, password_confirmation: pass, organization_id: 1)
User.where(first_name: 'Rwemerson', last_name: 'Rwemerson', email: 'rwemerson0386@gmail.com').first_or_create(password: pass, password_confirmation: pass, organization_id: 1)
User.where(first_name: 'Chihiro', last_name: 'Kawana', email: 'chihiro.kawana107@gmail.com').first_or_create(password: pass, password_confirmation: pass, organization_id: 1)
User.where(first_name: 'Kevin', last_name: 'Morrison', email: 'k.francis.morrison@gmail.com').first_or_create(password: pass, password_confirmation: pass, organization_id: 1)

Period.where(period_name: 'Period 1').first_or_create(start_time: "07:30", end_time: "08:25")
Period.where(period_name: 'Period 2').first_or_create(start_time: "08:30", end_time: "09:25")
Period.where(period_name: 'Period 3').first_or_create(start_time: "09:30", end_time: "10:25")
Period.where(period_name: 'Period 4').first_or_create(start_time: "10:30", end_time: "11:25")
Period.where(period_name: 'Period 5').first_or_create(start_time: "11:30", end_time: "12:25")
Period.where(period_name: 'Period 6').first_or_create(start_time: "12:30", end_time: "13:25")
Period.where(period_name: 'Period 7').first_or_create(start_time: "13:30", end_time: "14:25")
Period.where(period_name: 'Period 8').first_or_create(start_time: "14:30", end_time: "15:25")
Period.where(period_name: 'Period 9').first_or_create(start_time: "15:30", end_time: "16:25")
