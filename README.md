## OmniAuth GeekPark

This is the official OmniAuth strategy for authenticating to GeekPark.

## Usage
```
use OmniAuth::Builder do
  provider :geekpark, ENV['GEEKPARK_KEY'], ENV['GEEKPARK_SECRET']
end
```

