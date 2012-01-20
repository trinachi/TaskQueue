class TimeInterval
  def self.all
    [5, 15, 30, 60]
  end
  
  def self.form_parameters
    all.inject([]) do |parameters, interval|
      parameters << ["#{interval} min", interval]
    end
  end
end

# Things that are specific to this one Task should just be attributes
  # Names
  # Descriptions

# Things that are re-usable across all tasks in the entire project should have abstractions
  # Categories
  # Time Intervals
  