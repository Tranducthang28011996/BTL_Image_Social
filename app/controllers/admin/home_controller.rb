class Admin::HomeController < ApplicationController
  def index
    @users = User.all
    @photos = Photo.all
    @reports = Report.all
    render layout: "admin/application"
  end
end
