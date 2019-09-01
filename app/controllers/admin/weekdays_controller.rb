class Admin::WeekdaysController < ApplicationController
  before_action :authenticate_web_user!
  before_action :set_weekday, only: %i[edit update] # rubocop:disable Rails/LexicallyScopedActionFilter

  def update
    respond_to do |format|
      if @weekday.update(weekday_params)
        @weekday.touch
        format.html { redirect_to root_path }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def set_weekday
    @weekday = Weekday.find(params[:id])
  end

  def weekday_params
    params.require(:weekday).permit(pairs_attributes: %i[id name kind start_time end_time place _destroy])
  end
end