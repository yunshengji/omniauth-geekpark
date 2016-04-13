module OmniAuth
  module Strategies
    class GeekPark < OmniAuth::Strategies::OAuth2
      option :client_options, {
        site: 'http://www.geekpark.net',
        authorize_url: 'http://www.geekpark.net/oauth/authorize',
        token_url: 'http://www.geekpark.net/oauth/token'
      }

      uid { raw_info['uuid'] }

      info do
        {
          username: raw_info['username'],
          realname: raw_info['realname'],
          email: raw_info['email'],
          company: raw_info['company'],
          position: raw_info['position'],
          mobile: raw_info['mobile'],
          avatar: raw_info['avatar'],
          bio: raw_info['bio'],
          mygeekpark_open_id: raw_info['mygeekpark_open_id'],
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/user').parsed || {}
      end
    end
  end
end

OmniAuth.config.add_camelization 'geekpark', 'GeekPark'
