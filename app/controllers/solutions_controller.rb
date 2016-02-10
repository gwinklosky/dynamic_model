class SolutionsController < ApplicationController
  before_filter :load_customer
  before_filter :load_problem
  before_filter :load_instance, :only => [:show, :edit, :update]

  def index
    @solutions = solution_class.where(:problem_id => @problem.id)
  end

  def new
    @solution = solution_class.new(:problem => @problem)
    @form_action = "create"
    @form_method = :post 
  end
  
  def create
    @solution = solution_class.create(solution_params.merge(:problem_id => @problem.id))
    if @solution.errors.empty?
      go_back_to_problem
    else
      @solution.problem = @problem
      render :new
    end
  end
  
  def show
  end

  def edit
    @form_action = "update"
    @form_method = :put
  end

  def update
    if @solution.update(solution_params)
      go_back_to_problem
    else
      render 'edit'
    end
  end

private
  def load_problem
    @problem = problem_class.find(params[:problem_id])
  end
  def load_instance
    @solution = solution_class.find(params[:id])
    @solution.problem = @problem
  end
  def solution_params
    params.require(:solution).permit(:explanation)
  end
  def go_back_to_problem
    redirect_to customer_problem_solutions_path(:customer_id => @customer.id,
      :id => @problem.id)
  end
end
