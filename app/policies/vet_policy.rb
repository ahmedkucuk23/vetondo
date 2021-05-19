class VetPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  # def edit?
  #   if user == record.user
  #     true
  #   else
  #     false
  #   end
  # end

  def update?
    user == record.user
  end

  def destroy?
    user == record.user
  end

end
