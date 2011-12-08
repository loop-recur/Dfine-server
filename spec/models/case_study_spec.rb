require 'spec_helper'

describe CaseStudy do
  before do
    @case_study = Factory.build(:case_study)
  end
  
  context "validations" do
    it { should validate_presence_of(:title) }
  end
  
end
