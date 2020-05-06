class UserPolicy < ApplicationPolicy
 attr_reader :user, :record

  def index?
    @user.user_type == "manager"
  end

  def new?
    @user.user_type == "qa"
  end

  def create?
    @user.user_type == "qa" ||  @user.user_type == "manager"
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
