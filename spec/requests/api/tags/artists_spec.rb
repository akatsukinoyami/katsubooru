require 'swagger_helper'

endpoint_tag = 'Tags API'

RSpec.describe 'api/tags/artists', type: :request do

  path '/api/tags/artists' do

    get('list artists') do
      tags(endpoint_tag)
      response(200, 'successful') do
        run_test!
      end
    end

    post('create artist') do
      tags(endpoint_tag)
      response(200, 'successful') do
        run_test!
      end
    end
  end

  path '/api/tags/artists/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    patch('update artist') do
      tags(endpoint_tag)
      response(200, 'successful') do
        let(:id) { '123' }
        run_test!
      end
    end

    put('update artist') do
      tags(endpoint_tag)
      response(200, 'successful') do
        let(:id) { '123' }
        run_test!
      end
    end
  end
end
