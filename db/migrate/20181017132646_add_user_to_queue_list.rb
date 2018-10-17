class AddUserToQueueList < ActiveRecord::Migration[5.2]
  def change
    add_reference :queue_lists, :user, index: true
  end
end
