class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :validatable, :confirmable, :omniauthable, omniauth_providers: %i[facebook vkontakte]

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :photos, dependent: :destroy

  validates :name, presence: true, length: { maximum: 35 }

  before_validation :set_name, on: :create

  after_commit :link_subscriptions, on: :create

  mount_uploader :avatar, AvatarUploader

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def self.find_for_oauth(access_token, oauth)
    # Достаём email из токена
    email = access_token.info.email
    user = where(email: email).first
    binding.pry
    # Возвращаем, если нашёлся
    return user if user.present?

    # Если не нашёлся, достаём провайдера, айдишник, урл и имя
    provider = access_token.provider
    id = access_token.extra.raw_info.id
    name = access_token.info.name

    case oauth
    when 'facebook'
      url = "https://facebook.com/#{id}"
      avatar_url = access_token.info.image
    when 'vkontakte'
      url = "https://vk.com/id#{id}"
      avatar_url = access_token.extra.raw_info.photo_200
    end

    # Теперь ищем в базе запись по провайдеру и урлу
    # Если есть, то вернётся, если нет, то будет создана новая
    where(url: url, provider: provider).first_or_create! do |user|
      # Если создаём новую запись, прописываем email и пароль
      user.name = name
      user.email = email
      user.remote_avatar_url = avatar_url
      user.password = Devise.friendly_token.first(16)
    end
  end

  private

  def set_name
    self.name = "Товарисч #{rand(777)}" if self.name.blank?
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email).update_all(user_id: self.id)
  end
end
