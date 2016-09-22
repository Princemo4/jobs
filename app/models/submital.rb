class Submital < ActiveRecord::Base
  belongs_to :posting
  belongs_to :user

  has_attached_file :resume
  validates_attachment_content_type  :resume, content_type: 'text/plain'


end
