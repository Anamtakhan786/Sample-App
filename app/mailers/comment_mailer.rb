class CommentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_mailer.user_comment.subject
  #
  def user_comment(user)
    @greeting = "Hi"
    mail to: "to@example.org" , subject: "Comment on Micropost"
   
  end
end
