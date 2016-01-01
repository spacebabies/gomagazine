class Image < ActiveRecord::Base
  belongs_to :visual, polymorphic: true

  has_attached_file :upload
end
