class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
    
protected

  def password_required?
   !persisted? || password.present? || password_confirmation.present?
  end

end
