module PoliciesRestApi
  class Client
    class << self
      def get_policy_by_id(policy_id)
        response = send_get_request("/policies/#{policy_id}")
        parsed_response(response)
      end

      private

      def uri
        ENV['POLICIES_REST_API_URL']
      end

      def send_get_request(suffix)
        Faraday.get(uri + suffix)
      end

      def parsed_response(response)
        JSON.parse(response.body, symbolize_names: true)
      end
    end
  end
end