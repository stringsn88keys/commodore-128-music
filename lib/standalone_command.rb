class StandaloneCommand
  def initialize(command)
    @command = command.strip.to_sym
  end

  def self.command_regex
    /(#{commands.map { |command| "^#{command}\s*$" }.join("|")})/
  end
end
