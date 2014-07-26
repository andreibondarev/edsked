# Creating initial users
User.where(email: 'andrei.bondarev13@gmail.com').first_or_create(password: '12345678', password_confirmation: '12345678')
User.where(email: 'jflowers@me.com').first_or_create(password: '12345678', password_confirmation: '12345678')
User.where(email: 'rwemerson0386@gmail.com').first_or_create(password: '12345678', password_confirmation: '12345678')
User.where(email: 'chihiro.kawana107@gmail.com').first_or_create(password: '12345678', password_confirmation: '12345678')
User.where(email: 'k.francis.morrison@gmail.com').first_or_create(password: '12345678', password_confirmation: '12345678')
