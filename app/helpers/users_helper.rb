module UsersHelper

  def gravatar_for(user, options = { size: 80 })
  	size = options[:size]
  	image_tag(letter_avatar_url(user.username_for_avatar, size), alt: user.name, class: "gravatar")
    # gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    # size = options[:size]
    # gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    # #gravatar_url = "https://secure.gravatar.com/avatars/#{gravatar_id}.png?s=#{size}"
    # image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
