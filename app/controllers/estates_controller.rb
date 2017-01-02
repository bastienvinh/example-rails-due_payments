require 'due_payments/estate'
require 'pp'

class EstatesController < ApplicationController

  layout 'admin'

  def index
    @estates = DuePayments::Estate.all
  end

  def new
  end

  def show
  end

  def edit
  end
end
