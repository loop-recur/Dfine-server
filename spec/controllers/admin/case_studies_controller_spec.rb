require 'spec_helper'

module Admin
  
describe CaseStudiesController do
  fixtures :case_studies, :users
  render_views 
  
  describe "should require authentication" do
    it "redirects if not authenticated" do
      get :index
      response.should redirect_to(new_user_session_path)
    end
  end
  
  describe "Authenticated examples" do
    before do
      @user = users(:one)
      sign_in(@user)
      @case_study = case_studies(:one)
    end
    
    describe "POST /create" do
      context "valid" do
        before do
          CaseStudy.any_instance.stubs(:valid?).returns(true)
          @doPost = lambda {post :create, :case_study => Factory.attributes_for(:case_study)}
          @doPost.call
        end

        it { should redirect_to(admin_case_studies_path) }

        it "creates an admin" do
          @doPost.should change(CaseStudy, :count).by(1)
        end
      end

      context "invalid" do
        before do
          CaseStudy.any_instance.stubs(:valid?).returns(false)
          @doPost = lambda {post :create, :case_study => {}}
          @doPost.call
        end

         it { should render_template("admin/case_studies/new") }
         
         it "doesn't create an admin" do
           @doPost.should change(CaseStudy, :count).by(0)
         end
      end
    end
    
    describe "GET /index" do
      before do
        get :index
      end
      
      it { should respond_with :success }
      it { should assign_to :case_studies }
      it { should render_template :index }      
    end
    
    describe "GET /new" do
       before do
         get :new
       end

       it { should respond_with :success }
       it { should assign_to :case_study }
       it { should render_template :new }
     end
    
    describe "GET /edit" do
      before do
        get :edit, :id => 1
      end

      it { should respond_with :success }
      it { should assign_to :case_study }
      it { should render_template :edit }
    end
    
    describe "Put to /update" do
      describe "valid" do
        before do
          CaseStudy.any_instance.stubs(:valid?).returns(true)
          put :update, :id => @case_study.id, :case_study => {:title => "goo@boo.com"}
        end
      
        it { should assign_to :case_study }
        it { should redirect_to(admin_case_studies_path) }

        it "updates the admin" do
          assigns(:case_study).title.should == "goo@boo.com"
        end
      end
      
      describe "invalid" do
        before do
          CaseStudy.any_instance.stubs(:valid?).returns(false)
          put :update, :id => @case_study.id, :case_study => {}
        end
        
        it { should render_template(:edit) }
        
        it "doesn't update a admin" do
          assigns(:case_study).changed.should be_empty
        end
      end
    end
    
    describe "DELETE /destroy" do
      before do
        delete :destroy, :id => @case_study.id
      end
      
      it { should redirect_to(admin_case_studies_path) }
      
      it "destroys record" do
        lambda { @case_study.reload }.should raise_error(::ActiveRecord::RecordNotFound)
      end
    end
    
  end
end

end
