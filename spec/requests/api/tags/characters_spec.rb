require 'swagger_helper'

endpoint_tag = 'Tags API'

RSpec.describe 'api/tags/characters', type: :request do

  path '/api/tags/characters' do

    get('list characters') do
      tags(endpoint_tag)
      response(200, 'successful') do
        run_test!
      end
    end

    post('create character') do
      tags(endpoint_tag)
      response(200, 'successful') do
        run_test!
      end
    end
  end

  path '/api/tags/characters/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    patch('update character') do
      tags(endpoint_tag)
      response(200, 'successful') do
        let(:id) { '123' }
        run_test!
      end
    end

    put('update character') do
      tags(endpoint_tag)
      response(200, 'successful') do
        let(:id) { '123' }
        run_test!
      end
    end
  end
end
