module DiariesHelper
  
  def render_with_genres(genre_name)
    genre_name.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/, "")
  end
    
  
end
