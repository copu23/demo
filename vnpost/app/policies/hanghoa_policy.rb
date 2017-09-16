class HanghoaPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def create?
user.try(:admin?) || record.project.has_manager?(user) ||
record.hanghoa.has_editor?(user)
end
  def show?
user.try(:admin?) || record.vandon.roles.exists?(user_id: user)
end

end
