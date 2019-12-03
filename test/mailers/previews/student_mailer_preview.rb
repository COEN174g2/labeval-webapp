# Preview all emails at http://localhost:3000/rails/mailers/student_mailer
class StudentMailerPreview < ActionMailer::Preview
	def reminder_email_preview
		StudentMailer.reminder_email(Student.first)
	end
end
