class CreateDictionaryController < ApplicationController
  def index
    @translation = Translation.new
  end

  def create
    @translation = Translation.new(translation_params)
    @queue_list = QueueList.new
    render :update
  end

  def update
    @translation = Translation.new(translation_params)
    if @translation.queue_list_items.first.present?
      @queue_list = @translation.queue_list_items.first.queue_list
    else
      @queue_list = QueueList.create!(language_from: @translation.language_from, language_to: @translation.language_to)
    end
    QueueListItem.create!(translation: @translation, queue_list: @queue_list)
    @translation = Translation.create!(language_from: @translation.language_from, language_to: @translation.language_to)
    render :update
  end

  def destroy
    redirect_to '/'
  end

  private

  def translation_params
    params.require(:translation).permit(:language_from_id, :language_to_id)
  end

  def word_from
    params.require(:translation).require(:word_from)["name"]
  end

  def word_to
    params.require(:translation).require(:word_to)["name"]
  end
end
