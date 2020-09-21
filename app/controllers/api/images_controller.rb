class Api::ImagesController < ApplicationController
  def index
    @images = Image.all
    render "index.json.jb"
  end

  def show
    image_id = params[:id]
    @image = Image.find_by(id: image_id)
    render "show.json.jb"
  end

  def create
    @image = Image.new(
      url: params[:url],
      product_id: params[:product_id]
    )
    if @image.save #happy path
      render "show.json.jb"
    else #sad path
      render json: { errors: @image.errors.full_messages }, status: 422
    end
  end
  # In backend, pass the POST key-value pairings through Insomnia

  def update
    @image = Image.find(params[:id])

    @image.url = params[:url] || @image.url
    @image.product_id = params[:product_id] || @image.product_id
  
    if @image.save
      render "show.json.jb"
    else
      render json: { errors: @image.errors.full_messages }, status: 422
    end

  end
  # In backend, pass the PATCH key-value pairings through Insomnia
  # If you don't pass something in the params hash, you're overriding the existing code with `null` -- use || to selectively update.

  def destroy
    image = Image.find(params[:id])
    image.destroy
    render json: {message: "Image successfully destroyed!"}
  end
end
