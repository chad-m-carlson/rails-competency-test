require 'spec_helper'
require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  # describe 'GET #index' do
    # before { get :index }
    # it {expect(response.to have_http_status(:success))}
    # it {should render_template('index')}
  # end
  it {should route(:get, '/articles').to(action: :index)}
  it {should route(:get, '/articles/1').to(action: :show, id: 1)}
  it {should route(:get, '/articles/new').to(action: :new)}
  it {should route(:post, '/articles').to(action: :create)}
  it {should route(:get, '/articles/1/edit').to(action: :edit, id: 1)}
  it {should route(:patch, '/articles/1').to(action: :update, id: 1)}
  it {should route(:delete, '/articles/1').to(action: :destroy, id: 1)}
end

RSpec.describe PagesController, type: :controller do
  it {should route(:get, '/').to(action: :home)}
  it {should route(:get, '/editors_control_panel').to(action: :editors)}
  it {should route(:get, '/admin_control_panel').to(action: :administrator)}

end