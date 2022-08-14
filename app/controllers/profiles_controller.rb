class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy ]

  # GET /profiles or /profiles.json
  def index
    if admin_signed_in?
      @profiles = Profile.all
    elsif user_signed_in?
      redirect_to new_profile_url
    end
  end

  # GET /profiles/1 or /profiles/1.json
  def show
    if admin_signed_in?
      @statuses = Status.where(user_id: @profile.user_id)
    elsif user_signed_in?
      if @profile.user_id != current_user.id
        # If their own profile exists, redirect to it
        if @profile = Profile.find_by(user_id: current_user.id)
          redirect_to profile_url(@profile)
        # Redirect to new profile if it doesn't exist
        else
          redirect_to new_profile_url
        end
      end
    end
  end

  # GET /profiles/new
  def new
    if @profile = Profile.find_by(user_id: current_user.id)
      redirect_to @profile
    elsif
      @profile = Profile.new
    end
  end

  # GET /profiles/1/edit
  def edit
    if Profile.find_by(id: params[:id]).user_id != current_user.id
      redirect_to profiles_url
    end
  end

  # POST /profiles or /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: "Profile was successfully created." }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profiles_url, notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1 or /profiles/1.json
  def destroy
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:name, :birthplace, :birthdate, :gender, :address, :phone_number, :major, :graduation_year, :user_id)
    end
end
