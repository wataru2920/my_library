class BooksController < ApplicationController
  before_action :set_book, only: [:show]
  before_action :login_seigen, {only: [:list, :show]}

  def list
    @books = Book.all.page(params[:page]).per(5)
  end

  def list2
    @books = Book.all
  end

  def show
  end

  def search_form
  end

  def search
    @search = params[:search]
    @method = params[:method]

    if @method == '前方一致'
      @books = Book.where("title LIKE ?", "#{@search}%")
    elsif @method == '後方一致'
      @books = Book.where("title LIKE ?", "%#{@search}")
    else
      @books = Book.where("title LIKE ?", "%#{@search}%")
    end

    if @books.length > 0
      render "books/list2"
    else
      @error = "資料が見付かりませんでした"
      render("books/search_form")
    end
  end

  private
  def set_book
    @book = Book.find(params[:id])
  end
end
