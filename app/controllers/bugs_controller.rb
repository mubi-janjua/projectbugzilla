class BugsController < ApplicationController
  before_action :authorize_user, only: [:create, :new]
  def index
    @project = Projectt.find(params[:projectt_id])
    @bugs = @project.bugs
  end

  def show
    @project = Projectt.find(params[:projectt_id])
    @bug = Bug.find(params[:id])
  end

  def new
    @bug = Bug.new
  end

  def create
    @user = User.find(params[:user_id])
    @project = Projectt.find(params[:projectt_id])
    @bug = Bug.new(bug_params)
    @bug.creator_id = params[:user_id]
    @bug.projectt_id = params[:projectt_id]

    if @bug.save
      redirect_to user_projectt_bugs_path
    else
      render :new
      return
    end
  end

  def edit
    @bug = Bug.find(params[:id])
  end

  def update
    @bug = Bug.find(params[:id])

   if @bug.update(bug_params)
      redirect_to    user_projectt_bugs_path
    end
  end

  def destroy
    @project = Projectt.find(params[:projectt_id])
    @bug = Bug.find(params[:id])

    @bug.destroy
    redirect_to user_projectt_bugs_path
  end

  private

  def bug_params
   params.require(:bug).permit(:title, :deadline, :typed, :status, :user_id, :projectt_id, :image)
  end

  def authorize_user
    authorize current_user
  end
end
