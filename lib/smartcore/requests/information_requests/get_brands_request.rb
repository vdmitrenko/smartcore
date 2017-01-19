module Smartcore
  class GetBrandsRequest < BaseRequest

    def execute
      responce = execute_request
      if responce.status == success_status
        Smartcore::BrandsResponse.new(JSON.parse(responce.body)).brands
      else
        process_error(responce)
      end
    end

    def path
      '/brands'
    end

  end
end