module Smartcore
  class GetBrandsWithRelationsRequest < BaseRequest
    attribute :brand_id, String

    def execute
      responce = execute_request
      if responce.status == success_status
        Smartcore::BrandsResponse.new(JSON.parse(responce.body)).brands
      else
        process_error(responce)
      end
    end

    def path
      '/brands/cigarette_skus'
    end

  end
end