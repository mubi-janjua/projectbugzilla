class ProjectusersController < ApplicationController
	def index
	    @projs = Projectuser.all
	end

    def show
        @proj = Projectuser.find(params[:id])
    end
	def new
        @proj = Projectuser.new
    end
    def create
        @proj = Projectuser.new(projectuser_params)

        @proj.save!
        redirect_to projectusers_path
    end
    def edit
        @proj = Projectuser.find(params[:id])
    end
    def update
        @proj = Projectuser.find(params[:id])
        if @proj.update(projectuser_params)
        redirect_to projectusers_path

    end
end
    def destroy
    @proj = Projectuser.find(params[:id])
    @proj.destroy

    redirect_to projectusers_path
    end

    private
    def projectuser_params
    	params.require(:projectuser).permit(:user_id, :projectt_id)
    end
end
