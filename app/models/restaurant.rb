class Restaurant < ApplicationRecord
  # 驗證程序
  validates_presence_of :name

  # 上傳照片
  # mount_uploader 是 CarrierWave 提供的掛載方法，會將你指定的屬性欄位，和指定 uploader 掛載到一起。 
  # 請注意屬性名稱的型態是 symbol，而 uploader 的名稱型態為 constant（因為 PhotoUploader 也是一個 Class）
  mount_uploader :image, PhotoUploader
  
  # belongs_to 關聯，每當建立新的 Restaurant 資料時，會強制驗證外鍵 category_id 必須寫入內容；
  # 然而，如果應用程式的邏輯允許「未分類」的 Restaurant 資料，
  # 你就需要在 belongs_to 的宣告後，加上 optional: true 的設定
  belongs_to :category
  
  #  dependent: :destroy 當Restaurant 物件被刪除時，將會刪除依賴的 Comment
  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  # 參考user.rb說明
  has_many :favorited_users, through: :favorites, source: :user
  
  # 驗證使用者是否已點選過喜愛按鈕
  def is_favorited?(user)
    self.favorited_users.include?(user)
  end

end
