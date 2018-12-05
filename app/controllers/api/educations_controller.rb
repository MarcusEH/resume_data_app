class Api::EducationsController < ApplicationController
  def index
    @educations = Education.all
    render "index.json.jbuilder"    
  end

  def show
    @education = Education.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def create
    @education = Education.new(
      student_id: params[:student_id],
      start_date: params[:start_date],
      end_date: params[:end_date],
      degree: params[:degree],
      university_name: params[:university_name],
      details: params[:details]
      )
    if @education.save
      render "show.json.jbuilder"
    else
      render json: {errors: @education.errors.full_messages}, status: :bad_request
    end
  end

  def update
    @education = Education.find_by(id: params[:id])
    @education.student_id = params[:student_id]
    @education.start_date = params[:start_date]
    @education.end_date = params[:end_date]
    @education.degree = params[:degree]
    @education.university_name = params[:university_name]
    @education.details = params[:details]
    @education.save 
    render 'show.json.jbuilder'
  end

  def destroy
    @education = Education.find_by(id: params[:id])
    @education.destroy
    render json: {message: "Education sucessfully destroyed!"}
  end
end
