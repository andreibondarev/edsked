# Creating initial users
pass = '12345678'
User.where(first_name: 'Andrei', last_name: 'Bondarev', email: 'andrei.bondarev13@gmail.com').first_or_create(password: pass, password_confirmation: pass, organization_id: 1)
User.where(first_name: 'James', last_name: 'Bondarev', email: 'jflowers@me.com').first_or_create(password: pass, password_confirmation: pass, organization_id: 1)
User.where(first_name: 'Andrei', last_name: 'Bondarev', email: 'rwemerson0386@gmail.com').first_or_create(password: pass, password_confirmation: pass, organization_id: 1)
User.where(first_name: 'Chihiro', last_name: 'Kawana', email: 'chihiro.kawana107@gmail.com').first_or_create(password: pass, password_confirmation: pass, organization_id: 1)
User.where(first_name: 'Kevin', last_name: 'Morrison', email: 'k.francis.morrison@gmail.com').first_or_create(password: pass, password_confirmation: pass, organization_id: 1)
