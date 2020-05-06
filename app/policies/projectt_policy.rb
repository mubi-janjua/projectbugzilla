class ProjecttPolicy < ApplicationPolicy

 attr_reader :user, :record
 def index
  @user.user_type == "manager" || @user.user_type == "developer" || @user.user_type == "qa"
 end
 def create?
   @user.user_type == "manager"
 end
 def new?
   @user.user_type == "manager"
 end
def add_user
  @user.user_type == "manager"
end
 def destroy
  @user.user_type == "manager"
 end
 def destroy_user
  @user.user_type == "manager"
end
 class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
