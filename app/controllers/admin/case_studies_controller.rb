module Admin
  
class CaseStudiesController < Admin::ApplicationController
  
  def index
    @case_studies = CaseStudy.paginate(:page => params[:page], :per_page => 15)
  end
  
  def create
    @case_study = CaseStudy.new(params[:case_study])
    @case_study.save ? redirect_to(admin_case_studies_path) : render(:action => :new)
  end
  
  def edit
    @case_study = CaseStudy.find(params[:id])
  end
  
  def new
    @case_study = CaseStudy.new
  end
  
  def destroy
    CaseStudy.find(params[:id]).destroy
    redirect_to admin_case_studies_path
  end
  
  def update
    @case_study = CaseStudy.find(params[:id])    
    @case_study.update_attributes(params[:case_study]) ? redirect_to(admin_case_studies_path) : render(:action => :edit)
  end

  
end

end
