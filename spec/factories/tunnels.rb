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
FactoryBot.define do
  factory :tunnel do
    user { nil }
    password_digest { "MyString" }
    level { "MyString" }
    latest_started_at { "MyString" }
    latest_ended_at { "MyString" }
    aasm_state { "MyString" }
  end
end
