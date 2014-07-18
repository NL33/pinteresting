class Pin < ActiveRecord::Base
     belongs_to :user
     
     has_attached_file :image, :styles => { :large => "800x800!", :medium => "575x625#", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
     validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
