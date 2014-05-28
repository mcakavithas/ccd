class DepositsController < ApplicationController
  def new
  	#@deposit =  Deposit.new
  end

  def create
  	 @deposit = Deposit.new(params[:deposit]) 
      #@customer.date_folio_allocation_date = Time.now
     if @deposit.save 
       flash[:success] = "Welcome!"
       redirect_to deposits_path  
               
     else
      flash[:alert] = "Deposit not added"
       render 'new'
     end    
  end

  def index
    @deposit =  Deposit.new
  	@deposits = Deposit.all
    #@deposit = Deposit.find(params[:id])

  end

  def show
  	@deposit = Deposit.find(params[:id])
  end
end
