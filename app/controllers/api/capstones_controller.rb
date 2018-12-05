class Api::CapstonesController < ApplicationController
  def index
    @capstones = Capstone.all
    render "index.json.jbuilder"
  end

  def create
    @capstone = Capstone.new(
      student_id: params[:student_id],
      name: params[:name],
      description: params[:description],
      url: params[:url]
      )
    @capstone.save
    render "show.json.jbuilder"
  end

  def show
    @capstone = Capstone.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def update
    @capstone = Capstone.find_by(id: params[:id])
    @capstone.update(
    student_id: params[:student_id],
    name: params[:name],
    description: params[:description],
    url: params[:url]
      )
    render "show.json.jbuilder"
  end

  def destroy
    @capstone = Capstone.find_by(id: params[:id])
    @capstone.destroy
    render json: {message: "capstone sucessfully destroyed!"}
  end
end
