require 'rails_helper'

RSpec.describe "tunnels/new", type: :view do
  before(:each) do
    assign(:tunnel, Tunnel.new(
      user: nil,
      password_digest: "MyString",
      level: "MyString",
      latest_started_at: "MyString",
      latest_ended_at: "MyString",
      aasm_state: "MyString"
    ))
  end

  it "renders new tunnel form" do
    render

    assert_select "form[action=?][method=?]", tunnels_path, "post" do

      assert_select "input[name=?]", "tunnel[user_id]"

      assert_select "input[name=?]", "tunnel[password_digest]"

      assert_select "input[name=?]", "tunnel[level]"

      assert_select "input[name=?]", "tunnel[latest_started_at]"

      assert_select "input[name=?]", "tunnel[latest_ended_at]"

      assert_select "input[name=?]", "tunnel[aasm_state]"
    end
  end
end
