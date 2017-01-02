require 'due_payments/estate'
require 'pp'

class EstatesController < ApplicationController
  layout 'admin'

  before_action :init_data

  def index
    @estates = DuePayments::Estate.all
  end

  def new
  end

  def show
  end

  def edit
  end

  private

  def init_data
    @current_page = 'estates'
  end
end
