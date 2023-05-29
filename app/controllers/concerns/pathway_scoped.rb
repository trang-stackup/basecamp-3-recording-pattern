module PathwayScoped
  extend ActiveSupport::Concern

  included do
    before_action :set_pathway
  end

  private

  def set_pathway
    @pathway = @bucket.recordings.find(params[:recording_id])
  end
end
