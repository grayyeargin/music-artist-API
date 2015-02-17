module Api
  module V1
    class ArtistsController < ApplicationController

      def index
        artists = Artist.query(options["query"])
        render json: artists
      end

       def options
        defaults.merge(params)
      end

      def defaults
        {"query" => ""}
      end

    end
  end
end