module Api
  
class CaseStudiesController < ApplicationController
  before_filter :get_kind
  
  def index
    @case_studies = (@case_study_kind ? CaseStudy.send(@case_study_kind.to_sym) : CaseStudy.all)
    render(:json => @case_studies.map(&:to_hash))
  end

  
  private 
  
    def get_kind
      @case_study_kind = CaseStudy.get_valid_kind(params[:kind])
    end
  
end

end
