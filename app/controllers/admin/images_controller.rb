module Admin
  
class ImagesController < Admin::ApplicationController
  
  def destroy
    image = Image.find(params[:id])
    case_study = image.case_study
    image.destroy
    redirect_to edit_admin_case_study_path(case_study)
  end
  
end

end
