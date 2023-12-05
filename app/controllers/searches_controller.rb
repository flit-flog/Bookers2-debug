class SearchesController < ApplicationController
     before_action :authenticate_user!
    def search
        @word=params[:word]
         @model= params[:model]
        search=params[:search]
        
        if @model == "user"
           @record =  user_search(@word,search)
        else 
            @record = book_search(@word,search)
        end    
    end
    
    private
    
    def user_search(word,search)
         if search == "perfect"
            User.where(name: word)
        else search == "part"
            User.where("name Like ?", "%#{word}%")
         end
    end
    
    def book_search(word,search)
        if search == 'perfect'
            Book.where(title: word)
        else search == 'part'
            Book.where("title Like ?", "%#{word}%" )
        end
    end
    
    
end
