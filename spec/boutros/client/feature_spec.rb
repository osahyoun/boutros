require 'helper'

describe Boutros::Client do
  include HelperMethods

  before do
    @client = Boutros::Client.new(client_options)
  end

  describe 'feature' do
    it "should be get-able" do
      stub_get('/admin/api/features/126.xml', :feature)

      feature = @client.feature(126)
      feature.should be_a Boutros::Feature
    end

    it "should be createable" do
      body = {:name => 'Foo Bar', :system_name => 'foo_bar'}
      stub_post('/admin/api/features.xml', :feature, body)

      feature = @client.create_feature(body)
      feature.should be_a Boutros::Feature
    end

    it "should be update-able" do
      body = {:name => 'Foo Bar'}
      stub_put('/admin/api/features/126.xml', :feature, body)

      feature = @client.update_feature(126, body)
      feature.should be_a Boutros::Feature
    end

    it "should be delete-able" do
      stub_delete('/admin/api/features/126.xml', '')

      feature = @client.delete_feature(126)
      feature.should be_empty
    end
  end

  describe 'features' do
    it "should return an array of features" do
      stub_get('/admin/api/features.xml', :features)

      features = @client.features
      features.should be_an Array
      features.first.should be_a Boutros::Feature
    end

    it "should return an array of features scoped by plan" do
      stub_get('/admin/api/account_plans/236/features.xml', :features)

      features = @client.features(236)
      features.should be_an Array
      features.first.should be_a Boutros::Feature
    end
  end

end