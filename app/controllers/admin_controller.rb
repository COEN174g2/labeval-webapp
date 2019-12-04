class AdminController < ApplicationController
  def index
  end

  def upload
  	xlsx = Roo::Spreadsheet.open('./public/regdata.xlsx')
    s = xlsx.sheet(0)
    courses = []
    title = []
    instructor = []
    studentid = []
    @z = []

    # all columns have same num of rows
    for i in (0...s.column(3).length) do 
      courses[i] = { :cid => s.column(3)[i] + s.column(4)[i]}
      title[i] = { :name => s.column(5)[i] }
      instructor[i] = { :pname => s.column(7)[i] }
      studentid[i] = { :studentid => s.column(9)[i] }
    end

    for i in (0...courses.length) do 
      @z[i] = ((courses[i].merge!(title[i])).merge!(instructor[i])).merge!(studentid[i])
    end

    # no section differences
    @z = @z.uniq
    @z = @z[1..]

    # spreadsheet upload results
    respond_to do |format|
      begin
        format.html { render :upload, notice: 'Data Successfully Uploaded' }
        if Questionnaire.size > 0
          for i in (0...@z.length) do 
            Questionnaire.update(@z[i])
          end
        else
          Questionnaire.create(@z)
        end
      rescue
        format.html { render :upload, notice: 'Error Uploading Data' }
      end
  	end

  end

  def email
    respond_to do |format|
      format.html { render :email, notice: 'Sent reminders successfully!' }
    end
  end

  def sendemail
    respond_to do |format|
      format.html { redirect_to admin_email_path, notice: 'Sent reminders successfully!' }
    end
    
    if params[:isnow] == 'true'
      print "true"
      Student.all.each do |student|
        if !student.email.blank?
          StudentMailer.reminder_email(student).deliver!
        end
      end
    else
      print "false"
      Student.all.each do |student|
        if !student.email.blank?
          StudentMailer.reminder_email(student).deliver_later!(wait: 1.day)
        end
      end
    end
  end

end
