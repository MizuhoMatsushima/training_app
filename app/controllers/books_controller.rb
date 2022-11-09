class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    tag_list = params[:book][:name].split(',')
    if @book.save & @book.save_tag(tag_list)
      redirect_to books_index_path, notice: '投稿が完了しました'
    else
      render index
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_index_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
