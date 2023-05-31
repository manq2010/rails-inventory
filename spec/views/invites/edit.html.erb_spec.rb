require 'rails_helper'

RSpec.describe 'invites/edit', type: :view do
  let(:invite) do
    Invite.create!
  end

  before(:each) do
    assign(:invite, invite)
  end

  it 'renders the edit invite form' do
    render

    assert_select 'form[action=?][method=?]', invite_path(invite), 'post' do
    end
  end
end
