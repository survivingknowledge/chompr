class MealsController < ApplicationController

    before_action :set_meal, only: [:show, :edit, :update, :destroy]

    def index
      @foods = Meal.all
    end

    def new
      @meal = Meal.new
    end

    def create
      @meal = Meal.new(meal_params)
      if @meal.save
        redirect_to @meal, notice: 'Meal successfully created!'
      else
        render :new
      end
    end

    def show
    end

    def edit
    end

    def update
      if @meal.update(meal_params)
        redirect_to @meal, notice: 'Meal successfully updated!'
      else
        render :edit
      end
    end

    def destroy
      if @meal
        @meal.destroy
      end
      redirect_to meals_path
    end

    private

    def set_meal
      @meal = Meal.find(params[:id])
    end

    def meal_params
      params.require(:meal).permit(
                              :name
      )
    end

end
