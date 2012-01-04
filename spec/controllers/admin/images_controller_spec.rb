require 'spec_helper'

module Admin
  
describe ImagesController do
  fixtures :case_studies, :images, :users
  render_views 
  
  describe "should require authentication" do
    it "redirects if not authenticated" do
      delete :destroy, :id => 1
      response.should redirect_to(new_user_session_path)
    end
  end
  
  describe "Authenticated examples" do
    before do
      @user = users(:one)
      sign_in(@user)
      @image = images(:one)
      @case_study = case_studies(:one)
    end

    describe "DELETE /destroy" do
      before do
        delete :destroy, :id => @image.id
      end
      
      it { should redirect_to(edit_admin_case_study_path(@case_study)) }
      
      it "destroys record" do
        lambda { @image.reload }.should raise_error(::ActiveRecord::RecordNotFound)
      end
    end
    
  end
end

end
