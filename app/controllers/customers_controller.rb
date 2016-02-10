class CustomersController < ApplicationController
  before_filter :load_instance, :only => [:show, :edit, :update]

  def index
    @customers = Customer.all
  end
  
  def new
    @customer = Customer.new
  end
  
  def create
    @customer = Customer.new(customer_params)
    render (@customer.save ? :show : :new)
  end
  
  def show
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer
    else
      render 'edit'
    end
  end  
private
  def load_instance
    @customer = Customer.find(params[:id])
  end
  def customer_params
    params.require(:customer).permit(:name, :prefix)
  end

end
