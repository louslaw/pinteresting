class Pin < ActiveRecord::Base
	belongs_to :user

  acts_as_votable
	acts_as_taggable

	has_attached_file :image, styles: {large: "600x600", medium: "300x300>"}
	# Validate content type
  	validates_attachment_content_type :image, content_type: /\Aimage/
  	# Validate filename
  	validates_attachment_file_name :image, matches: [/png\Z/, /jpe?g\Z/]
  	# Explicitly do not validate
  	do_not_validate_attachment_file_type :image

  	validates :image, presence: true

end
