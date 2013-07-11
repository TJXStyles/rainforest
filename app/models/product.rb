class Product < ActiveRecord::Base
  attr_accessible :description, :edit, :name, :price_in_cents, :image, :formatted_price, :tag_list
  has_attached_file :image, :styles => { :medium => "300x300>" }

  has_many :reviews
  has_many :users, :through => :reviews

  validates :description, :name, :presence => true
  validates :price_in_cents, :numericality => { :only_integer => true}
  validates_attachment :image, content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png']}, size: { less_than: 5.megabytes }
  acts_as_taggable
  
  def formatted_price
  	price_in_dollars = price_in_cents.to_f / 100
  	sprintf("%.2f", price_in_dollars)
  end

  def self.search(search)
  	if search
  		where('name LIKE ?', "%#{search}%")
  	else
  		scoped
  	end
  end
  
end