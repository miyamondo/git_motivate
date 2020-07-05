module DiariesHelper
  
  def render_with_genres(genre_name)
    genre_name.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/, "") { |word| link_to word, "/diaries/genre/#{word.delete("#")}",data: {"turbolinks" => false} }.html_safe
  end
end
