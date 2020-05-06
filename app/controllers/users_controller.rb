class UsersController < ApplicationController
	def index
  	@users = User.all
    authorize @users
	end

	def show
	  @user=current_user
    puts current_user
	end

  def show_user
    @project = Projectt.find(params[:projectt_id])
    @users = @project.users.where(user_type: "developer")
    @bug = Bug.find(params[:bug_id])
    @project_users_ids = Projectt.find(params[:projectt_id]).users.pluck(:id)
  end

  def add_buguser
    @user = User.find(params[:user_id])
    @project = Projectt.find(params[:projectt_id])
    bug = Bug.find(params[:bug_id])
    if bug.update!(developer_id: params[:id])
      redirect_to user_projectt_bug_path(@user.id, @project.id, bug.id)
    else
      redirect_to user_projectt_bug_show_user_path(@user.id, @project.id, bug.id)
    end
  end

  def destroy_buguser
    @bug = Bug.find_by(developer_id: params[:id],id: params[:bug_id])
    if @bug.update(developer_id: nil)
      redirect_to user_projectt_bug_show_user_path(current_user.id, @bug.projectt.id, @bug.id)
    end
  end
end
