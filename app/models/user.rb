class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar
  has_many :products
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable
  
  validates :full_name, presence: true, length: {maximum: 50}

  # validates :avatar, allow_blank: true, on: :update, format: { 
  #   with: %r{\.(gif|jpg|jpeg|png)\z}i, message: ' - Please upload only images with file extensions of: jpg, png or gif.'
  # }

  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first
    if user
      if !user.provider
        user.update(uid: auth.uid, provider: auth.provider, image: auth.info.image)
      end
      return user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.full_name = auth.info.name   # assuming the user model has a name
        user.image = auth.info.image # assuming the user model has an image
        # If you are using confirmable and the provider(s) you use validate emails, 
        # uncomment the line below to skip the confirmation emails.
        # user.skip_confirmation!

        user.uid = auth.uid
        user.provider = auth.provider

      end
    end
  end


end
