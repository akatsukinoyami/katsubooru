require 'swagger_helper'

RSpec.describe 'api/entities', type: :request do

  path '/api/entities' do

    get('list entities') do
      tags 'Entity API'
      response(200, 'successful') do
        run_test!
      end
    end

    post('create entity') do
      tags 'Entity API'
      response(200, 'successful') do
        run_test!
      end
    end
  end

  path '/api/entities/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show entity') do
      tags 'Entity API'
      response(200, 'successful') do
        let(:id) { '123' }
        run_test!
      end
    end

    patch('update entity') do
      tags 'Entity API'
      response(200, 'successful') do
        let(:id) { '123' }
        run_test!
      end
    end

    put('update entity') do
      tags 'Entity API'
      response(200, 'successful') do
        let(:id) { '123' }
        run_test!
      end
    end

    delete('delete entity') do
      tags 'Entity API'
      response(200, 'successful') do
        let(:id) { '123' }
        run_test!
      end
    end
  end
end
