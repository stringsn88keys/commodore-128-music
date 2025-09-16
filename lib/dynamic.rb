require "standalone_command"

class Dynamic < StandaloneCommand
  DYNAMICS={
    pppp: 2,
    pp: 4,
    p: 6,
    mp: 7,
    mf: 8,
    f: 9,
    ff: 11,
    fff: 13,
    ffff: 15
  }

  def self.commands
    DYNAMICS.keys.map(&:to_s)
  end

  def render
    "u#{DYNAMICS[@command]}"
  end
end
