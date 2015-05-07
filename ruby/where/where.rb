class Array
  def where(requirements)
    self.select do |element|
      requirements.all? do |k, v|
        if v.is_a? Regexp
          element[k] =~ v
        else
          element[k] == v
        end
      end
    end
  end
end