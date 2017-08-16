RSpec::Matchers.define :include_nested do |expected|
  match { |actual| includify(expected).matches?(actual) }

  def includify(object)
    return object unless object.is_a?(Hash)

    hash = object
    hash.each do |key, value|
      hash[key] = includify(value)
    end

    RSpec::Matchers::BuiltIn::Include.new(hash)
  end
end
