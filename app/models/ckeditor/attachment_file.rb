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
                    :url  => "/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    :path => "/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    :styles => { :content => '800>', :thumb => '118x100#' }
validates_attachment_presence :data
validates_attachment_size :data, less_than: 2.megabytes
validates_attachment_content_type :data, content_type: /\Aimage/

  def url_thumb
    @url_thumb ||= Ckeditor::Utils.filethumb(filename)
  end
end
