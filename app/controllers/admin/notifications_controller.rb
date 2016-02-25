class Admin::NotificationsController < Admin::ApplicationController
  def index
  	@visitor_notification=Notification.where(notifiable_type: 'Visitor').order(id: :desc)
  	@comment_notification=Notification.where(notifiable_type: 'Comment').order(id: :desc)
  end

  def destroy
  	@notifiable =Notification.find(params[:id])
  	@notifiable.destroy

  	redirect_to :back, notice: 'Notification was deleted successfully'

  end
  def delete_all
  	Notification.delete_all
  	redirect_to :back, notice: 'All notification deleted successfully'
  	
  end
end
