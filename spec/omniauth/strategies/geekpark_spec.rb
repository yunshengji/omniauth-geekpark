require 'spec_helper'

describe OmniAuth::Strategies::GeekPark do
  let(:access_token) { double('AccessToken', options: {}) }
  let(:parsed_response) { double('ParsedResponse') }
  let(:response) { double('Response', parsed: parsed_response) }

  subject do
    OmniAuth::Strategies::GeekPark.new({})
  end

  before(:each) do
    subject.stub(:access_token).and_return(access_token)
  end

  context 'client options' do
    it 'should have correct site' do
      subject.options.client_options.site.should eq('http://www.geekpark.net')
    end

    it 'should have correct authorize url' do
      subject.options.client_options.authorize_url.should eq('http://www.geekpark.net/oauth2/authorize')
    end

    it 'should have corrent token url' do
      subject.options.client_options.token_url.should eq('http://www.geekpark.net/oauth2/token')
    end
  end
end