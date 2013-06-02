class ErrandsController < ApplicationController
  # GET /errands
  # GET /errands.json
  def index
    @errands = Errand.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @errands }
    end
  end

  # GET /errands/1
  # GET /errands/1.json
  def show
    @errand = Errand.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @errand }
    end
  end

  # GET /errands/new
  # GET /errands/new.json
  def new
    @errand = Errand.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @errand }
    end
  end

  # GET /errands/1/edit
  def edit
    @errand = Errand.find(params[:id])
  end

  # POST /errands
  # POST /errands.json
  def create
    @errand = Errand.new(params[:errand])

    respond_to do |format|
      if @errand.save
        format.html { redirect_to @errand, notice: 'Errand was successfully created.' }
        format.json { render json: @errand, status: :created, location: @errand }
      else
        format.html { render action: "new" }
        format.json { render json: @errand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /errands/1
  # PUT /errands/1.json
  def update
    @errand = Errand.find(params[:id])

    respond_to do |format|
      if @errand.update_attributes(params[:errand])
        format.html { redirect_to @errand, notice: 'Errand was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @errand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /errands/1
  # DELETE /errands/1.json
  def destroy
    @errand = Errand.find(params[:id])
    @errand.destroy

    respond_to do |format|
      format.html { redirect_to errands_url }
      format.json { head :no_content }
    end
  end
end