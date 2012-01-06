class Image < ActiveRecord::Base
  belongs_to :case_study
  has_attached_file :upload, PAPERCLIP_DEFAULTS.merge(:default_url => ":class/:style.png",
                                                      :styles => { :thumb => "87x87#"})
                                                      
  def to_hash
    {:url => upload.url, :thumb => upload.url(:thumb), :caption => caption}
  end
end
