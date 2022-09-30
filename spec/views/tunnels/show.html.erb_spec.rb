require 'rails_helper'

RSpec.describe "tunnels/show", type: :view do
  before(:each) do
    @tunnel = assign(:tunnel, Tunnel.create!(
      user: nil,
      password_digest: "Password Digest",
      level: "Level",
      latest_started_at: "Latest Started At",
      latest_ended_at: "Latest Ended At",
      aasm_state: "Aasm State"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Password Digest/)
    expect(rendered).to match(/Level/)
    expect(rendered).to match(/Latest Started At/)
    expect(rendered).to match(/Latest Ended At/)
    expect(rendered).to match(/Aasm State/)
  end
end
