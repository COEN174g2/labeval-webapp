class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(student)
    # Do something later
    @student = student
    StudentMailer.reminder_email(@student).deliver_later
  end
end
