module Api
  
class CaseStudiesController < ApplicationController
  
  def index
    @case_studies = CaseStudy.all
    render(:json => @case_studies.map(&:to_hash))
  end
end

end
