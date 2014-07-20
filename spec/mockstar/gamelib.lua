GameLib = {}

-- Is this server time zone, UTC, or...?
function GameLib.GetGameTime()
  return os.time()
end
