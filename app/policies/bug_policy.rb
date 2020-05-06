class BugPolicy < ApplicationPolicy
  def index
    @user.user_type == "developer" || @user.user_type == "qa"
  end

  def new?
    puts "mubeeeee"
    @user.user_type == "qa"
  end

  def create?
    @user.user_type == "qa"
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
