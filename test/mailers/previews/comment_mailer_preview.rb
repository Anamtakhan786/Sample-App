# Preview all emails at http://localhost:3000/rails/mailers/comment_mailer
class CommentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/comment_mailer/user_comment
  def user_comment
  	comment = Comment.first
    CommentMailer.user_comment
  end

end
