class Pin < ActiveRecord::Base
     belongs_to :user
     
     has_attached_file :image, :styles => { :large => "800x800!", :medium => "575x625#", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
     validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

     validates :image, presence: true #added to ensure a user uploads an image and description
	 validates :description, presence: true
	 validates :description, length: { in: 2..100, too_short: "must have at least two characters. Anything more to say on this one?", too_long: "can't be more than 100 characters. Nicely done, though.", }

end
