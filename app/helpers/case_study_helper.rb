module CaseStudyHelper
  
  def case_study_selectable_kinds
    CaseStudy::CASE_STUDY_KINDS.map{|kind| [kind.titleize, kind]}
  end
  
end  