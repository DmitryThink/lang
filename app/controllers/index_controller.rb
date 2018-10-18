class IndexController < ApplicationController
  def index
    @queue_list = QueueList.new
    if current_user.current_queue_list.present?
      redirect_to "/queue_list_items/#{current_user.current_queue_list.id}"
    else
      render :list if current_user.queue_lists.count > 0
    end
  end

  def create
    @queue_list = QueueList.create!(queue_list_params.merge!(user:current_user))
    redirect_to "/queue_list_items/#{@queue_list.id}"
  end

  def destroy
    QueueList.find(params[:id]).destroy!
    redirect_to '/'
  end

  private

  def queue_list_params
    params.require(:queue_list).permit(:language_from_id, :language_to_id)
  end

  def word_params
    params.require(:word).permit(:name)
  end
end
