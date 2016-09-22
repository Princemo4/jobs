class AddAttachmentToSubmitals < ActiveRecord::Migration
  def change
    add_attachment :submitals, :resume
  end
end
