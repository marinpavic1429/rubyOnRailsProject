class TransfersController < ApplicationController
  before_action :set_transfer, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /transfers or /transfers.json
  def index
    @transfers = Transfer.all
  end

  # GET /transfers/1 or /transfers/1.json
  def show
  end

  # GET /transfers/new
  def new
    #@transfer = Transfer.new
    @transfer = current_user.transfers.build
  end

  # GET /transfers/1/edit
  def edit
  end

  # POST /transfers or /transfers.json
  def create
    #@transfer = Transfer.new(transfer_params)
    @transfer = current_user.transfers.build(transfer_params)

    respond_to do |format|
      if @transfer.save
        format.html { redirect_to transfer_url(@transfer), notice: "Transfer was successfully created." }
        format.json { render :show, status: :created, location: @transfer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transfers/1 or /transfers/1.json
  def update
    respond_to do |format|
      if @transfer.update(transfer_params)
        format.html { redirect_to transfer_url(@transfer), notice: "Transfer was successfully updated." }
        format.json { render :show, status: :ok, location: @transfer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transfers/1 or /transfers/1.json
  def destroy
    @transfer.destroy

    respond_to do |format|
      format.html { redirect_to transfers_url, notice: "Transfer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @transfer = current_user.transfers.find_by(id: params[:id])
    redirect_to transfers_path, notice: "Not allowed to edit or delete this transfer!" if @transfer.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transfer
      @transfer = Transfer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transfer_params
      params.require(:transfer).permit(:first_name, :last_name, :club_from, :club_to, :transfer_fee, :user_id)
    end
end
