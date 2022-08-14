class StatusesController < ApplicationController
  before_action :set_status, only: %i[ show edit update destroy ]

  # GET /statuses or /statuses.json
  def index
    if admin_signed_in?
      @statuses = Status.all
      respond_to do |format|
        format.html
        format.csv { send_data Status.to_csv, filename: "statuses-#{DateTime.now.strftime("%d%m%Y%H%M")}.csv"}
      end
    elsif user_signed_in?
      @statuses = Status.where(user_id: current_user.id)
    end
  end

  # GET /statuses/1 or /statuses/1.json
  def show
  end

  # GET /statuses/new
  def new
    @status = Status.new
  end

  # GET /statuses/1/edit
  def edit
  end

  # POST /statuses or /statuses.json
  def create
    @status = Status.new(status_params)

    respond_to do |format|
      if @status.save
        format.html { redirect_to statuses_url, notice: "Status was successfully created." }
        format.json { render :show, status: :created, location: @status }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statuses/1 or /statuses/1.json
  def update
    respond_to do |format|
      if @status.update(status_params)
        if admin_signed_in?
          format.html { redirect_to profile_url(Profile.find_by(user_id: @status.user_id)), notice: "Status was successfully updated." }
        elsif user_signed_in?
          format.html { redirect_to statuses_url, notice: "Status was successfully updated." }
        end
        format.json { render :show, status: :ok, location: @status }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statuses/1 or /statuses/1.json
  def destroy
    @status.destroy

    respond_to do |format|
      if admin_signed_in?
        format.html { redirect_to profile_url(Profile.find_by(user_id: @status.user_id)), notice: "Status was successfully destroyed." }
      elsif user_signed_in?
        format.html { redirect_to statuses_url, notice: "Status was successfully destroyed." }
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def status_params
      params.require(:status).permit(:category, :name, :position, :address, :start_date, :end_date, :comment, :user_id)
    end
end
