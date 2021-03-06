# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    user_admin?
  end

  def show?
    user_admin?
  end

  def update?
    user_admin? || current_user.id == model.id
  end

  def edit?
    user_admin? || current_user.id == model.id
  end

  def destroy?
    user_admin?
  end
end
