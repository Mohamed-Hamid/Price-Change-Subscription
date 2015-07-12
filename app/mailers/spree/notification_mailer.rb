class Spree::NotificationMailer < ActionMailer::Base
  default from: Spree::Config[:mails_from] 

  #TODO: Sender names, sender emails, recipient email
    #recipient name

  def mail_to_subscriber(product)
    @product = product
    opts = {}

    opts[:to] = @product.subscribers_emails product
    opts[:subject] = 'Price Change Notification'

    mail(opts)
  end
end