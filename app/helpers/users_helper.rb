module UsersHelper
  ROLE_COLORS = {
    "student" => "bg-slate-100 text-slate-700 border-slate-200",
    "teacher" => "bg-blue-100 text-blue-700 border-blue-200",
    "admin"   => "bg-indigo-100 text-indigo-700 border-indigo-200"
  }.freeze

  ROLE_LABELS = {
    "student" => "Študent",
    "teacher" => "Učiteľ",
    "admin"   => "Administrátor"
  }.freeze

  def user_role_label(user)
    ROLE_LABELS[user.role] || "Neznáma rola"
  end

  def user_role_badge_classes(user)
    ROLE_COLORS[user.role] || "bg-gray-100 text-gray-700 border-gray-200"
  end
end
