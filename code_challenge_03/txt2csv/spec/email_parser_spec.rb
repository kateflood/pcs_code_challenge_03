require 'spec_helper'
require 'parse.rb'

describe 'email parser' do

  it 'should return the email string as an array if email is well formed' do
    return_array = Parse.parse_email('email@domain.com')
    expect(return_array).to eq(['email@domain.com'])
  end

  it 'should return "Not Found" if email is malformed' do
    return_array = Parse.parse_email('@domain.com')
    expect(return_array).to eq(['Not Found'])

    return_array = Parse.parse_email('domain.com')
    expect(return_array).to eq(['Not Found'])

    return_array = Parse.parse_email('name')
    expect(return_array).to eq(['Not Found'])
  end

end
