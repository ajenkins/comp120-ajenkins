class MessagesController < ApplicationController
  protect_from_forgery except: :create
  
  respond_to :json
  
  def index
    @messages = Message.order("created_at ASC")
  end

  def show
    @message = Message.find(params[:id])
  end
  
  def create
    @message = Message.create(params[:message].permit(:content, :username, :app_id))
    head :created, location: messages_path(@message)
  end
end
