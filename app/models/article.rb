class Article < ActiveRecord::Base
  belongs_to :articletype
  belongs_to :author

  has_one :image, as: :visual
  has_many :images, as: :visual

  to_param :head
end
