class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json

before_filter :require_signed_in_user, except: [:index, :show]
before_filter :authorize_user, only: [:edit, :update, :destroy]

def require_signed_in_user
  unless signed_in?
  redirect_to new_session_url, notice: "Must be signed in for that."
  end
end

def authorize_user
  unless signed_in?
  redirect_to new_session_url, notice: "Must be signed in for that."
  end
end


  def index
    @messages = Message.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new
    @message.sender_id = session[:user_id]
    @users = User.where("id != ?", "#{session[:user_id]}")

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])

      if @message.conversation_id.nil?
      @conversation = Conversation.find_by_user_1_id_and_user_2_id(params[:message][:sender_id], params[:message][:receiver_id])
      @conversation ||= Conversation.find_by_user_1_id_and_user_2_id(params[:message][:receiver_id], params[:message][:sender_id])

      if @conversation.nil?
        @conversation = Conversation.new
        @conversation.user_1_id = params[:message][:sender_id]
        @conversation.user_2_id = params[:message][:receiver_id]
        @conversation.save
      end

      @message.conversation_id = @conversation.id
    end

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
end
