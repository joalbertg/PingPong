# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes for Users', type: :routing do
  it 'routes GET users' do
    expect(get: '/users').to route_to(controller: 'users', action: 'show')
  end

  it 'routes POST users' do
    expect(post: '/users').to route_to(controller: 'users', action: 'create')
  end

  it 'routes PUT or PATCH users' do
    expect(put: '/users').to route_to(controller: 'users', action: 'update')
    expect(patch: '/users').to route_to(controller: 'users', action: 'update')
  end

  it 'routes DELETE users' do
    expect(delete: '/users').to route_to(controller: 'users', action: 'destroy')
  end
end
