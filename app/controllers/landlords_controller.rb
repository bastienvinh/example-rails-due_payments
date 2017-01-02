require 'due_payments/landlord'

class LandlordsController < ApplicationController

  layout 'admin'

  # rescue_from ActiveRecord::RecordNotFound, with: :not_found_landlord
  rescue_from DuePayments::LandlordNotFoundException, with: :not_found_landlord
  before_action :init_data


  def index
    # @tests = DuePayments::Landlord.all
    @landlords = DuePayments::Landlord.all
  end

  def show; end

  def edit
    @landlord = DuePayments::Landlord.find(params[:id].to_i)
  end

  def update
    @landlord = DuePayments::Landlord.find(params[:id].to_i)

    values_filled = values_params_filled
    if values_filled.permitted?
      @landlord.firstname = values_filled['firstname']
      @landlord.lastname = values_filled['lastname']
      @landlord.zip_code = values_filled['zip_code']
      @landlord.email = values_filled['email']
      @landlord.phone_number = values_filled['phone_number']
      @landlord.address = values_filled['address']
      @landlord.enable = values_filled['enable'] == 'enable'
    end

    if DuePayments::Landlord.update(@landlord)
      flash[:success_message] = 'User updated :' \
                                "#{@landlord.firstname} #{@landlord.lastname}"
      redirect_to landlords_path
    else
      flash[:error_form_message] = 'Update failed'
      render('edit')
    end
  end

  def new; end

  def create
    # We verified that only permitted params is here and not some robots
    values_filled = values_params_filled
    if values_filled.permitted?
      landlord = DuePayments::Landlord.create(
        firstname: values_filled['firstname'],
        lastname: values_filled['lastname'],
        zip_code: values_filled['zip_code'],
        email: values_filled['email'],
        phone_number: values_filled['phone_number'],
        address: values_filled['address'],
        enable: values_filled['enable'] == 'enable'
      )

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
      'firstname', 'lastname',
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

  def init_data
    @current_page = 'landlords'
  end

end
