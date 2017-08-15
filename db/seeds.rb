# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# first admin
Organizer.create(name: 'Наталья Максименко',
                 description: 'Тестовый админский аккаунт',
                 email: 'natali.maximenko@gmail.com',
                 password: '9h4sx5jdp',
                 password_confirmation: '9h4sx5jdp')
