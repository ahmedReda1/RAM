class AddAttachmentAvatarToMeetings < ActiveRecord::Migration
  def self.up
    change_table :meetings do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :meetings, :avatar
  end
end
