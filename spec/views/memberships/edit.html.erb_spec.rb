require 'rails_helper'

RSpec.describe 'memberships/edit', type: :view do
  let(:membership) do
    Membership.create!
  end

  before(:each) do
    assign(:membership, membership)
  end

  it 'renders the edit membership form' do
    render

    assert_select 'form[action=?][method=?]', membership_path(membership), 'post' do
    end
  end
end
