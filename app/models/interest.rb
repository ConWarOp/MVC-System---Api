class Interest < ApplicationRecord
  has_many :posts, class_name: 'Post', foreign_key: :post_id
  validates :post_id, uniqueness: { scope: :user_id }

end
