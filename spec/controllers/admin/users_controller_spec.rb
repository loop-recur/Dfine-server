require 'spec_helper'

module Admin
  
describe UsersController do
  fixtures :users
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
    end
    
    describe "POST /create" do
      context "valid" do
        before do
          User.any_instance.stubs(:valid?).returns(true)
          @doPost = lambda {post :create, :user => Factory.attributes_for(:user)}
          @doPost.call
        end

        it { should redirect_to(admin_users_path) }

        it "creates an admin" do
          @doPost.should change(User, :count).by(1)
        end
      end

      context "invalid" do
        before do
          User.any_instance.stubs(:valid?).returns(false)
          @doPost = lambda {post :create, :user => {}}
          @doPost.call
        end

         it { should render_template("admin/users/new") }
         
         it "doesn't create an admin" do
           @doPost.should change(User, :count).by(0)
         end
      end
    end
    
    describe "GET /index" do
      before do
        get :index
      end
      
      it { should respond_with :success }
      it { should assign_to :users }
      it { should render_template :index }      
    end
    
    describe "GET /new" do
       before do
         get :new
       end

       it { should respond_with :success }
       it { should assign_to :user }
       it { should render_template :new }
     end
    
    describe "GET /edit" do
      before do
        get :edit, :id => 1
      end

      it { should respond_with :success }
      it { should assign_to :user }
      it { should render_template :edit }
    end
    
    describe "Put to /update" do
      describe "valid" do
        before do
          User.any_instance.stubs(:valid?).returns(true)
          put :update, :id => @user.id, :user => {:email => "goo@boo.com"}
        end
      
        it { should assign_to :user }
        it { should redirect_to(admin_users_path) }

        it "updates the admin" do
          assigns(:user).email.should == "goo@boo.com"
        end
      end
      
      describe "invalid" do
        before do
          User.any_instance.stubs(:valid?).returns(false)
          put :update, :id => @user.id, :user => {}
        end
        
        it { should render_template(:edit) }
        
        it "doesn't update a admin" do
          assigns(:user).changed.should be_empty
        end
      end
    end
    
    describe "DELETE /destroy" do
      before do
        delete :destroy, :id => @user.id
      end
      
      it { should redirect_to(admin_users_path) }
      
      it "destroys record" do
        lambda { @user.reload }.should raise_error(::ActiveRecord::RecordNotFound)
      end
    end
    
  end
end

end
