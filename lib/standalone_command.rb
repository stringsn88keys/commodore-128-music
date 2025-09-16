class StandaloneCommand
  def self.command_regex
    /(#{commands.map { |command| "^#{command}\s*$" }.join("|")})/
  end
end
