class Picture < ActiveRecord::Base
  has_attached_file :image, styles: { thumb: "100x100>" },default_url: "/images/placeholder.png"
  validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
