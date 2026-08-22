class ListsController < ApplicationController
before_action :set_list, only: [ :destroy, :edit, :show, :update ]
  def index
    @lists = List.all
  end

  def show
  end

  def update
    @list.update(params[:list])
    redirect_to list_path(@list)
  end

  def edit
  end

  def create
      @list = List.create(list_params)
  end

  def new
    @list = List.new
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to list_path(@list), status: :see_other
  end

  private

  def list_params
   params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
