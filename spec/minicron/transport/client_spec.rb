require 'spec_helper'
require 'webmock/rspec'

describe Minicron::Transport::Client do
  let(:client) { Minicron::Transport::Client }
  let(:eventmachine) { EM }

  describe '#initialize' do
    before :each do
      eventmachine.stub(:run)
      eventmachine.stub(:stop)
      eventmachine.stub(:reactor_running?)
    end

    it 'should set the host and queue instance variable' do
      eventmachine.should_receive(:reactor_running?).and_return false
      eventmachine.should_receive(:run)
      eventmachine.should_receive(:reactor_running?).and_return true

      client_instance = client.new('http://127.0.0.1/test')
      expect(client_instance.host).to eq URI.parse('http://127.0.0.1/test')
      expect(client_instance.queue).to eq({})
    end
  end

  describe '#publish' do
    before :each do
      eventmachine.stub(:run)
      eventmachine.stub(:stop)
      eventmachine.stub(:reactor_running?).and_return true
    end

    context 'with the correct params' do
      it 'should send a http request to faye and add it to the queue hash' #do
      #   stub_request(:post, 'http://127.0.0.1/test')
      #   .with(:body => 'message=%7B%22channel%22%3A%22%2F%2Ftest%22%2C%22data%22%3A%7B%22ts%22%3A1392684670.1072052%2C%22data%22%3A%22hello%20world%22%7D%7D')
      #   .to_return(:status => 200, :body => '', :headers => {})

      #   client_instance = client.new('http://127.0.0.1/test')

      #   eventmachine.run_block do
      #     client_instance.publish('/test', 'hello world')
      #   end

      #   expect(client_instance.responses[0][:status]).to eq 200
      # end
    end
  end

  describe '#ensure_delivery' do
    before :each do
      eventmachine.stub(:run)
      eventmachine.stub(:stop)
      eventmachine.stub(:reactor_running?).and_return true
    end

    # TODO: Not convinced this test works correctly but it's almost
    # not worth testing any way as it's such a simple method
    it 'should block until the queue hash is empty and return nil' #do
    #   client_instance = client.new('http://127.0.0.1/test')
    #   client_instance.queue = { :test => 1, :hello => 'world' }

    #   Thread.new { expect(client_instance.ensure_delivery).to eq true }

    #   client_instance.queue.delete(:test)
    #   sleep(0.05)
    #   client_instance.queue.delete(:hello)
    # end

    it 'should stop eventmachine' #do
    #   eventmachine.should_receive(:stop)
    #   client.new('http://127.0.0.1/test').ensure_delivery
    # end
  end
end
