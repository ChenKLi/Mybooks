class BooksController < ActionController::Base
    def index
    end

    def create
        book = Book.new
    end
    
end
