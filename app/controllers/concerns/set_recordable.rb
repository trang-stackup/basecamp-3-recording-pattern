module SetRecordable
  extend ActiveSupport::Concern

  included do
    before_action :set_recordable, only: [:show, :edit, :update]
  end

  private

  def set_recordable
    @recording = @bucket.recordings.find(params[:id])
    @recordable = @recording.recordable
  end
end
