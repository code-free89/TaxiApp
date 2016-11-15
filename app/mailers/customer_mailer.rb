class CustomerMailer < ApplicationMailer
  default from: 'disp@trippytaxis.com'

  def arrived_email(driver, user)
    @driver = driver
    @user = user
    @url  = 'https://taxi-ror-app.herokuapp.com'
    # For test purposes, hardcode the target email, don't want to spam the world ...!
    mail(to: 'sarah.eggleston@alliants.com', subject: 'Your driver has arrived')
    end
end
