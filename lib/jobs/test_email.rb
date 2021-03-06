require_dependency 'email_sender'

module Jobs

  # Asynchronously send an email
  class TestEmail < Jobs::Base

    def execute(args)

      raise Discourse::InvalidParameters.new(:to_address) unless args[:to_address].present?

      message = TestMailer.send_test(args[:to_address])
      EmailSender.new(message, :test_message).send
    end

  end

end
