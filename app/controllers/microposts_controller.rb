class MicropostsController < ApplicationController
	before_action :logged_in_user ,only: [:create , :destroy]
	before_action :correct_user , only: [:destroy]
	def create
		@micropost = current_user.microposts.build(micropost_params)
		if @micropost.save
		   	@feed_items = current_user.feed.paginate(page: params[:page])
			    respond_to do |format|
				    format.html {redirect_ to root_path,:flash => { :notice => "Yeepee!" }}
				    format.js
			    end
			#redirect_to root_path
		    else
		      #puts @micropost.errors.count
			   @feed_items = current_user.feed.paginate(page: params[:page])

			   #render 'static_pages/home'
				respond_to do |format|

					format.html { render 'static_pages/home'}
    			    format.js
                   
                end
		end
	end
	def destroy
		@micropost.delete
		@feed_items = current_user.feed.paginate(page: params[:page])
		#flash[:success]= "Micropost deleted"
		#redirect_to request.referrer || root_url
		#redirect_back(fallback_location: root_url)
				respond_to do |format|
					format.html {redirect_back(fallback_location: root_url)}
					format.js 
				end
	end
private
	def micropost_params
		params.require(:micropost).permit(:content , :picture)
    end
    def correct_user
    	@micropost = current_user.microposts.find_by(id: params[:id])
    	redirect_to root_url if @micropost.nil?
    end
end
