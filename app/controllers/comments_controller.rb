class CommentsController < ApplicationController
  include BucketScoped
  include PathwayScoped
  include SetRecordable

  def create
    @recording = @bucket.record new_comment, parent: @pathway

    respond_to do |format|
      format.html { redirect_to bucket_pathway_url(@bucket, @pathway) }
    end
  end

  private

  def new_comment
    Comment.new params.require(:comment).permit(:content)
  end
end
