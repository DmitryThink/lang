russian =  Language.find_by(name: "Russian") || Language.create!(name: "Russian")
english = Language.find_by(name: "English") || Language.create!(name: "English")

apple_en =  Word.find_by(name: "Apple", language: english) || Word.create!(name: "Apple", language: english)
banana_en = Word.find_by(name: "Banana", language: english) || Word.create!(name: "Banana", language: english)
car_en = Word.find_by(name: "Car", language: english) || Word.create!(name: "Car", language: english)

apple_ru = Word.find_by(name: "Яблоко", language: russian) || Word.create!(name: "Яблоко", language: russian)
banana_ru = Word.find_by(name: "Банан", language: russian) || Word.create!(name: "Банан", language: russian)
car_ru = Word.find_by(name: "Машина", language: russian) || Word.create!(name: "Машина", language: russian)

Translation.find_by(language_from: russian, language_to: english, word_from: apple_ru, word_to: apple_en) || Translation.create!(language_from: russian, language_to: english, word_from: apple_ru, word_to: apple_en)
Translation.find_by(language_from: russian, language_to: english, word_from: banana_ru, word_to: banana_en) || Translation.create!(language_from: russian, language_to: english, word_from: banana_ru, word_to: banana_en)
Translation.find_by(language_from: russian, language_to: english, word_from: banana_ru, word_to: banana_en) || Translation.create!(language_from: russian, language_to: english, word_from: car_ru, word_to: car_en)

File.readlines('db/eng-rus.txt').each do |line|
  eng_rus_array = line.gsub("\r\n", '').split(' -- ')
  word_en = Word.find_by(name: eng_rus_array[0], language: english) || Word.create!(name: eng_rus_array[0], language: english)
  word_ru = Word.find_by(name: eng_rus_array[1], language: russian) || Word.create!(name: eng_rus_array[1], language: russian)
  Translation.find_by(language_from: russian, language_to: english, word_from: word_ru, word_to: word_en) || Translation.create!(language_from: russian, language_to: english, word_from: word_ru, word_to: word_en)
end