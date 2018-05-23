class GrandmomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    record.owner == user
  end

  def create?
    record
  end

  def destroy?
    record.owner == user
  end
end
