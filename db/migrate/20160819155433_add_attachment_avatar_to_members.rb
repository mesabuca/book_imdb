class AddAttachmentAvatarToMembers < ActiveRecord::Migration[5.0]
  def self.up
    change_table :members do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :members, :avatar
  end
end
