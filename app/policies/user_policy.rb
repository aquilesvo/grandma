class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def update?
    user == @user
  end

  def remove_photo?
    user == @user
  end
end
