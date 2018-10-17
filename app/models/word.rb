class Word < ApplicationRecord
  has_many :translation_from, :class_name => "Translation", :foreign_key => "word_from_id"
  has_many :translation_to, :class_name => "Translation", :foreign_key => "word_to_id"

  belongs_to :language

  validates :name, presence: true, uniqueness: { scope: :language }
end
