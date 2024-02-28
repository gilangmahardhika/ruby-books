class AuthorsController < ApplicationController
    before_action :get_author, except: [:index, :new, :create]
    before_action :authenticate_user!, except: [:index, :show]

    def index
      @authors = Author.all.page(params[:page]).per(10)
    end
  
    def show; end;
  
    def new
      @author = Author.new
    end
  
    def create
      @author = Author.new(author_params)
      if @author.save
        flash[:success] = "Author successfuly created"
        redirect_to author_path(@author), format: :html
      else
        flash[:error] = @author.errors.full_messages
        render :new
      end
    end
  
    def edit; end;
  
    def update
      if @author.update(author_params)
        flash[:success] = "Author succesffuly updated"
        redirect_to author_path(@author)
      else
        flash[:error] = @author.errors.full_messages
        render :edit
      end
    end
  
    def destroy
      if @author.destroy
        flash[:success] = "Author successfully deleted"
      else
        flash[:error] = "Failed to delete author"
      end
      redirect_to authors_path, format: :html
    end
  
    private
      def get_author
        @author = Author.find(params[:id])
      end
  
      def author_params
        params.require(:author).permit(:name)
      end
  end
  