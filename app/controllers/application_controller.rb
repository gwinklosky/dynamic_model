class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private
  def load_customer
    @customer = Customer.find(params[:customer_id])
  end

  def problem_class
    ProblemFactory.problem_class(@customer.prefix)
  end

  def solution_class
    ProblemFactory.solution_class(@customer.prefix)
  end
end
