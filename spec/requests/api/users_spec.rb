require 'swagger_helper'

RSpec.describe 'api/users', type: :request do

  path '/api/users' do

    get('list users') do
      tags 'Users API'
      response(200, 'successful') do
        run_test!
      end
    end
  end

  path '/api/users/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show user') do
      tags 'Users API'
      response(200, 'successful') do
        let(:id) { '123' }
        run_test!
      end
    end

    patch('update user') do
      tags 'Users API'
      response(200, 'successful') do
        let(:id) { '123' }
        run_test!
      end
    end

    put('update user') do
      tags 'Users API'
      response(200, 'successful') do
        let(:id) { '123' }
        run_test!
      end
    end

    delete('delete user') do
      tags 'Users API'
      response(200, 'successful') do
        let(:id) { '123' }
        run_test!
      end
    end
  end
end
