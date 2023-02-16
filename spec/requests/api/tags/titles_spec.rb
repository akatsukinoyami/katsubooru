require 'swagger_helper'

RSpec.describe 'api/tags/titles', type: :request do

  path '/api/tags/titles' do

    get('list titles') do
      tags 'Tags API'
      response(200, 'successful') do
        run_test!
      end
    end

    post('create title') do
      tags 'Tags API'
      response(200, 'successful') do
        run_test!
      end
    end
  end

  path '/api/tags/titles/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    patch('update title') do
      tags 'Tags API'
      response(200, 'successful') do
        let(:id) { '123' }
        run_test!
      end
    end

    put('update title') do
      tags 'Tags API'
      response(200, 'successful') do
        let(:id) { '123' }
        run_test!
      end
    end
  end
end
