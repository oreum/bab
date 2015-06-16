class Product < ActiveRecord::Base
  has_many :items

  before_destroy :not_referenced

  validates :title, :description, presence: true
  validates :price, numericality: {greater_than_to: 0}
  validates :title, uniqueness: true
  validates :image_url, format: {with: %r{\.(gif|jpg|jpeg|png)\z}i}

  private
  def not_referenced
    if items.empty?
	  return ture
	else
	  return false
	end
  end
end
