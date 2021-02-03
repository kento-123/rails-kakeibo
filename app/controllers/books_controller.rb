class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]
    
    def index
        @books = Book.all
        #p "-----------------------"
        #b = @books
        #p b
        #p "------------------------"
        #@books = Book.where(inout: 1).order(:amount)
        @books = @books.where(year: params[:year]) if params[:year].present?
        @books = @books.where(month: params[:month]) if params[:month].present?
        
    end
    
    def show
        #@book = Book.find(params[:id])
    end
    
    def new
        @book = Book.new
        @book.year = Time.zone.today.year
        @book.month = Time.zone.today.month
        @today = Time.zone.now

    end
    def create
        # = Book.new(books_params)
        #book_params = params.require(:book).permit(:year, :month, :inout, :category, :amount)
        #p "-----------------------------"
        #p book_params
        #p params
        #p "------------------------------"
        @book = Book.new(book_params)
         a = @book.year 
         b = @book.month 
         c = @book.category 
        if @book.save
            flash[:notice] = "家計簿に#{a}年#{b}月#{c}を登録しました"
            redirect_to books_path
        else
            flash.now[:alert] = "登録に失敗しました。"
            render:new
        end
    end
    def edit
        #@book = Book.find(params[:id])
        #p "---------------------"
        #p params[:id]
        #p "---------------------"

    end
    def update
        #@book = Book.find(params[:id])
        #book_params = params.require(:book).permit(:year, :month, :inout, :category, :amount)
        if @book.update(book_params)
            flash[:notice] = "データを1件更新しました"
            redirect_to book_path(@book)
        else
            flash.now[:alert] = "更新に失敗しました。"
            render :edit
        end
    end
    
    def destroy
        #@book = Book.find(params[:id])
        @book.destroy
        flash[:notice] = "削除しました"
        redirect_to books_path
    
    end
    
    private
    
    def set_book
        @book = Book.find(params[:id])
    end

    def book_params
        book_params = params.require(:book).permit(:year, :month, :inout, :category, :amount)
    end
    
    
end