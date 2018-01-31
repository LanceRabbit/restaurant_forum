class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  #客製化欄位,加入驗證         
  validates_presence_of :name

  #上傳照片
  mount_uploader :avatar, AvatarUploader

  # User 若有評論，就不允許刪除帳號（刪除時拋出 Error）
  has_many :comments, dependent: :restrict_with_error
  # 評論餐廳 - 多對多關聯
  has_many :commented_restaurants, through: :comments, source: :restaurant
  
  # 使用者收藏餐廳 - 多對多關聯
  has_many :favorites, dependent: :destroy
  # 避免與 "評論餐廳" 混肴,命名favorited_restaurants符合語意(喜愛餐廳)
  # 需另加 source 告知 Model name(指定 Model name，慣例使用單數)
  has_many :favorited_restaurants, through: :favorites, source: :restaurant

  # 按讚餐廳
  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :restaurant  
  
  # 追蹤其他人
  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships

  # 是否已追蹤 
  def following?(user)
    self.followings.include?(user)
  end
  
  # 驗證是否為Admin
  def admin?
    self.role == "admin"
  end
end
