require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:user) { create(:user) }

  context 'index' do
    context 'unauthorized' do
      before { get(:index) }

      it { is_expected.to render_template(:index) }
    end

    context 'authorized' do
      before { sign_in(user) && get(:index) }

      it { is_expected.to redirect_to(platform_root_path) }
    end
  end

end
