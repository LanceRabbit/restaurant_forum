class Comment < ApplicationRecord
    # 關聯user / restaurant
    belongs_to :user
    belongs_to :restaurant
end
