## OmniAuth GeekPark

This is the official OmniAuth strategy for authenticating to GeekPark.

## Usage
```
use OmniAuth::Builder do
  provider :geekpark, ENV['GEEKPARK_KEY'], ENV['GEEKPARK_SECRET']
end
```
### Change the client options
```
use OmniAuth::Builder do
  provider :geekpark, ENV['GEEKPARK_KEY'], ENV['GEEKPARK_SECRET'], {
    client_options: {
      site: 'YOUR_SITE_ADDRESS',
      authorize_url: 'YOUR_AUTHORIZE_URL',
      token_url: 'YOUR_TOKEN_URL'
    }
  }
end
```

### Helper
```
class User < ActiveRecord::Base
  include OmniAuth::GeekPark::Helper
end
```
see more at code
