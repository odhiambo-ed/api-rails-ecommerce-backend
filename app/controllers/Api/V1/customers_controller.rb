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
    customer = Customer.find_by(email: params[:email])
    if customer && customer.authenticate(params[:password])
      token = customer.generate_token
      render json: { success: true, message: 'Logged in successfully', customer: customer, token: token }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def generate_token(customer_id)
    payload = { customer_id: customer_id }
    JWT.encode(payload, 'secret_key')
  end

  def customer_params
    params.permit(:first_name, :second_name, :email, :password)
  end
end
