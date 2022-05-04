class BooksController < ActionController::Base
    def index
        @books = Book.all
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)

        if @book.save
            flash[:notice]= "Create Sussess!!"
            redirect_to "/books"
        else
            render :new
        end
    end
    
    def show
        @book = Book.friendly.find(params[:id])
    end
    
    def edit
        @book = Book.friendly.find(params[:id])
    end
    
    def update
        @book = Book.friendly.find(params[:id])

        if @book.update(book_params)
            flash[:notice]= "Update Sussess!!"
            redirect_to "/books"
        else
            render :edit
        end
    end
    
    def destroy
        @book = Book.friendly.find(params[:id])
        @book.destroy      

        flash[:notice]= "Delete Sussess!!"
        redirect_to "/books" 
    end
    
    private

    def book_params
        params.require(:book).permit(:name,:date,:price,:pages,:ISBN)
    end
    
    
end
