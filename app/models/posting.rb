class Posting < ActiveRecord::Base
  has_many :submitals
  belongs_to :user


  def self.search(search)

    where('title LIKE ? or description LIKE ?', "%#{search}%", "%#{search}%")
    #code
  end

end
