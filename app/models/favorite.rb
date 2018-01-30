class Favorite < ApplicationRecord
    belongs_to :user
    # counter_cache 可以自動回傳 size 方法結果，計算關聯物件的數量
    # 必須在關聯 Model 上加一個欄位，慣例命名為 {table_name}_count
    belongs_to :restaurant, counter_cache: true
end
