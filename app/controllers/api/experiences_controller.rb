class Api::ExperiencesController < ApplicationController
  def index
    @experiences = Experience.all
    render "index.json.jbuilder"
  end

  def create
    @experience = Experience.new(
      student_id: params[:student_id],
      start_date: params[:start_date],
      end_date: params[:end_date],
      job_title: params[:job_title],
      company_name: params[:company_name],
      details: params[:details]
      )
    @experience.save
    render "show.json.jbuilder"
  end

  def show
    @experience = Experience.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def update
    @experience = Experience.find_by(id: params[:id])
    @experience.update(
    student_id: params[:student_id],
    start_date: params[:start_date],
    end_date: params[:end_date],
    job_title: params[:job_title],
    company_name: params[:company_name],
    details: params[:details]
      )
    render "show.json.jbuilder"
  end

  def destroy
    @experience = Experience.find_by(id: params[:id])
    @experience.destroy
    render json: {message: "Experience sucessfully destroyed!"}
  end
end
