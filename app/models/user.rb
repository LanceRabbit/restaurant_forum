class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :comments, dependent: :destroy
  
  # 驗證是否為Admin
  def admin?
    self.role == "admin"
  end

end
