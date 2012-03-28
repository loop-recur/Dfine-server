class CaseStudy < ActiveRecord::Base
  CASE_STUDY_KINDS = %w(stabilit star)
  
  scope :stabilit, where(:kind => "stabilit")
  scope :star, where(:kind => "star")
  
  validates :title, :presence => true
  validates :kind, :presence => true, :inclusion => { :in => CASE_STUDY_KINDS }

  has_many :images, :dependent => :destroy
  
  def self.get_valid_kind(candidate)
    candidate = candidate.to_s.downcase
    CaseStudy::CASE_STUDY_KINDS.detect{|cst| cst == candidate}
  end
  
  def image=(val)
    images.build(val) if val && !val[:upload].blank?
  end
  
  def bullet_points
    self[:points].to_s.split("\n").map(&:squish).reject(&:blank?)
  end
  
  def to_hash
    attributes.merge(:images => images.map(&:to_hash), :bullet_points => bullet_points)
  end
  
  
end
