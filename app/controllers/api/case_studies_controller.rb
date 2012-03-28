module Api
  
class CaseStudiesController < ApplicationController
  
  def index
    @case_studies = CaseStudy.all
    render(:json => @case_studies.map(&:to_hash))
  end
  
  def show
    if case_study_kind = CaseStudy.get_valid_kind(params[:id])
      @case_studies = CaseStudy.send(case_study_kind.to_sym)
      render(:json => @case_studies.map(&:to_hash))
    end
  end
  
end

end
