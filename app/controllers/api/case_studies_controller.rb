module Api
  
class CaseStudiesController < ApplicationController
  
  def index
    @case_studies = CaseStudy.all
    render(:json => @case_studies)
  end
end

end
