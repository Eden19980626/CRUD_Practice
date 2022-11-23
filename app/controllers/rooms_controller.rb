class RoomsController < ApplicationController
  before_action :room_find, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path, notice: "成功新增房源"
    else
      render :new, notice: "新增房源失敗"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to room_path, notice: "成功修改"
    else
      render :edit, notice: "修改失敗"
    end
  end

  def destroy
    @room.destroy
    redirect_to rooms_path, notice: "已成功刪除"
  end

  private

  def room_params
    params.require(:room).permit(:name, :price)
  end

  def room_find
    @room = Room.find_by(id: params[:id])
  end
end
