class ItemsController < ApplicationController

before_action :set_item, only: [:show, :create, :destroy]

  def index
  	@items = Item.all
  end

  def show
  end

  def new
  	@item = Item.new
  end

  def create
  	@item = Item.create(item_params)

  	respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_path }
    end
  end


  private

  	def set_item
  		@item = Item.find(params[:id]) 
  	end

  	def item_params
  		params.require(:item).permit(:name, :description)
  	end


end
