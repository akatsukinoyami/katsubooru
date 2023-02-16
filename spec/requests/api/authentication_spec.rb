require 'swagger_helper'

endpoint_tag = 'Authentication API'

def schema_hash properties, required
  { type: :object, required:, properties: }
end

def params_hash properties, required
  { name: :param, in: :body, schema: schema_hash(properties, required) }
end

def errors_schema
  schema_hash({ errors: { type: :array } }, %w[errors])
end

RSpec.describe 'Authentication', type: :request do
  include JsonWebToken

  before do
    User.create(name: 'name', email: 'user@mail.com', password: 'password')
  end

  path('/api/auth/sign_in') do
    post('sign_in') do
      let(:param) {}
      tags(endpoint_tag)
      description('Returns JWT token and user object after authentication')
      consumes('application/json')
      parameter(params_hash({
          email: { type: :string },
          password: { type: :string }
        }, %w[email password]))

      response(200, 'Signed in successfully') do
        let(:param) { { email: 'user@mail.com', password: 'password' } }
        schema(schema_hash({
            user: { type: User },
            token: { type: :string },
        }, %w[user token]))
        run_test!
      end

      response(401, 'Unauthorized') do
        let(:param) { { email: 'user@mail.com' } }
        schema(errors_schema)
        run_test!
      end
    end
  end

  path('/api/auth/sign_up') do
    post('sign_up authentication') do
      let(:param) {}
      tags(endpoint_tag)
      description('Returns JWT token and user object after registration')
      consumes('application/json')
      parameter(params_hash({
          name: { type: :string },
          email: { type: :string },
          password: { type: :string },
          avatar: { type: :string, format: :binary }
        }, %w[name email password]))

      response(201, 'Signed up successfully') do
        let(:param) { { name: 'user2', email: 'user2@mail.com', password: 'password' } }
        schema(schema_hash({
          user: { type: User },
          token: { type: :string },
        }, %w[user token]))
        run_test!
      end

      response(422, 'Cannot sign up due to errors') do
        let(:param) { { name: 'user2', email: 'user2@mail.com' } }
        schema(errors_schema)
        run_test!
      end
    end
  end
end
