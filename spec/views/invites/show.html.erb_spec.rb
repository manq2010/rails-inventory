require 'rails_helper'

RSpec.describe 'invites/show', type: :view do
  before(:each) do
    assign(:invite, Invite.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
