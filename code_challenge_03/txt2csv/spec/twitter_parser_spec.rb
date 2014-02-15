require 'spec_helper'

describe 'Twitter parser' do

  it 'should remove @ symbols if they exist' do
    return_array = Parse.parse_twitter("@twit_handle")
    expect(return_array).to eq(["twit_handle"])
  end

  it 'should handle usernames with no @ symbols' do
    return_array = Parse.parse_twitter("twit_handle")
    expect(return_array).to eq(["twit_handle"])
  end

  it 'should handle empty strings' do
    return_array = Parse.parse_twitter("")
    expect(return_array).to eq([""])
  end

end
  