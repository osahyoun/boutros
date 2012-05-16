require 'helper'

describe Boutros::Client do
  include HelperMethods

  before do
    @client = Boutros::Client.new(client_options)
  end

  describe 'method' do

    it 'should be get-able' do
      stub_get('/admin/api/services/20/metrics/10/methods/1.xml', :method)

      @client.method(20, 10, 1).should be_a Boutros::Method
    end

    it 'should be create-able' do
      body = {:for => 'Foo bar', :bar => 'foo_bar'}
      stub_post('/admin/api/services/20/metrics/1/methods.xml', :method, body)

      metric = @client.create_method(20, 1, body)
      metric.should be_a Boutros::Method
    end

    it 'should be update-able' do
      body = {:foo => 'Foo bar'}
      stub_put('/admin/api/services/20/metrics/10/methods/1.xml', :method, body)

      metric = @client.update_method(20, 10, 1, body)
      metric.should be_a Boutros::Method
    end

    it 'should be delete-able' do
      stub_delete('/admin/api/services/20/metrics/1/methods/2.xml', '')

      @client.delete_method(20, 1, 2).should be_empty
    end
  end

  describe 'methods' do
    it 'should be get-able' do
     stub_get('/admin/api/services/20/metrics/1/methods.xml', :methods)

     @client.methods(20,1).first.should be_a Boutros::Method
    end
  end


end