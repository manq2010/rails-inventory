require 'rails_helper'

RSpec.describe 'invites/index', type: :view do
  before(:each) do
    assign(:invites, [
             Invite.create!,
             Invite.create!
           ])
  end

  it 'renders a list of invites' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
