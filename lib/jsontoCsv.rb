class JsonToCsv
  # Convert a json array string to csv
  # return string
  def self.convert(json = "[]")
    puts "Hello word2"
  end

  # Extract keys from a hash, will concat nested keys
  # with a .
  # return Array[string]
  def self.extractKeys(hash = {}, parentsName = "")
    hash.each_with_object([]) do |(k,v),keys|
      if v.is_a? Hash
        keys.concat(self.extractKeys(v, parentsName + k + "."))
      else
        keys << parentsName + k
      end
    end
  end

  # Extract values from a hash, will concat array values
  # with a ,
  # return Array[string]
  def self.extractValues(hash = {})
    hash.each_with_object([]) do |(k,v),values|
      if v.is_a? Hash
        values.concat(self.extractValues(v))
      elsif v.kind_of? Array
        values << '"' + v.join(',') + '"'
      else
        values << v
      end
    end
  end
end
