class CakesController < ApplicationController
  before_action :find_cake, only: [:show, :edit, :update, :destroy]

  def index
    @cakes = Cake.all
  end

  def new
    @cake = Cake.new
  end

  def create
    @cake = Cake.new(cake_params)
    if @cake.save
      redirect_to cakes_path, notice: "新增成功！！！！"
    else
      render :new, alert: "新增失敗！！！！"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @cake.update(cake_params)
      redirect_to cakes_path, notice: "成功修改！！！"
    else
      render :edit, notice: "修改失敗！！！"
    end
  end

  def destroy
    @cake.destroy
    redirect_to cakes_path, notice: "刪除完成！！！！"
  end

  private

  def cake_params
    params.require(:cake).permit(:name, :price)
  end

  def find_cake
    @cake = Cake.find_by(id: params[:id])
  end
end
