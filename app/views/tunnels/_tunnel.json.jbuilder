json.extract! tunnel, :id, :user_id, :password_digest, :level, :latest_started_at, :latest_ended_at, :aasm_state, :created_at, :updated_at
json.url tunnel_url(tunnel, format: :json)
