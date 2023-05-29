class SkillsController < ApplicationController
  include BucketScoped
  include PathwayScoped
  include SetRecordable

  def create
    @recording = @bucket.record new_skill, parent: @pathway

    respond_to do |format|
      format.html { redirect_to bucket_pathway_url(@bucket, @pathway) }
    end
  end

  private

  def new_skill
    Skill.new params.require(:skill).permit(:content)
  end
end
