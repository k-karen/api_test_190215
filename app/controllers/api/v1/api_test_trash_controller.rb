module Api::V1
  class ApiTestTrashController < ApplicationController
    before_action :load_data, only: %i(show destroy update)
    before_action :load_datas, only: :index

    def index
      render json: { status: :ok, data: @atts }
    end

    def show
      render json: { status: :ok, data: @att }
    end

    def create
      if (att = ApiTestTrash.new(permit_params)).save
        render json: { status: :created, data: att }
      else
        render json: { status: :bad_request, data: att.errors }
      end
    end

    def destroy
      @att.destroy
      render json: { status: :ok, data: @att }
    end

    def update
      if @att.update(permit_params)
        render json: { status: :ok, data: @att }
      else
        render json: { status: :bad_request, data: @att }
      end
    end

    private

    def load_data
      @att = ApiTestTrash.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { status: :not_found }
    end

    def load_datas
      @atts = ApiTestTrash.order(created_at: :desc)
    end

    def permit_params
      params.require(:api_test_trash).permit(:alpha, :beta)
    end
  end
end
