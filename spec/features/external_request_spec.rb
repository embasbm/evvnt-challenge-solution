require 'rails_helper'

feature 'External request' do
  it 'queries Evnnt Api Sandbox' do
    uri = URI('https://api.sandbox.evvnt.com')
    response = Net::HTTP.get(uri)
    expect(response).to be_an_instance_of(String)
  end

  it 'queries Evnnt Api Sandbox to fetch EVENTS' do
    uri = URI('https://evvntchallenge:c2136849e524d6f43b90ac3d7e98e5dc@api.sandbox.evvnt.com/events')
    response = Net::HTTP.get(uri)
    expect(response).to be_an_instance_of(String)
  end

  it 'queries Evnnt Api Sandbox to fetch CATEGORIES' do
    uri = URI('https://evvntchallenge:c2136849e524d6f43b90ac3d7e98e5dc@api.sandbox.evvnt.com/categories')
    response = Net::HTTP.get(uri)
    expect(response).to be_an_instance_of(String)
  end
end