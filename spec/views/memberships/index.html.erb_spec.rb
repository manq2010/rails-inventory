require 'rails_helper'

RSpec.describe 'memberships/index', type: :view do
  before(:each) do
    assign(:memberships, [
             Membership.create!,
             Membership.create!
           ])
  end

  it 'renders a list of memberships' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
