module OmniAuth
  module GeekPark
    module Helper
      def token
        token? ? super : refresh_token!
      end

      def token?
        self[:token].present? && (Time.current < expires_at)
      end

      def refresh_token!
        return unless refresh_token.present?

        res = Faraday.post "https://account.geekpark.net/oauth2/token" do |req|
          req.body = { grant_type: 'refresh_token',
                       refresh_token: refresh_token,
                       client_id: ENV['GEEKPARK_KEY'],
                       client_secret: ENV['GEEKPARK_SECRET'] }
        end

        if res.status == 200
          body = JSON.parse(res.body)
          update(token: body["access_token"], expires_at: (Time.now + body['expires_in']), refresh_token: body['refresh_token'])
          return body['access_token']
        else
          nil
        end
      end
    end
  end
end
