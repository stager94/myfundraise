class TinymceAssetsController < ApplicationController
  def create
    image = Image.create file: params[:file]

    render json: {
      image: {
        url: image.file.url,
        width: "100%"
      }
    }, content_type: "text/html"
  end
end
