require 'active_support/core_ext'

class String
  def to_class_name
    to_s.downcase.gsub(/[\- ]/, '_').camelize(:upper)
  end
end