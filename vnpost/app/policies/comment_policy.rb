class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def create?
user.try(:admin?) || record.vandon.has_manager?(user) ||
record.vandon.has_editor?(user)
end
end
