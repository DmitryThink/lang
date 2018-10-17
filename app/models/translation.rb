class Translation < ApplicationRecord
  belongs_to :language_from, :class_name => "Language"
  belongs_to :language_to, :class_name => "Language"
  belongs_to :word_from, :class_name => "Word"
  belongs_to :word_to, :class_name => "Word"
  has_many :queue_list_items
  has_many :translations, through: :queue_list_items
end
