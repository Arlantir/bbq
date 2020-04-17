class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # def facebook
  #   binding.pry
  #   # Дёргаем метод модели, который найдёт пользователя
  #   @user = User.find_for_facebook_oauth(request.env['omniauth.auth'])
  #
  #   # Если юзер есть, то логиним и редиректим на его страницу
  #   if @user.persisted?
  #     flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: 'Facebook')
  #     sign_in_and_redirect @user, event: :authentication
  #     # Если неудачно, то выдаём ошибку и редиректим на главную
  #   else
  #     flash[:error] = I18n.t(
  #       'devise.omniauth_callbacks.failure',
  #       kind: 'Facebook',
  #       reason: 'authentication error'
  #     )
  #
  #     redirect_to root_path
  #   end
  # end

  def vkontakte
    binding.pry
    # Дёргаем метод модели, который найдёт пользователя
    @user = User.find_for_authentication(request.env['omniauth.auth'])

    # Если юзер есть, то логиним и редиректим на его страницу
    if @user.blank?
      flash[:error] = I18n.t(
        'devise.omniauth_callbacks.failure',
        kind: 'Vkontakte',
        reason: 'authentication error'
      )

      redirect_to root_path
    elsif @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: 'Vkontakte')
      sign_in_and_redirect @user, event: :authentication
      # Если неудачно, то выдаём ошибку и редиректим на главную
    else
      flash[:error] = I18n.t(
        'devise.omniauth_callbacks.failure',
        kind: 'Vkontakte',
        reason: 'authentication error'
      )

      redirect_to root_path
    end
  end
end
