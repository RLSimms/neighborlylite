class SharedItemsController < ApplicationController
  # GET /shared_items
  # GET /shared_items.json
  def index

    if params[:search]
    shared_item = SharedItem.where("name LIKE ?", "%#{params[:search]}%").first
    if shared_item
      @shared_items = SharedItem.where("name LIKE ?", "#{shared_item.name}")
    else
      @shared_items = SharedItem.all
    end
  else
    @shared_items = SharedItem.all
  end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shared_items }
    end
  end

  # GET /shared_items/1
  # GET /shared_items/1.json
  def show
    @shared_item = SharedItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shared_item }
    end
  end

  # GET /shared_items/new
  # GET /shared_items/new.json
  def new
    @shared_item = SharedItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shared_item }
    end
  end

  # GET /shared_items/1/edit
  def edit
    @shared_item = SharedItem.find(params[:id])
  end

  # POST /shared_items
  # POST /shared_items.json
  def create
    @shared_item = SharedItem.new(params[:shared_item])

    respond_to do |format|
      if @shared_item.save
        format.html { redirect_to @shared_item, notice: 'Shared item was successfully created.' }
        format.json { render json: @shared_item, status: :created, location: @shared_item }
      else
        format.html { render action: "new" }
        format.json { render json: @shared_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shared_items/1
  # PUT /shared_items/1.json
  def update
    @shared_item = SharedItem.find(params[:id])

    respond_to do |format|
      if @shared_item.update_attributes(params[:shared_item])
        format.html { redirect_to @shared_item, notice: 'Shared item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shared_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shared_items/1
  # DELETE /shared_items/1.json
  def destroy
    @shared_item = SharedItem.find(params[:id])
    @shared_item.destroy

    respond_to do |format|
      format.html { redirect_to shared_items_url }
      format.json { head :no_content }
    end
  end
end
