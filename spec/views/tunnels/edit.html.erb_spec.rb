require 'rails_helper'

RSpec.describe "tunnels/edit", type: :view do
  before(:each) do
    @tunnel = assign(:tunnel, Tunnel.create!(
      user: nil,
      password_digest: "MyString",
      level: "MyString",
      latest_started_at: "MyString",
      latest_ended_at: "MyString",
      aasm_state: "MyString"
    ))
  end

  it "renders the edit tunnel form" do
    render

    assert_select "form[action=?][method=?]", tunnel_path(@tunnel), "post" do

      assert_select "input[name=?]", "tunnel[user_id]"

      assert_select "input[name=?]", "tunnel[password_digest]"

      assert_select "input[name=?]", "tunnel[level]"

      assert_select "input[name=?]", "tunnel[latest_started_at]"

      assert_select "input[name=?]", "tunnel[latest_ended_at]"

      assert_select "input[name=?]", "tunnel[aasm_state]"
    end
  end
end
