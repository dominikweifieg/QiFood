class Notifier < ActionMailer::Base  
  default_url_options[:host] = "www.qifood.eu"
  
  def password_reset_instructions(user, title = I18n.t('user.password_reset_instructions_title') )  
    from          "info@qifood.eu"  
    recipients    user.email  
    sent_on       Time.now  
    subject       title
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)  
  end  
end