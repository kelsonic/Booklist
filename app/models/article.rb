class Article < ActiveRecord::Base
  before_create :generate_key
  belongs_to :category

  validates :title, presence: true
  validates :description, presence: true
  validates :author, presence: true
  validates :price, presence: true
  validates :category_id, presence: true

  private
  def generate_key
    auth = ""
    4.times do
      auth += ("a".."z").to_a.sample
      auth += rand(1..9).to_s
    end
    self.key = auth
  end
end
