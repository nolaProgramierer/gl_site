class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    url: '/ckeditor_assets/pictures/:id/:style_:basename.:extension',
                    path: ':rails_root/public/ckeditor_assets/pictures/:id/:style_:basename.:extension',
                    styles: { content: '800>', thumb: '118x100#' }

  validates_attachment_presence :data
  validates_attachment_size :data, less_than: 2.megabytes
  validates_attachment_content_type :data, content_type: /\Aimage/

  def url_content
    url(:content)
  end
end

#for heroku remote
# has_attached_file :data,
#             # url: '/ckeditor_assets/pictures/:id/:style_:basename.:extension',
#             url: 'glmusicsite.s3.amazonaws.com',
#             # path: ':rails_root/public/ckeditor_assets/pictures/:id/:style_:basename.:extension',
#             path: '/ckeditor_assets/pictures/:id/:style_:basename.:extension',
#             styles: { content: '800>', thumb: '118x100#' },
#                   storage: :s3,
#                   bucket: 'glmusicsite',
#                   s3_credentials:  '#{Rails.root}/config/aws.yml'
#
#   validates_attachment_presence :data
#   validates_attachment_size :data, less_than: 2.megabytes
#   validates_attachment_content_type :data, content_type: /\Aimage/
#
#   def url_content
#     url(:content)
#   end
# end
