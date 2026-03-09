module UsersHelper
  ROLE_COLORS = {
    "user"    => "bg-gray-100 text-gray-700 border-gray-200",
    "student" => "bg-green-100 text-green-700 border-green-200",
    "teacher" => "bg-blue-100 text-blue-700 border-blue-200",
    "admin"   => "bg-indigo-100 text-indigo-700 border-indigo-200"
  }.freeze

  ROLE_LABELS = {
    "user"    => "Uživatel",
    "student" => "Študent",
    "teacher" => "Učiteľ",
    "admin"   => "Administrátor"
  }.freeze

  def user_role_label(user)
    ROLE_LABELS[user.role]
  end

  def user_role_badge_classes(user)
    ROLE_COLORS[user.role]
  end
end
