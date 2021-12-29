class RecipesController < ApplicationController

    def index
        # session.include? Receipe.user_id 
        user = User.find(session[:user_id])
        render json: user.recipes, status: :ok
    end 

    def create 
        user = User.find_by(id: session[:user_id])
        if user  
        new_recipe = user.recipes.create!(recipe_params)
        render json: new_recipe, status: :created
        else 
        render json: { errors: ["Not authorized"] }, status: :unauthorized
        end 
    end 
    
   private 

   def recipe_params
     params.permit(:title,:instructions,:minutes_to_complete)
   end 
end
