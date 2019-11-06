class AdminController < ApplicationController
  def index
  end

  def upload
  	xlsx = Roo::Spreadsheet.open('./public/regdata.xlsx')
    s = xlsx.sheet(0)
    courses = []
    title = []
    instructor = []
    @z = []

    # all columns have same num of rows
    for i in (0...s.column(3).length) do 
      courses[i] = { :cid => s.column(3)[i] + s.column(4)[i]}
      title[i] = { :name => s.column(5)[i] }
      instructor[i] = { :pname => s.column(7)[i] }
    end

    for i in (0...courses.length) do 
      @z[i] = (courses[i].merge!(title[i])).merge!(instructor[i])
    end

    # no section differences
    @z = @z.uniq
    @z = @z[1..]

    # spreadsheet upload results
    respond_to do |format|
      begin
        Questionnaire.create!(@z)
        format.html { render :upload, notice: 'Registration Data Successfully Uploaded' }
      rescue
        format.html { render :upload, notice: 'Error Uploading Data' }
      end
  	end

  end

  def email(course, url)
    exec( "echo 'This is a reminder that you have not completed the evaluation for #{course} yet. Click here to complete: #{url}' | mail -s 'Lab Evaluation Reminder' jluo1@scu.edu" )
  end

end
