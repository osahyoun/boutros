require 'helper'

describe Boutros::Client do
  include HelperMethods

  before do
    @client = Boutros::Client.new(client_options)
  end


  describe 'application' do
    it "should be get-able" do
      stub_get("/admin/api/accounts/10/applications/20.xml", :application)

      @client.application(10, 20).should be_a Boutros::Application
    end

    it "should be update-able" do
      body = {:name => 'Foo Bar', :description => 'Bar Foo'}
      stub_put('/admin/api/accounts/10/applications/20.xml', :application, body)
      @client.update_application(10, 20, body).
        should be_a Boutros::Application
    end

    it "should be create-able" do
      body = {:plan_id => '100', :name => 'My App', :description => 'Foo Bar'}
      stub_post("/admin/api/accounts/10/applications.xml", :application, body)

      @client.create_application(10, 20, body).
        should be_a Boutros::Application
    end

    it "should be able to change plan" do
      body = {:plan_id => '100'}
      stub_put("/admin/api/accounts/10/applications/20/change_plan.xml", :application, body)

      @client.change_application_plan(10,20, body).
        should be_a Boutros::Application
    end

    it "should be able to create a customised plan" do
      pending
    end

    it "should be able to delete a customised plan" do
      pending
    end

    it "should be accept-able" do
      stub_put('/admin/api/accounts/10/applications/20/accept.xml', :application)

      @client.accept_application(10,20).
        should be_a Boutros::Application
    end

    it "should be suspend-able" do
      stub_put('/admin/api/accounts/10/applications/20/suspend.xml', :application)

      @client.suspend_application(10,20).
        should be_a Boutros::Application
    end

    it "should be resume-able" do
      stub_put('/admin/api/accounts/10/applications/20/resume.xml', :application)

      @client.resume_application(10,20).
        should be_a Boutros::Application
    end

    describe 'keys' do
      it "should be create-able" do
        stub_post('/admin/api/accounts/10/applications/20/keys.xml', :application)

        @client.create_application_key(10,20).
          should be_a Boutros::Application
      end

      it "should be delete-able" do
        stub_delete('/admin/api/accounts/10/applications/20/keys/30.xml', :application)

        @client.delete_application_key(10,20,30).
          should be_a Boutros::Application
      end
    end

    describe 'referrer filters' do
      it "should be create-able" do
        pending
      end

      it "should be delete-able" do
        pending
      end
    end

  end
end