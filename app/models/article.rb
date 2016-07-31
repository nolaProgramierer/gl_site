class Article < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 5 }

  has_attached_file :photo,
    	:path => ":rails_root/public/system/:attachment/:id/:style/:filename",
	  	:styles => {
	  		:thumb => "100x100",
	  		:medium => "200x200",
	  		:large => "600x400"
}
end
