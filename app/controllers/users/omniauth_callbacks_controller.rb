class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    # Дёргаем метод модели, который найдёт пользователя
    @user = User.find_for_oauth(request.env['omniauth.auth'], 'facebook')

    process_oauth_user(@user, 'Facebook')
  end

  def vkontakte
    # Дёргаем метод модели, который найдёт пользователя
    @user = User.find_for_oauth(request.env['omniauth.auth'], 'vkontakte')

    process_oauth_user(@user, 'Vkontakte')
  end

  private

  def process_oauth_user(user, social)
    # Если юзер есть, то логиним и редиректим на его страницу
    if user.blank?
      flash[:error] = I18n.t(
        'devise.omniauth_callbacks.failure',
        kind: social,
        reason: 'authentication error'
      )

      redirect_to root_path
    elsif user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: social)
      sign_in_and_redirect user, event: :authentication
      # Если неудачно, то выдаём ошибку и редиректим на главную
    else
      flash[:error] = I18n.t(
        'devise.omniauth_callbacks.failure',
        kind: social,
        reason: 'authentication error'
      )

      redirect_to root_path
    end
  end
end
