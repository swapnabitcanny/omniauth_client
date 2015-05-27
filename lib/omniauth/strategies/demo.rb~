module OmniAuth
  module Strategies
    class Demo < OmniAuth::Strategies::OAuth2
      option :name, :demo

      option :client_options, {
        site: "http://localhost:3000",
        authorize_path: "/oauth/authorize"
      }

      uid do
        raw_info["id"]
      end

      info do
        {name: raw_info["name"]}
      end

      def raw_info
        @raw_info ||= access_token.get('/demo_data').parsed
      end
    end
  end
end
