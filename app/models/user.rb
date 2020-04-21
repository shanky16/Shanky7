#
class User < ApplicationRecord
  has_many :assigns
  has_many :projects, :through => 'assigns'
  devise :database_authenticatable, :registerable, :confirmable,
  :omniauthable, :recoverable, :rememberable, :validatable
      def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.provider = auth.provider
          user.uid = auth.uid
          user.email = auth.info.email
          user.password = Devise.friendly_token[0, 20]
        end
      end
      validate :password_regex
      private

  def password_regex
    return if password.blank? || password =~ /\A(?=.*\d)(?=.*[A-Z])(?=.*\W)[^ ]{7,}\z/

    errors.add :password, 'Password should have more than 7 characters including 1 uppercase letter, 1 number, 1 special character'
  end
end
