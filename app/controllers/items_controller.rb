class ItemsController < ApplicationController
before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy, :rent, :give_back]

  # GET /items
  # GET /items.json
  def index
    if params[:platform]
        @items = Item.where(platform: params[:platform])
    else
        @items = Item.all
    end
  #binding.pry
  end
  # GET /items/1
  # GET /items/1.json
  def show
  end
    
def search
  @id_item = Item.where(name: params[:q]).first.id
  redirect_to item_path(id: @id_item)
end

  def history
  end

    def rent
        @item.count = @item.count - 1
        @item.save
        current_user.items.push(@item)
        redirect_to items_path
        #redirect_to items_path(**params) 
        
       # @item.users.push(current_user)
    end
    def give_back
        @item.count = @item.count + 1
        @item.save
        current_user.items.delete(@item)
        redirect_to items_path
       # redirect_to items_path(**params) 
      #  @item.users.delete(current_user)
    end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def ps4
        @games = Item.where(platform: 'PS4')
    end
    def pc
        @games = Item.where(platform: 'PC')
    end
    def xbox
        @games = Item.where(platform: 'XBOX')
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :description, :platform, :count)
    end



  
    
end
