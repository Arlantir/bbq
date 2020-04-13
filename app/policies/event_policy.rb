class EventPolicy < ApplicationPolicy
  def show?
    user.nil? || user.present?
  end

  def create?
    user.present?
  end

  def update?
    edit?
  end

  def edit?
    user_is_owner?(record)
  end

  def destroy?
    user_is_owner?(record)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  private

  def user_is_owner?(event)
    user.present? && event.try(:user) == user
  end
end
