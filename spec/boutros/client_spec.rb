require 'helper'

describe Boutros::Client do

  describe 'configuration' do
    it "should take default config values" do
      @client = Boutros::Client.new
      @client.domain.should == ''
      @client.key.should == ''
    end

    context 'overriding default values' do
      it "should be possible directly" do
        @client = Boutros::Client.new({:domain => "http://example.com"})
        @client.domain.should == 'http://example.com'
      end
    end
  end

end