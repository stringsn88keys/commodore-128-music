require "standalone_command"

class Tempo < StandaloneCommand
  TEMPOS={
    andante: 7,
    andantino: 8,
    allegretto: 10,
    allegro: 12,
    presto: 20
  }

  def self.commands
    TEMPOS.keys.map(&:to_s)
  end

  def render
    "tempo #{TEMPOS[@command]}"
  end
end
