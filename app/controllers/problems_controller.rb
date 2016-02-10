class ProblemsController < ApplicationController
  before_filter :load_customer
  before_filter :load_instance, :only => [:show, :edit, :update]

  def index
    @problems = problem_class.all
  end
  
  def new
    @problem = problem_class.new
    @form_action = "create"
    @form_method = :post 
  end
  
  def create
    @problem = problem_class.new(problem_params)
    render (@problem.save ? :show : :new)
  end
  
  def show
  end

  def edit
    @form_action = "update"
    @form_method = :put
  end

  def update
    if @problem.update(problem_params)
      redirect_to customer_problem_path(:customer_id => @customer.id, :id => @problem.id)
    else
      render 'edit'
    end
  end  
private
  def load_instance
    @problem = problem_class.find(params[:id])
  end
  def problem_params
    params.require(:problem).permit(:title, :description, :severity)
  end

end
