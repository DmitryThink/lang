class Language < ApplicationRecord
  has_many :translations_from, :class_name => "Translation", :foreign_key => "language_from_id"
  has_many :translations_to, :class_name => "Translation", :foreign_key => "language_to_id"

  has_many :queue_lists_from, :class_name => "QueueList", :foreign_key => "language_from_id"
  has_many :queue_lists_to, :class_name => "QueueList", :foreign_key => "language_to_id"

  has_many :words

  validates :name, presence: true, uniqueness: true
end
