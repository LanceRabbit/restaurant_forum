class Restaurant < ApplicationRecord
  # 驗證程序
  validates_presence_of :name

  # 上傳照片
  # mount_uploader 是 CarrierWave 提供的掛載方法，會將你指定的屬性欄位，和指定 uploader 掛載到一起。 
  # 請注意屬性名稱的型態是 symbol，而 uploader 的名稱型態為 constant（因為 PhotoUploader 也是一個 Class）
  mount_uploader :image, PhotoUploader
end
