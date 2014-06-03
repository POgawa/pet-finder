class UserMailer < ActionMailer::Base
  default from: 'nospam211@yahoo.com'   # <-------------------------------------- OHS email address here


  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'  # <-------------------------------------------- URL of Login Page
    mail(to: @user.email, subject: "Welcome to the Oregon Humane Society's Pet Finder!")
  end


  def found_pet_email(message)
    @owner_email = message.owner_email
    @owner_phone = message.owner_phone
    @message = message.message
    @sender_email = message.sender_email

    mail(to: @owner_email, subject: 'Oregon Humane Society- Someone may have found your lost pet!', from: @sender_email)
  end


  def lost_pet_email(message)
    @owner_email = message.owner_email
    @owner_phone = message.owner_phone
    @message = message.message
    @sender_email = message.sender_email

    mail(to: @owner_email, subject: 'Oregon Humane Society- Someone may know the pet you have found!', from: @sender_email)
  end
end
