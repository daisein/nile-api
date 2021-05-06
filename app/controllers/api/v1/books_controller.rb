class Api::V1::BooksController < ApplicationController

  def index
    books = Book.all

    render json: BooksRepresenter.new(books).as_json


    #render json: Book.all
  end


  def create
    # some logic
    book = Book.new(book_params)
    #book = Book.new(title: params[:title], author:params[:author])

    if book.save
      render json: book, status: :created
    else
      render json: book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Book.find(params[:id]).destroy!
    head :no_content
  end

  private

  def book_params
    params.require(:book).permit(:title, :author)
  end

  def not_destroyed
    render json:{}, status: :unprocessable_entity
  end

end
