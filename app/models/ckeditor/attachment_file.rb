class Ckeditor::AttachmentFile < Ckeditor::Asset
#   has_attached_file :data,
#                     url: '/ckeditor_assets/attachments/:id/:filename',
#                     path: ':rails_root/public/ckeditor_assets/attachments/:id/:filename'
#
#   validates_attachment_presence :data
#   validates_attachment_size :data, less_than: 100.megabytes
#   do_not_validate_attachment_file_type :data
#
#   def url_thumb
#     @url_thumb ||= Ckeditor::Utils.filethumb(filename)
#   end
# end
has_attached_file :data,
                  # url: '/ckeditor_assets/attachments/:id/:filename',
                  url: 'https://s3.amazonaws.com',
                  # path: ':rails_root/public/ckeditor_assets/attachments/:id/:filename',
                  path: ':id/:filename',
                  :storage => :s3,
                  :bucket => 'gl-music-site',
                  :s3_credentials => "#{Rails.root}/config/aws.yml"



validates_attachment_presence :data
validates_attachment_size :data, less_than: 100.megabytes
do_not_validate_attachment_file_type :data

def url_thumb
  @url_thumb ||= Ckeditor::Utils.filethumb(filename)
end
end
