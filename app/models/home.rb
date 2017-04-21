class Home < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Contact Glenn",
      :to => mailer_env,
      :from => %("#{name}" <#{email}>)
    }
  end

  private
    def mailer_env
      email = "laurievlangdon@gmail.com"
      if Rails.env.production?
        email
      else
        email = "glennlangdon@gmail.com"
      end
    end
end
