class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  #客製化欄位,加入驗證         
  validates_presence_of :name

  #上傳照片
  mount_uploader :avatar, AvatarUploader

  has_many :comments, dependent: :destroy
  
  # 驗證是否為Admin
  def admin?
    self.role == "admin"
  end

end
