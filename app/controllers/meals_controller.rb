class MealsController < ApplicationController

    before_action :set_meal, only: [:show, :edit, :update, :destroy]
    before_action :set_session_current_meal

    def index
      @meals = Meal.all
    end

    def new
      @meal = Meal.new
      @current_meal = session[:current_meal].collect do |food_id|
        food = Food.find_by_id(food_id)
        @meal.foods.build({id: food.id})
        food

      end
      @totals = Meal.totals(@current_meal)


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

    def add_food
      @food = Food.find_by_id(params[:food_id])
      session[:current_meal] << @food.id if @food
      redirect_to new_meal_path
    end

    private

    def set_meal
      @meal = Meal.find(params[:id])
    end

    def meal_params
      params.require(:meal).permit(
                              :name,
                              foods_attributes: [:id]
      )
    end

    def set_session_current_meal
      session[:current_meal] ||= []
    end

end
