module ApplicationHelper
  def avatar_url(user)
    if user.avatar.attached?
      url_for(user.avatar) #if user uploaded an avatar or logo
    elsif user.image? #image from facebook
      user.image
    else
      ActionController::Base.helpers.asset_path('avatar/icon-avatar.png')
    end


  end
end
