require 'rails_helper'

RSpec.describe "memberships/show", type: :view do
  before(:each) do
    assign(:membership, Membership.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
