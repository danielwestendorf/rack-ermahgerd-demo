require 'spec_helper'

describe RackErmahgerdDemo::Server do

  let(:server) {Rack::MockRequest.new(RackErmahgerdDemo::Server.new)}

  describe "App methods" do

    let(:app) {RackErmahgerdDemo::Server.new}

    context "router method" do
      
      it "should return a valid controller and method" do
        app.router("GET", "/").should eq("Root")
      end

      it "should return nil when passed an invalid path" do
        app.router("GET", "/harg").should be_nil
      end

      it "should return nil when passed an invalid method" do
        app.router("SHART", "/").should be_nil
      end

    end
  end

  context "/" do
    it "should return a 200 code for a valid path" do
      response = server.get('/')
      response.status.should == 200
    end

    it "should return a 404 for an invalid path" do
      response = server.get('/sdhjfaklsdjflksj')
      response.status.should == 404
    end

    it "should return translated body when a post is sent" do
      response = server.post('/', {text: 'Goosebumps!'})
      p response
      # response.body.should == 'test'
    end

  end

end