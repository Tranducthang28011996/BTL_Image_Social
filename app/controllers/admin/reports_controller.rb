class Admin::ReportsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :is_admin

  def index
    @reports = Report.all.order updated_at: :desc
    render layout: "admin/application"
  end

  def update
    @report = Report.find params[:id]
    return render json: 1 if @report.update_attributes report_params
    render json: 0
  end

  private

  def report_params
    params.require(:report).permit :done
  end
end
