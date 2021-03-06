module Smartcore
  class ConfirmEmailRequest < TokenRequest

    attribute :token, String

    def execute
      response = execute_request_with_token
      if response.status == success_status
        Smartcore::UserProfileResponse.new(JSON.parse(response.body))
      else
        process_error(response)
      end
    end

    def path
      router.confirm_email_path
    end
  end
end
