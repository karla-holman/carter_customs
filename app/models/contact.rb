class Contact < MailForm::Base
  attribute :first_name,      :validate => true
  attribute :last_name
  attribute :phone,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :subject,      :validate => true
  attribute :message
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "My Contact Form",
      :to => "holmankarla@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end