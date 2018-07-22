require 'test_helper'

class CommentMailerTest < ActionMailer::TestCase
  test "user_comment" do
    mail = CommentMailer.user_comment
    assert_equal "User comment", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
