module PhotosHelper
  def image_title(photo)
    <<-INFO_USER
      #{t('photo.photo')}
      #{render partial: 'users/user', object: photo.user}
      #{current_user_can_edit?(photo) ? link_to(fa_icon('trash'), event_photo_path(photo.event, photo),
                                                method: :delete, data: {confirm: t('photo.confirm')}) : ''}
    INFO_USER
  end
end
