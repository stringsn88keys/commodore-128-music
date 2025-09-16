class Config
  def self.rows
    @rows ||= 24
  end

  def self.columns
    @columns ||= 40
  end

  def self.start_sleep
    1
  end

  def self.end_sleep
    5
  end

  def self.line_step
    10
  end

  def self.initial_line
    10
  end
end
