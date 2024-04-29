json.extract! board, :id, :user_id, :width, :height, :mine_number, :name, :created_at, :updated_at
json.url board_url(board, format: :json)
