class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[edit update destroy]

  # GET /badges
  def index
    @badges = Badge.all
  end

  # GET /badges/new
  def new
    @badge = Badge.new
  end

  # GET /badges/1/edit
  def edit; end

  # POST /badges
  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path, notice: t('.created')
    else
      render :new
    end
  end

  # PATCH/PUT /badges/1
  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path, notice: t('.updated')
    else
      render :edit
    end
  end

  # DELETE /badges/1
  def destroy
    @badge.destroy
    redirect_to admin_badges_url, notice: t('.destroyed')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_badge
    @badge = Badge.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def badge_params
    params.require(:badge).permit(:name, :url, :rule)
  end
end
