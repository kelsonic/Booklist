helpers do

  def valid_key?
    params[:key] == @article.key ? true : false
  end

end
