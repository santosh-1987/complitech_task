class WritersController < ApplicationController
skip_before_filter :authenticate_writer!
 def new
  @writer = Writer.new
 end

def create
 @writer = Writer.new(params[:writer])
   if @writer.save
    redirect_to :controller=>'dashboard',:action=>'index'
end
end

end
