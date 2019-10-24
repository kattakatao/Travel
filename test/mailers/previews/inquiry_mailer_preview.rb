# Preview all emails at http://localhost:3000/rails/mailers/inquiry_mailer
class InquiryMailerPreview < ActionMailer::Preview
	def inquiry
		inquiry = Inquiry.new(name: "濱中　宏太", email: "kattakatao@icloud.com", message: "こんにちは", category: "1")

		InquiryMailer.send_mail(inquiry)
	end
end
