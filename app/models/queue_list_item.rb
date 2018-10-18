class QueueListItem < ApplicationRecord
  belongs_to :queue_list
  belongs_to :translation

  has_one :word_to, through: :translation
  has_one :current_queue_list, :class_name => "QueueList", :foreign_key => "current_queue_list_item_id"

  after_save :set_time_of_appearance, if: :saved_change_to_index_of_time?

  validates :translation, uniqueness: { scope: :queue_list }
  validates :index_of_time, :inclusion => -2..(self.list_of_time.count+1)

  def tip
    if queue_list.with_first_letter
      "#{word_to.name[0]} " + '• ' * word_to.name.size - 1
    else
      '• ' * word_to.name.size
    end
  end

  def list_of_time
    [ 1.minutes, 2.minutes, 10.minutes, 1.hours, 2.hours, 12.hours, 1.days, 1.months, 1.years ]
  end

  def set_time_of_appearance
    if self.index_of_time > self.list_of_time.count
      self.destroy!
    elsif self.index_of_time > 0
      self.update!(time_of_appearance: Time.now + self.list_of_time[index_of_time-1])
    end
  end
end
