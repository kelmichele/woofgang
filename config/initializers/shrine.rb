require 'shrine'

# if Rails.env.development?
# 	require 'shrine/storage/file_system'
# 	Shrine.storages = {
# 		# temporary storage
# 	  cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'),

# 	  # permanent storage
# 	  store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/store')
# 	}
# else
  require "shrine/storage/s3"

	s3_options = {
	  access_key_id:     Rails.application.credentials.aws[:access_key_id],
	  secret_access_key: Rails.application.credentials.aws[:secret_access_key],
	  region:            "us-east-1",
	  bucket:            "woofgang"
	}

	Shrine.storages = {
	  # cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
	  # store: Shrine::Storage::S3.new(prefix: "store", **s3_options)
	  cache: Shrine::Storage::S3.new(prefix: "cache", upload_options: { acl: "public-read" }, **s3_options),
	  store: Shrine::Storage::S3.new(prefix: "store", upload_options: { acl: "public-read" }, **s3_options)
	}
	Shrine.plugin :url_options, cache: { public: true }, store: { public: true }
# end

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for forms