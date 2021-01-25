class BooksController < ApplicationController
    
    def index
        @books = Book.all
    end
    
    def show
        @book = Book.find(params[:id])
    end
    
    def new
        @book = Book.new
        @book.year = 2020
    end
    def create
        book_params = params.require(:book).permit(:year, :month, :inout, :category, :amount)
        #p "-----------------------------"
        #p book_params
        #p params
        #p "------------------------------"
        @book = Book.new(book_params)
        if @book.save
            redirect_to books_path
        else
            render:new
        end
    end
    def edit
        @book = Book.find(params[:id])
        #p "---------------------"
        #p params[:id]
        #p "---------------------"

    end
    def update
        @book = Book.find(params[:id])
        book_params = params.require(:book).permit(:year, :month, :inout, :category, :amount)
        if @book.update(book_params)
            redirect_to book_path(@book)
        else
            render :edit
        end
    end
    
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    
    end
    
end