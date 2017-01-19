class Recipe < ApplicationRecord
  has_many :ingredients
  has_many :directions

  accepts_nested_attributes_for :ingredients,
                                reject_if: proc { |attributes| attributes['name'].blank? },
                                allow_destroy: true
  accepts_nested_attributes_for :directions,
                                reject_if: proc { |attributes| attributes['step'].blank? },
                                allow_destroy: true

  validates :title, presence: true
  validates :description, presence: true


  has_attached_file :image, styles: { medium: "400x400#", thumb: "100x100#" }, default_url: "http://www.prepsos.com/media/catalog/product/cache/1/image/1200x1200/9df78eab33525d08d6e5fb8d27136e95/placeholder/default/Product-Image-Coming-Soon.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


end
