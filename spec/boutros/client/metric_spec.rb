require 'helper'

describe Boutros::Client do
  include HelperMethods

  before do
    @client = Boutros::Client.new(client_options)
  end

  describe 'metric' do

    it 'should be get-able' do
      stub_get('/admin/api/services/20/metrics/10.xml', :metric)

      @client.metric(20, 10).should be_a Boutros::Metric
    end

    it 'should be create-able' do
      body = {:for => 'Foo bar', :bar => 'foo_bar'}
      stub_post('/admin/api/services/20/metrics.xml', :metric, body)

      metric = @client.create_metric(20, body)
      metric.should be_a Boutros::Metric
    end

    it 'should be update-able' do
      body = {:foo => 'Foo bar'}
      stub_put('/admin/api/services/20/metrics/10.xml', :metric, body)

      metric = @client.update_metric(20, 10, body)
      metric.should be_a Boutros::Metric
    end

    it 'should be delete-able' do
      stub_delete('/admin/api/services/20/metrics/10.xml', '')

      @client.delete_metric(20, 10).should be_empty
    end
  end

  describe 'metris' do
    it 'should be get-able' do
     stub_get('/admin/api/services/20/metrics.xml', :metrics)

     @client.metrics(20).first.should be_a Boutros::Metric
    end
  end


end