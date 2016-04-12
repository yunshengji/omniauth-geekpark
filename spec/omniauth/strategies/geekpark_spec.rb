require 'spec_helper'

describe OmniAuth::Strategies::GeekPark do
  context 'client options' do
    subject { OmniAuth::Strategies::GeekPark.new({}).options.client_options }

    it 'should have correct site' do
      expect(subject.site).to eq('http://www.geekpark.net')
    end

    it 'should have correct authorize url' do
      expect(subject.authorize_url).to eq('http://www.geekpark.net/oauth/authorize')
    end

    it 'should have corrent token url' do
      expect(subject.token_url).to eq('http://www.geekpark.net/oauth/token')
    end
  end
end
