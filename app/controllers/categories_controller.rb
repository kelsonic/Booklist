# Index action
get '/categories' do
  @categories = Category.all
  erb :'categories/index'
end

# New action
get '/categories/new' do
  erb :'categories/new'
end

# Create action
post '/categories' do
  @category = Category.new(params[:category])

  if @category.save
    redirect '/categories'
  else
    erb :'categories/new'
  end
end

# Show action
get '/categories/:id' do
  @category = Category.find(params[:id])
  erb :'categories/show'
end

# Edit action
get '/categories/:id/edit' do
  @category = Category.find(params[:id])
  erb :'categories/edit'
end

# Update action
put '/categories/:id' do
  @category = Category.find(params[:id])
  @category.assign_attributes(params[:category])

  if @category.save
    redirect '/categories'
  else
    erb :'categories/edit'
  end
end

# Destroy action
delete '/categories/:id' do
  @category = Category.find(params[:id])
  @category.destroy
  redirect '/categories'
end
