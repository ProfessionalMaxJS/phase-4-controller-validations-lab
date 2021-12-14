class AuthorsController < ApplicationController
  
  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create!(author_params)
    
    # if author.valid?
    #   render json: author, status: :created
    # else
    #   # byebug
    #   render json: { errors: author.errors.messages}, status: :unprocessable_entity
    # end
      
    render json: author, status: :created
  rescue ActiveRecord::RecordInvalid => invalid
    # byebug
    render json: {errors: invalid.record.errors.messages}, status: :unprocessable_entity

  end

  private
  
  def author_params
    params.permit(:email, :name)
  end
  
end
