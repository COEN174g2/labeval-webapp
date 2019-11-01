class SessionsController < ApplicationController
  def new
  end

  def create
  	student = Student.find_by(studentid: params[:ID])
    professor = Professor.find_by(name: params[:ID])
    if student && student.authenticate(params[:password])
      session[:user_id] = student.studentid
      session[:type] = "student"
      redirect_to student, notice: "You're logged in!"
    elsif professor && professor.authenticate(params[:password])
      session[:user_id] = professor.name
      session[:type] = "professor"
      redirect_to professor, notice: "You're logged in!"
    else
      flash.now[:alert] = "ID or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You're logged out!"
  end

  def profile
    student = Student.find_by(studentid: session[:user_id])
    professor = Professor.find_by(name: session[:user_id])
    if session[:type] == "student"
      redirect_to student
    elsif session[:type] == "professor"
      redirect_to professor
    else
      redirect_to root_url
    end
  end
end
