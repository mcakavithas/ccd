class DepositsController < ApplicationController
  def new
  	@deposit =  Deposit.new
  end

  def create
  	 @deposit = Deposit.new(params[:deposit]) 
      #@customer.date_folio_allocation_date = Time.now
     if @deposit.save 
      redirect_to deposit_path(@deposit)  
     else
      flash[:alert] = "Deposit not added"
       render 'new'
     end    
  end

  def index
    #@deposit =  Deposit.new
  	@deposits = Deposit.all
    #@deposit = Deposit.find(params[:id])
   end

  def show
  	@deposit = Deposit.find(params[:id])
  end

  def destroy
     @deposit = Deposit.find(params[:id])
     @deposit.destroy
     flash[:notice] = "Deposit deleted successfully"
     redirect_to deposits_path
  end
end
