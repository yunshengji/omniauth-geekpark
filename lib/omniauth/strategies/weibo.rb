module OmniAuth
  module Strategies
    class Weibo < OmniAuth::Strategies::OAuth2
      option :client_options, {
        site: "https://api.weibo.com",
        authorize_url: "/oauth2/authorize",
        token_url: "/oauth2/access_token",
      }

      option :token_params, parse: :json

      uid { raw_info['id'] }

      info do
        {
          nickname: raw_info['screen_name'],
          avatar: raw_info['avatar_large'],
          bio: raw_info['description']
        }
      end

      extra do { raw_info: raw_info } end

      def raw_info
        @uid ||= begin
                   access_token.options[:mode] = :query
                   access_token.get('/2/account/get_uid.json').parsed["uid"]
                 end

        @raw_info ||= access_token.get('/2/users/show.json', params: {uid: @uid}).parsed
      end
    end
  end
end

OmniAuth.config.add_camelization "weibo", "Weibo"
