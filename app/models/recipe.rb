class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_many :directions, dependent: :destroy 


  accepts_nested_attributes_for :ingredients,
                                reject_if: proc { |attributes| attributes['name'].blank? },
                                allow_destroy: true
  accepts_nested_attributes_for :directions,
                                reject_if: proc { |attributes| attributes['step'].blank? },
                                allow_destroy: true

  validates :title, presence: true
  validates :description, presence: true


  has_attached_file :image, styles: { medium: "400x400#", thumb: "100x100#" }, default_url: "https://t3.ftcdn.net/jpg/01/32/80/44/240_F_132804403_Fzf78ONebsM5WZodfoTrTakOmCYlN67T.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


end
