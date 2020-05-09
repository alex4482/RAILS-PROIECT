json.extract! item, :id, :name, :description, :platform, :count, :created_at, :updated_at
json.url item_url(item, format: :json)
