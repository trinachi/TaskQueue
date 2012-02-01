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
  