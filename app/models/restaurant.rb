class Restaurant < ApplicationRecord
  # 驗證程序
  validates_presence_of :name
end
