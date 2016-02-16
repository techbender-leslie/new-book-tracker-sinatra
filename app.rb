class BigFrank < Sinatra::Base
  get '/' do 
    @books= Book.all
    erb :index
  end

  get '/books' do 
    @books = Book.order("created_at DESC")
    # @books = Book.all
    erb :index
  end

  get '/books/new' do
    @book = Book.new
    erb :new
  end

  post '/books' do
    @book = Book.new(params[:book])
    if @book.save
      redirect("/books/#{@book.id}")
    else
      erb :new
    end
  end

  get '/books/:id/edit' do 
    @book = Book.find(params[:id])
    erb :edit
  end

  get '/books/:id' do
    @book = Book.find(params[:id])
    erb :show
  end

  post '/books/:id/edit' do
    @book = Book.find(params[:id])
    @book.update(params[:book])
    redirect "/books/#{@book.id}"
  end

  post '/books/:id' do
    @book = Book.find(params[:id])
    @book.destroy
    
    redirect '/books'
  end

end