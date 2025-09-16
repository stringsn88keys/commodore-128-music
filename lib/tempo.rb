require "standalone_command"

class Tempo < StandaloneCommand
  TEMPOS={
    andante: 7,
    andantino: 8,
    allegretto: 10,
    allegro: 12,
    presto: 20
  }

  def initialize(command)
    @tempo_name = command.strip.to_sym
  end

  def self.commands
    %w(andante andantino allegretto allegro presto)
  end

  def render
    "tempo #{TEMPOS[@tempo_name]}"
  end
end
