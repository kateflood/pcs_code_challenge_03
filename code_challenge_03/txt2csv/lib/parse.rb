require 'pry'

class Parse

  def self.parse_name (prefixes, suffixes, name_string)

    parsed_name = {pre:"", first:"", middle:"", last:"", suffix:""}

    # get the last word and see if it's a suffix
    # if so, save as suffix and store the next to last word as last_name
    # otherwise store last word as last name

    word = name_string.split
    parsed_name[:suffix] = word.pop if suffixes.include? word.last
    parsed_name[:last] = word.pop
    parsed_name[:pre] = word.shift if prefixes.include? word.first
    parsed_name[:first] = word.shift if word.first
    parsed_name[:middle] = word.shift if word.first 

    parsed_name.values
  end

  def self.parse_phone (phone_string)

    parsed_phone = {cc:"", area:"", pre:"", line:"", ext:""}

    serialized_phone = phone_string.scan(/(\d+)/).flatten

    parsed_phone[:cc] = serialized_phone.shift if serialized_phone.first.length < 3
    parsed_phone[:area] = serialized_phone.shift
    parsed_phone[:pre] = serialized_phone.shift
    parsed_phone[:line] = serialized_phone.shift
    parsed_phone[:ext] = serialized_phone.shift if serialized_phone.first


    parsed_phone.values
  end

  def self.parse_twitter (twitter_string)
    parsed_twitter = [twitter_string.match(/(?!@)(\S+)/).to_s]
  end
  
end