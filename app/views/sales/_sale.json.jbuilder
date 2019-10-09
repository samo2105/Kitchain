json.extract! sale, :id, :worker_id, :total, :payed, :comment, :table_id, :created_at, :updated_at
json.url sale_url(sale, format: :json)
