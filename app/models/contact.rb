class Contact < MailForm::Base
	attribute :first_name, :validate => true
	attribute :last_name, :validate => true
	attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	attribute :subject
	attribute :message, :validate => true
	attribute :nickname, :captcha => true

	def headers 
		{
			:subject => "Contact Form",
			:to => "m3restaurant.barlounge@gmail.com",
			:from => %("#{first_name.capitalize} #{last_name.capitalize}" <#{email}>)
		}
	end
end