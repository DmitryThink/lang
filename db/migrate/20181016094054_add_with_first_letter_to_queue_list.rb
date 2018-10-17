class AddWithFirstLetterToQueueList < ActiveRecord::Migration[5.2]
  def change
    add_column :queue_lists, :with_first_letter, :boolean, default: false
  end
end
