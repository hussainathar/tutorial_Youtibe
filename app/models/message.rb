class Message < ActiveRecord::Base
  belongs_to :visitor

  def self.matcing_fullname_or_content params
  	joins(:visitor).where("fullname LIKE ? OR content LIKE ?", "%#{params}%", "%#{params}%")
  end

  def mark_read
  	update(status: true) if status == false
  end
end
