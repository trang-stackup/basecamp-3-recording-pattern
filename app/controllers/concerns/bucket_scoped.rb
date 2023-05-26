module BucketScoped
  extend ActiveSupport::Concern

  included do
    before_action :set_bucket
  end

  private

  def set_bucket
    @bucket = Current.account.buckets.find params[:bucket_id]
  end
end
