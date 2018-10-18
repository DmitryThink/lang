class QueueList < ApplicationRecord
  has_many :queue_list_items

  belongs_to :language_from, :class_name => "Language"
  belongs_to :language_to, :class_name => "Language"
  belongs_to :user
  belongs_to :current_queue_list_item, :class_name => "QueueListItem", optional: true
  has_one :current_user, :class_name => "User", :foreign_key => "current_queue_list_id"


  after_create :push_items

  def update_items
    queue_list_items_list = available_queue_list_items
    transaction_list = Translation.where(language_from: language_from, language_to: language_to).where("id > ?", queue_list_items.last.translation.id)
    if queue_list_items_list.count < 2 && transaction_list.count > 0
      QueueListItem.create!(translation: transaction_list.first, queue_list: self)
    end
  end

  def push_items
    Translation.where(language_from: language_from, language_to: language_to).shuffle.first(50).each do |translation|
      QueueListItem.create!(translation: translation, queue_list: self)
    end
  end

  def available_queue_list_items
    queue_list_items.where("time_of_appearance < ? or time_of_appearance is null", Time.now)
  end
end
