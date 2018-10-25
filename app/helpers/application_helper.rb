module ApplicationHelper

  def full_title(page_title = '')
    base_title = 'GTrack'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end
    def gravatar_for(gamer, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(gamer.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: gamer.gamername, class: "img-circle")
  end

end
