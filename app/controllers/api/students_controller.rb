class Api::StudentsController < ApplicationController
  before_action :authenticate_user, except: [:index]
     
  # GET /students
  # GET /students.json
  def index
    @students = Student.all
    render json: @students #status:
  end

  # GET /students/1
  # GET /students/1.json
  def show
    if current_user
      puts "\n\n\tcurrent user: #{current_user} #{current_user.email}\n\n"
      @student = Student.find_by(id: current_user.student_id)
      puts "student: #{@student}"
      render json: @student
    else
      puts "\n\n\tno current user / CU failed\n\n"
      @student = Student.find_by(id: params[:id])
      render json: @student
    end
  end

  # # GET /students/new
  # def new
  #   @student = Student.new
  # end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(
      first_name: params[:first_name] || "",
      last_name: params[:last_name] || "",
      email: params[:email] || current_user.email || "",
      phone_number: params[:phone_number] || "",
      short_bio: params[:short_bio] || "",
      linkedin_url: params[:linkedin_url] || "",
      twitter_handle: params[:twitter_handle] || "",
      personal_blog_url: params[:personal_blog_url] || "",
      online_resume_url: params[:online_resume_url] || "",
      github_url: params[:github_url] || "",
      photo_url: params[:photo_url] || ""
      )     
    if @student.save
      render json: @student, status: 201
    end 
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    student = Student.find_by(id: params[:id])
    student.update(
      first_name: params[:first_name] || student.first_name || "",
      last_name: params[:last_name] || student.last_name || "",
      email: params[:email] || student.email || "",
      phone_number: params[:phone_number] || student.phone_number || "",
      short_bio: params[:short_bio] || student.short_bio || "",
      linkedin_url: params[:linkedin_url] || student.linkedin_url || "",
      twitter_handle: params[:twitter_handle] || student.twitter_handle || "",
      personal_blog_url: params[:personal_blog_url] || student.personal_blog_url || "",
      online_resume_url: params[:online_resume_url] || student.online_resume_url || "",
      github_url: params[:github_url] || student.github_url || "",
      photo_url: params[:photo_url] || student.photo_url || ""
      )      
  end

end


