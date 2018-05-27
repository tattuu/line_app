class Post < ApplicationRecord
    after_create_commit { PostBroadcastJob.perform_later self }
end
