class ItemTransactionsController < ApplicationController
  # GET /item_transactions
  # GET /item_transactions.json
  def index
    @item_transactions = ItemTransaction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @item_transactions }
    end
  end

  # GET /item_transactions/1
  # GET /item_transactions/1.json
  def show
    @item_transaction = ItemTransaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item_transaction }
    end
  end

  # GET /item_transactions/new
  # GET /item_transactions/new.json
  def new
    @item_transaction = ItemTransaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item_transaction }
    end
  end

  # GET /item_transactions/1/edit
  def edit
    @item_transaction = ItemTransaction.find(params[:id])
  end

  # POST /item_transactions
  # POST /item_transactions.json
  def create
    @item_transaction = ItemTransaction.new(params[:item_transaction])

    respond_to do |format|
      if @item_transaction.save
        format.html { redirect_to @item_transaction, notice: 'Item transaction was successfully created.' }
        format.json { render json: @item_transaction, status: :created, location: @item_transaction }
      else
        format.html { render action: "new" }
        format.json { render json: @item_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /item_transactions/1
  # PUT /item_transactions/1.json
  def update
    @item_transaction = ItemTransaction.find(params[:id])

    respond_to do |format|
      if @item_transaction.update_attributes(params[:item_transaction])
        format.html { redirect_to @item_transaction, notice: 'Item transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_transactions/1
  # DELETE /item_transactions/1.json
  def destroy
    @item_transaction = ItemTransaction.find(params[:id])
    @item_transaction.destroy

    respond_to do |format|
      format.html { redirect_to item_transactions_url }
      format.json { head :no_content }
    end
  end
end
