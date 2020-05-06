class ProjecttsController < ApplicationController
	def index
    @projects = current_user.projectts
	end

	def show
	 @pro= Projectt.find(params[:id])
   @bug = @pro.bugs
	end

	def new
	 @pro = Projectt.new
   authorize @pro
	end

	def create
	 @pro = Projectt.new(projectt_params)
	 current_user.projectts << @pro
	 authorize @pro
   @pro.save!

	 redirect_to user_projectts_path
	end

	def show_user
	 @users = User.all
	 @project_id = Projectt.find(params[:projectt_id]).id
	 @project_users_ids = Projectt.find(params[:projectt_id]).users.pluck(:id)
	end

	def destroy
	 @pro = Projectt.find(params[:id])
	 @pro.destroy

	 redirect_to user_projectts_path
	end

  def add_user
	 @proj = Projectuser.create(user_id: params[:id],projectt_id: params[:projectt_id])
  	if @proj.save!

  	 redirect_to user_projectt_show_user_path(current_user.id, params[:projectt_id])
  	end
  end

  def destroy_user
    @proj = Projectuser.find_by(user_id: params[:id], projectt_id:params[:projectt_id])
    if @proj.destroy

     redirect_to  user_projectt_show_user_path(params[:projectt_id])
    end
  end

	private

	def projectt_params
	 params.require(:projectt).permit(:id, :name, :projectt_id)
	end
end
