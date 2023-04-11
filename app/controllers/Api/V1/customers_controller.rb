require 'securerandom'

class Api::V1::CustomersController < ApplicationController
  # before_action :authenticate_customer!
  # before_action :check_admin, only: [:index, :destroy]

  def index
    @customer = Customer.all
    render json: @customer
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      token = generate_token(@customer.id)
      render json: { success: true, message: 'Customer created successfully', customer: @customer, token: token }, status: :created
    else
      render json: { error: 'Failed to create customer' }, status: :unprocessable_entity
    end
  end

  def login
    customer = Customer.find_for_authentication(email: params[:email])
    if customer&.valid_password?(params[:password])
      render json: { token: customer.generate_jwt }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def signout
    if @current_user.nil?
      render json: { error: 'Not authenticated' }, status: :unauthorized
      return
    end
    @current_user.update(authentication_token: nil)
    render json: { success: true, message: 'Signed out successfully' }, status: :ok
  end


  private

  def generate_token(customer_id)
    payload = { customer_id: customer_id }
    JWT.encode(payload, 'secret_key')
  end

  def customer_params
    params.permit(:first_name, :second_name, :email, :password, :encrypted_password)
  end
end
