require 'spec_helper'

describe CaseStudy do
  
  describe "associations" do
    it { should have_many(:images) }
  end
  
  describe "validations" do
    it { should validate_presence_of(:title) }
  end
  
  context "an instance" do
    before do
      @case_study = Factory.build(:case_study)
    end
    
    it "adds points" do
      @case_study.points = "one\n two\n three  \n \n"
      @case_study.bullet_points.should == ["one", "two", "three"] 
    end
    
    it "turns into a hash" do
      @case_study.points = "one\n two"
      @case_study.title = "yo"
      @case_study.to_hash.should include("title" => "yo")
      @case_study.to_hash.should include(:bullet_points => ["one", "two"])
      @case_study.to_hash.should have_key(:images)
    end
  end
  
end
