require 'due_payments/landlord'
require 'pp'

class LandlordsController < ApplicationController
  layout 'admin'

  def index
    # @tests = DuePayments::Landlord.all
    @landlords = DuePayments::Landlord.all
  end

  def show; end

  def edit; end

  def new; end

  def create
    # We verified that only permitted params is here and not some robots
    values_filled = values_params_filled
    if values_filled.permitted?
      landlord = DuePayments::Landlord.create({
        firstname: values_filled['firstname'],
        lastname: values_filled['lastname'],
        zip_code: values_filled['zip_code'],
        email: values_filled['email'],
        phone_number: values_filled['phone_number'],
        address: values_filled['address'],
        enable: values_filled['enable'] == 'enable'
      })

      flash[:success_message] = 'A new user has just been created :' \
                                "#{landlord.firstname} #{landlord.lastname}"
    end

    redirect_to landlords_path
  end

  def destroy
    # TODO : You can't delete a line because we can remove all transactions
    redirect_to '/landlords'
  end

  private

  def values_params_filled
    params.require(:landlord).permit(
      'zip_code', 'email', 'phone_number',
      'address', 'enable'
    )
  end

end
