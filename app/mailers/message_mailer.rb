class MessageMailer < ActionMailer::Base

	default to: 'kattakatao1018@gmail.com'

	def received_email(message)
		@message = message
		mail(subject: 'お客様よりお問い合わせが届きました') do |format|
			format.text
		end
	end
end