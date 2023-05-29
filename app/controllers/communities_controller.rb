class CommunitiesController < ApplicationController
  def index
    # @communities = Current.account.communities.all
    @communities = Community.where(id: Current.account.buckets.pluck(:bucketable_id))
  end

  def show
    # @community = Current.account.communities.find params[:id]
    @community = Current.account.buckets.find_by(bucketable_id: params[:id])&.bucketable
  end

  def new
    @community = Current.account.communities.new
  end

  def create
    @community = Current.account.communities.new(community_params)

    if @community.save
      redirect_to community_path(@community), notice: "Community created successfully."
    else
      render :new
    end
  end

  private

  def community_params
    params.require(:community).permit(:title)
  end
end
