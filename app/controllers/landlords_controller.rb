require 'due_payments/landlord'
require 'pp'

class LandlordsController < ApplicationController
  layout 'admin'

  # rescue_from ActiveRecord::RecordNotFound, with: :not_found_landlord
  rescue_from DuePayments::LandlordNotFoundException, with: :not_found_landlord


  def index
    # @tests = DuePayments::Landlord.all
    @landlords = DuePayments::Landlord.all
  end

  def show; end

  def edit
    @landlord = DuePayments::Landlord.find(params[:id].to_i)
    pp @landlord
  end

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
    redirect_to landlords_path
  end

  private

  def values_params_filled
    params.require(:landlord).permit(
      'zip_code', 'email', 'phone_number',
      'address', 'enable'
    )
  end

  def not_found_landlord
    id = params[:id]
    flash[:error_server] = "Can't find user "
    flash[:error_server] << (id ? "with id : #{id}" : ' ...')
    redirect_to landlords_path
  end

end
