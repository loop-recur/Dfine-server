class Image < ActiveRecord::Base
  belongs_to :case_study
  has_attached_file :upload, PAPERCLIP_DEFAULTS.merge(:default_url => ":class/:style.png",
                                                      :styles => { :thumb => "87x87#"})
end
