class Admin::HomeController < ApplicationController
  before_action :is_admin

  def index
    @users = User.all
    @photos = Photo.all
    @reports = Report.all
    render layout: "admin/application"
  end
end
