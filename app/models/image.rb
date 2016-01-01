class Image < ActiveRecord::Base
  belongs_to :visual, polymorphic: true

  has_attached_file :upload,
    path: ":rails_root/public/system/uploads/:id/:style/:filename",
    url: "/system/uploads/:id/:style/:filename"
end
