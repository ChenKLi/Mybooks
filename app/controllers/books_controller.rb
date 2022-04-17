class BooksController < ActionController::Base
    def index
    end

    def new
        @book = Book.new
    end
    
    def create
        @book = Book.new(book_params)

        if @book.save
            redirect_to '/books'
        else
        end
    end
    
    private

    def book_params
        params.require(:book).permit(:name , :date , :price, :pages,:ISBN)
    end

end
