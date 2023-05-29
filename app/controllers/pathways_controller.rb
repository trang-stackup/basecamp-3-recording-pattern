class PathwaysController < ApplicationController
  include BucketScoped
  include SetRecordable

  def index
    @pathways = @bucket.recordings.where(recordable_type: "Pathway")
  end

  def show
    @comments = @recording.children.comments
  end

  def new
    @pathway = Pathway.new
  end

  def edit; end

  def create
    @recording = @bucket.record new_pathway

    respond_to do |format|
      format.html { redirect_to bucket_pathway_url(@bucket, @recording), notice: "Pathway was successfully created." }
    end
  end

  def update
    @recording.update! recordable: new_pathway

    respond_to do |format|
      format.html { redirect_to bucket_pathway_url(@bucket, @recording), notice: "Pathway was successfully updated." }
    end
  end

  private

  def new_pathway
    Pathway.new params.require(:pathway).permit(:subject, :content)
  end
end
