# Index action
get '/articles' do
  @articles = Article.all
  erb :'articles/index'
end

# New action
get '/articles/new' do
  @categories = Category.all
  erb :'articles/new'
end

# Create action
post '/articles' do
  @article = Article.new(params[:article])

  if @article.save
    redirect "/articles/#{@article.id}?key=#{@article.key}"
  else
    erb :'articles/new'
  end
end

# Show action
get '/articles/:id' do
  @article = Article.find(params[:id])
  erb :'articles/show'
end

# Edit action
get '/articles/:id/edit' do
  @article = Article.find(params[:id])
  @categories = Category.all
  erb :"articles/edit"
end

# Update action
put '/articles/:id' do
  @article = Article.find(params[:id])
  @article.assign_attributes(params[:article])

  if @article.save
    redirect '/articles'
  else
    p @article.errors.full_messages
    redirect "/articles/#{@article.id}/edit"
  end
end

# Destroy action
delete '/articles/:id' do
  @article = Article.find(params[:id])
  @article.destroy
  redirect '/articles'
end
