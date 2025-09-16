class Command
  def dispatch(line)
    message, *value = line.split(/:/)
    send "#{message}=", value.join(":").strip
  end

  def self.command_regex
    /(#{commands.map { |command| "^#{command}:" }.join("|")})/
  end
end
