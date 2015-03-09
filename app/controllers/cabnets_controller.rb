class CabnetsController < ApplicationController
  before_action :set_cabnet, only:[:show, :edit, :update]

  def index
    @cabnets = Cabnet.all
  end

  def show
  end

  def new
    @cabnet = Cabnet.new
  end

  def create
    cabnet = Cabnet.new(cabnet_params)
    if cabnet.save
      flash[:notice] = 'Thank you for making a new cabnet'
      redirect_to cabnet_path(cabnet)
    else
      @cabnet = cabnet
      render :new
    end
  end

  def edit
  end

  def update
    if @cabnet.update(cabnet_params)
      flash[:notice] = 'Cabnet is updated'
      redirect_to cabnet_path(@cabnet)
    else
      render :edit
    end
  end

  def destroy
    cabnet = Cabnet.find(params[:id])
    cabnet.destroy
    flash[:notice] = 'Goodbye!'
    redirect_to root_path
  end

  private

  def cabnet_params
    params.require(:cabnet).permit(:name)
  end

  def set_cabnet
    @cabnet = Cabnet.find(params[:id])
  end

end
