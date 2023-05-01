require 'rails_helper'

RSpec.describe "tunnels/index", type: :view do
  before(:each) do
    assign(:tunnels, [
      Tunnel.create!(
        user: nil,
        password_digest: "Password Digest",
        level: "Level",
        latest_started_at: "Latest Started At",
        latest_ended_at: "Latest Ended At",
        aasm_state: "Aasm State"
      ),
      Tunnel.create!(
        user: nil,
        password_digest: "Password Digest",
        level: "Level",
        latest_started_at: "Latest Started At",
        latest_ended_at: "Latest Ended At",
        aasm_state: "Aasm State"
      )
    ])
  end

  it "renders a list of tunnels" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Password Digest".to_s, count: 2
    assert_select "tr>td", text: "Level".to_s, count: 2
    assert_select "tr>td", text: "Latest Started At".to_s, count: 2
    assert_select "tr>td", text: "Latest Ended At".to_s, count: 2
    assert_select "tr>td", text: "Aasm State".to_s, count: 2
  end
end
