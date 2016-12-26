require 'due_payments/landlord'

class LandlordsController < ApplicationController
  layout 'admin'

  def index
    # @tests = DuePayments::Landlord.all
    @landlords = DuePayments::Landlord.all
  end

  def show
  end

  def edit
  end

  def new
    @landlord = DuePayments::Landlord.create_object
  end

  def destroy
    puts "You try to destroy a line."
    # render('index')
    redirect_to '/landlords'
  end

end
