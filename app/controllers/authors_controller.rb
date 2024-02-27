class AuthorsController < ApplicationController
    before_action :get_author, except: [:index, :new, :create]
    def index
      @authors = author.all.page(params[:page]).per(10)
    end
  
    def show; end;
  
    def new
      @author = Author.new
    end
  
    def create
      @author = Author.new(author_params)
      if @author.save
        redirect_to author_path(@author)
      else
        render :new
      end
    end
  
    def edit; end;
  
    def update
      if @author.update(author_params)
        redirect_to author_path(@author)
      else
        render :edit
      end
    end
  
    def destroy
      if @author.destroy
  
      else
  
      end
      redirect_to authors_path
    end
  
    private
      def get_author
        @author = Author.find(params[:id])
      end
  
      def author_params
        params.require(:author).permit(:title, :isbn, :description, :author_id)
      end
  end
  