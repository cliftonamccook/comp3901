require "test_helper"

class UserNotificationMailerTest < ActionMailer::TestCase
  test "send_credentials" do
    mail = UserNotificationMailer.send_credentials
    assert_equal "Send credentials", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
