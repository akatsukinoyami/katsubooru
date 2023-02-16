require 'swagger_helper'

endpoint_tag = 'Tags API'

RSpec.describe 'api/tags', type: :request do

  path '/api/tags' do

    get('list tags') do
      tags endpoint_tag
      response(200, 'successful') do
        run_test!
      end
    end
  end
end
