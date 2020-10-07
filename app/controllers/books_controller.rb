class BooksController < ApplicationController

  def new
    @book =Book.new
  end

  def create
    @book = Book.new(book_params)
    # {Book: title:"たいとる", body: "ボディ", user_id: nil.....}
    @book.user_id = current_user.id
    # {User: id:1, email: "e@e", name: "なまえ"........}
    # {Book: title:"たいとる", body: "ボディ", user_id: 1.....}
    if @book.save
        flash[:notice] = "Book was successfully created."
        redirect_to book_path(@book)
    else
        #indexアクションと同じ
        @books = Book.all
        render :index
    end
  end


  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end


  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
