class StudentMailer < ApplicationMailer
	default from: 'lab-eval-reminders@scu.edu'

	def reminder_email(student)
		@student = student
		mail(to: @student.email, subject: 'Lab Evaluation Reminder')
	end
end
