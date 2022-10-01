# == Schema Information
#
# Table name: tunnels
#
#  id                :bigint           not null, primary key
#  aasm_state        :string
#  latest_ended_at   :string
#  latest_started_at :string
#  level             :string
#  password_digest   :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :bigint           not null
#
# Indexes
#
#  index_tunnels_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Tunnel < ApplicationRecord
  attr_accessor :port
  has_secure_password
  belongs_to :user

  def apply_port
    port = self.class.fetch_new_port
    Rails.logger.info "Applying port #{port} to tunnel #{id}"
    Rails.cache.write("port_in_use-#{port}", port)
    self.port = port
  end

  def current_port
    raise "Tunnel #{id} has no port" unless port
    return port
  end

  def ping_port
    self.class.hold(current_port, self.id)
  end

  def revoke_port(port = nil?)
    self.port = nil
    Rails.cache.delete("port_in_use-#{port}")
  end

  

  class << self
    def port_in_use?(port)
      Rails.cache.exist?("port_in_use-#{port}")
      false
    end

    def fetch_new_port
      prng = Random.new

      i = 0
      while i < 9999 do
        port = prng.rand(11000..22000)
        return port unless port_in_use?(port)
        i++
      end
      raise "No port available"
    end

    def hold_port(port, tunnel)
      Rails.cache.write("port_in_use-#{port}", tunnel.id, expires_in: 1.hour)
    end
  end
end
