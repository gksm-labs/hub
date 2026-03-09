module UserPermissions
  extend ActiveSupport::Concern

  ROLE_PERMISSIONS = {
    student: [],
    teacher: [],
    admin: [:manage_oauth, :manage_users, :admin]
  }.freeze

  included do
    enum :role, {
      student: "student",
      teacher: "teacher",
      admin: "admin"
    }

    validates :role, presence: true
  end

  def has_permission?(flag)
    return true if admin?

    ROLE_PERMISSIONS[role.to_sym]&.include?(flag.to_sym) || false
  end

  def super_admin?
    admin?
  end
end
