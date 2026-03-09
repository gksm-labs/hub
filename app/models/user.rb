class User < ApplicationRecord
  include UserPermissions

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true

  validate on: :update do
    errors.add(:first_name, :cant_change) if first_name_changed? && !has_permission?(:update_name)
    errors.add(:last_name, :cant_change) if last_name_changed? && !has_permission?(:update_name)
    errors.add(:email, :cant_change) if email_changed? && !has_permission?(:update_email)
  end

  has_many :access_grants,
           class_name: "Doorkeeper::AccessGrant",
           foreign_key: :resource_owner_id,
           dependent: :delete_all

  has_many :access_tokens,
           class_name: "Doorkeeper::AccessToken",
           foreign_key: :resource_owner_id,
           dependent: :delete_all

  def display_name
    "#{first_name} #{last_name}".strip
  end
end
