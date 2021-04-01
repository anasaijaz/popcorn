class GroupsController < ApplicationController
    def index
        @messages = Message.new
    end

    def create
       
        @message = Message.new(message:"test message" , user_id:current_user.id)
    

                
        if @message.save
            ActionCable.server.broadcast('room_channel', {message:"lassan"}) 
        else
            Rails.logger.info "Errors: #{@message.errors.full_messages}"
        end        
        redirect_to section_path
        
    end
end
