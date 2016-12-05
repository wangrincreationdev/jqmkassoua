class AnnouncesController < ApplicationController
  protect_from_forgery
  before_action :set_announce, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:seller, :new, :create, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]

  def seller
    @announces = Announce.where(user: current_user).order("created_at DESC")
  end

  # GET /announces
  # GET /announces.json
  def index
    if params[:category].blank?
      @announces = Announce.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
    else
      @category_id = Category.find_by(nom: params[:category]).id
      @announces = Announce.where(category_id: @category_id).order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
    end
  end

  # GET /announces/1
  # GET /announces/1.json
  def show
  end

  # GET /announces/new
  def new
    @announce = Announce.new
  end

  # GET /announces/1/edit
  def edit
  end

  # POST /announces
  # POST /announces.json
  def create
    @announce = Announce.new(announce_params)
    @announce.user_id = current_user.id

    respond_to do |format|
      if @announce.save
        format.html { redirect_to @announce, notice: 'Announce was successfully created.' }
        format.json { render :show, status: :created, location: @announce }
      else
        format.html { render :new }
        format.json { render json: @announce.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /announces/1
  # PATCH/PUT /announces/1.json
  def update
    respond_to do |format|
      if @announce.update(announce_params)
        format.html { redirect_to @announce, notice: 'Announce was successfully updated.' }
        format.json { render :show, status: :ok, location: @announce }
      else
        format.html { render :edit }
        format.json { render json: @announce.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /announces/1
  # DELETE /announces/1.json
  def destroy
    @announce.destroy
    respond_to do |format|
      format.html { redirect_to announces_url, notice: 'Announce was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_announce
      @announce = Announce.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def announce_params
      params.require(:announce).permit(:nom, :category_id, :description, :prix, :image)
    end

    def check_user
      if current_user != @announce.user
        redirect_to root_url, alert: "Desole, vous etes pas le proprietaire de cette annonce"
      end
    end
end
