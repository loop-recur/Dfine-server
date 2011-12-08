require 'spec_helper'

module Api
  
describe CaseStudiesController do
  render_views
  
  describe "unauthenticated" do
    before do
      @request.env["HTTP_AUTHORIZATION"] = nil
      get :index, :format => "json"
    end
    
    it { should respond_with 401 }
  end
  
  context "Authenticated" do
    before do
      @user = Factory(:user, :password => "passsword", :password_confirmation => "passsword")
      @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("#{@user.email}:passsword")
    end
  
    describe "GET /index" do
      before do
        @case_study = Factory(:case_study, :title => "gumby")
        get :index, :format => "json"
      end
      
      it { should respond_with :success }
      
      it "renders case_studies to json" do
        response.body.to_s.should include('"title":"gumby"')
      end
    end
  end
end
end