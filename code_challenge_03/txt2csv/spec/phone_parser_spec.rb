require 'spec_helper'
require 'parse.rb'

# it "should parse last names" do   
#   return_array = Parse.parse(prefixes, suffixes, "Madona")
#   expect(return_array).to eq(["","","","Madona",""])
# end

describe 'Phone parser' do

  it 'should parse country codes' do
    return_array = Parse.parse_phone('1-234-567-8910')
    expect(return_array[0]).to eq('1')
  end

  it 'should parse area codes' do
    return_array = Parse.parse_phone('234-567-8910')
    expect(return_array[1]).to eq('234')
  end

  it 'should parse phone prefixes' do
    return_array = Parse.parse_phone('1-234-567-8910 x456')
    expect(return_array[2]).to eq('567')
  end

  it 'should parse lines' do
    return_array = Parse.parse_phone('1-234-567-8910')
    expect(return_array[3]).to eq('8910')
  end

  it 'should parse extensions' do
    return_array = Parse.parse_phone('1-234-567-8910 x998')
    expect(return_array[4]).to eq('998')
  end

  it 'should parse whole phone numbers' do
    return_array = Parse.parse_phone('1-234-567-8910 x456')
    expect(return_array).to eq(['1', '234', '567', '8910', '456'])
  end

end
