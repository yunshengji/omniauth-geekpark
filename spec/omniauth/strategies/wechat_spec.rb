require 'spec_helper'

describe OmniAuth::Strategies::WeChat do
  context 'client options' do
    let(:options) { OmniAuth::Strategies::WeChat.new({}).options.client_options }

    it 'should have correct site' do
      expect(options.site).to eq('https://api.weixin.qq.com')
    end

    it 'should have correct authorize url' do
      expect(options.authorize_url).to eq('https://open.weixin.qq.com/connect/qrconnect')
    end

    it 'should have corrent token url' do
      expect(options.token_url).to eq('https://api.weixin.qq.com/sns/oauth2/access_token')
    end
  end
end
