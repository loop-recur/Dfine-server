class CaseStudy < ActiveRecord::Base
  validates :title, :presence => true

  has_many :images, :dependent => :destroy
  
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
