Rails.application.routes.draw do
  root "projects#index"

  resources :projects do
    resources :pathway_boards, only: :index, module: "projects"
  end

  resources :buckets do
    resources :pathways

    resources :recordings do
      resources :comments
    end
  end

  # recordable_path(recording, filter: 'newest') => bucket_pathway_path(recording.bucket, recording, filter: 'newest')
  # direct(:recordable) { |recording| url_for [ "bucket_#{recording.recordable}", bucket_id: recording.bucket_id, id: recording.id ] }
  direct(:recordable) { |recording| url_for(["bucket_#{recording.recordable_name}".to_sym, bucket_id: recording.bucket_id, id: recording.id]) }
end
