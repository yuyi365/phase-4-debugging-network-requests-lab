class ToysController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    toy = Toy.create(toy_params)
    render json: toy, status: :created
  end

  def update
    toy = find_toy
    toy.update(toy_params)
  end

  def destroy
    toy = find_toy
    toy.destroy
    head :no_content
  end

  private

  def find_toy
    Toy.find(params[:id])
  end

  def toy_params
    params.permit(:name, :image, :likes)
  end

  def render_not_found
    render json: { error: 'toy not found' }, status: :not_found
  end
end
