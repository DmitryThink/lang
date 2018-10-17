class TestController < ApplicationController
  # before_action :set_queue_list
  def show
    set_queue_list
    set_current_translation
    render :error if @queue_list_item.nil?
    @queue_list.update!(current_queue_list_item: @queue_list_item)
    current_user.update!(current_queue_list: @queue_list)
  end

  def update
    @queue_list = QueueList.find(params[:id])
    @queue_list_item = @queue_list.current_queue_list_item
    render :error if @queue_list_item.nil?
    if @queue_list_item.word_to.name.downcase != word.downcase
      if @queue_list_item.index_of_time > 0
        @queue_list_item.index_of_time = 0
      elsif @queue_list_item.index_of_time > -4
        @queue_list_item.index_of_time -= 1
      end
      @queue_list_item.save!
      @queue_list_item.errors.add(:base, "Wrong word!")
      render :show
    else
      begin
        @queue_list_item.index_of_time += 1
        @queue_list_item.save!
        @queue_list.update_items
        @queue_list.reload
        if @queue_list_item.index_of_time > 0
          @queue_list_item = @queue_list.available_queue_list_items.sample
        end
        @queue_list.update!(current_queue_list_item: @queue_list_item)
        render :show
      rescue
        render :error
      end
    end
  end

  def show_word
    @queue_list = current_user.current_queue_list
    @queue_list_item = @queue_list.current_queue_list_item
    @word = @queue_list_item.word_to.name
    render :show
  end

  def destroy
    current_user.update!(current_queue_list: nil)
    redirect_to '/'
  end

  private

  def set_queue_list
    @queue_list = QueueList.find(params[:id])
    raise Error unless current_user.queue_lists.include?(@queue_list)
  end

  def set_current_translation
    @queue_list_item = @queue_list.current_queue_list_item || @queue_list.available_queue_list_items.sample
  end

  def word
    params.require(:queue_list_item).require(:translation)["name"]
  end
end
