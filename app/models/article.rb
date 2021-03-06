class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true ,uniqueness: true
  validates :body, presence: true ,length:{minimum:100, maximum:1000}
end
