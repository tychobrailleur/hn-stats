class Statistics

  # Calculates the sum of property of element of array.
  def self.sum(array, property)
    array.inject(0) { |s, e| s+= e.send(property) }.to_f
  end

  # Calculates the average of property of element of array.
  def self.average(array, property) 
    sum(array, property) / array.length
  end

  # Calculates the median of property of element of array.
  # See http://en.wikipedia.org/wiki/Median#Medians_for_samples
  def self.median(array, property) 
    sorted = array.sort_by { |e| e.send(property) }
    length = sorted.length
    if length % 2 == 1
      sorted[(length+1)/2 - 1].send(property)
    else 
      n = length / 2
      # Mean of n and n+1 elements.
      (sorted[n-1].send(property) + sorted[n].send(property)).to_f / 2.0
    end
  end

  # Calculates the mode of property of element of array.
  def self.mode(array, property)
    array.max_by { |e| array.count(e.send(property)) }.send(property)
  end
end
