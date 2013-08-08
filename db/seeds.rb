# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ke = User.create(
                 email: 'a@a.com',
                 password: 'password',
                 password_confirmation: 'password',
                 first_name: 'Ke',
                 last_name: 'Li',
                 gender: 'Male',
                 birth_date: '1990-07-13',
                 about: (('A man a plan' * 8) + "\n") * 8,
                 political_views: 'None',
                 religious_views: 'Militant Atheist',
                 looking_for: 'Emberjs mentorship',
                 interested_in: 'Haxxors',
                 favorite_quotes: "There is only one god, and his name is Death.  And when he comes for us, there is only one thing we say to him: not today.\n" * 8)

ek = User.create(
                 email: 'b@b.com',
                 password: 'password',
                 password_confirmation: 'password',
                 first_name: 'Li',
                 last_name: 'Ke',
                 gender: 'Male',
                 birth_date: '1990-07-13',
                 about: (('Panama canal lol ' * 8) + "\n") * 8,
                 political_views: 'None',
                 religious_views: 'Militant Atheist',
                 looking_for: '',
                 interested_in: 'Haxxors',
                 favorite_quotes: "My lords, my lords!  Here is what I have to say about these two kings.  Pfft!  Renly is nothing to me, nor Stannis neither!  Why should they rule over me and mine from some flowery seat in the south?  What do they know of the wall, or the wolfswood?  Even their gods are wrong!  It was the dragons we married, and the dragons are all dead!  There sits the only king I mean to bend my knee to... the King in the North!\n" * 8)
