# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

russian = Language.create!(name: "Russian")
english = Language.create!(name: "English")

apple_en = Word.create!(name: "Apple", language: english)
banana_en = Word.create!(name: "Banana", language: english)
car_en = Word.create!(name: "Car", language: english)

apple_ru = Word.create!(name: "Яблоко", language: russian)
banana_ru = Word.create!(name: "Банан", language: russian)
car_ru = Word.create!(name: "Машина", language: russian)

Translation.create!(language_from: russian, language_to: english, word_from: apple_ru, word_to: apple_en)
Translation.create!(language_from: russian, language_to: english, word_from: banana_ru, word_to: banana_en)
Translation.create!(language_from: russian, language_to: english, word_from: car_ru, word_to: car_en)