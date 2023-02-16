require 'swagger_helper'

RSpec.describe 'api/tags', type: :request do

  path '/api/tags' do

    get('list tags') do
      tags 'Tags API'
      response(200, 'successful') do
        run_test!
      end
    end
  end
end
