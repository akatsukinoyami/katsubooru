require 'swagger_helper'

endpoint_tag = 'Tags API'

RSpec.describe 'api/tags/tags', type: :request do

  path '/api/tags/tags' do

    get('list tags') do
      tags(endpoint_tag)
      response(200, 'successful') do
        run_test!
      end
    end

    post('create tag') do
      tags(endpoint_tag)
      response(200, 'successful') do
        run_test!
      end
    end
  end

  path '/api/tags/tags/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    patch('update tag') do
      tags(endpoint_tag)
      response(200, 'successful') do
        let(:id) { '123' }
        run_test!
      end
    end

    put('update tag') do
      tags(endpoint_tag)
      response(200, 'successful') do
        let(:id) { '123' }
        run_test!
      end
    end
  end
end
