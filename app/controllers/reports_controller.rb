class ReportsController < ApplicationController
  before_action :authenticate_user!

  def create
    @report = Report.new report_params
    return render json: { status: 1 } if @report.save
    render json: { status: 0 }
  end

  private

  def report_params
    params.require(:report).permit :user_id, :photo_id
  end
end
