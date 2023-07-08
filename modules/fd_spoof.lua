--// metamethod FD spoof (not mine, credits to who made it lol)
local Workspace = game.Workspace
local old
old = hookmetamethod(game, "__index", newcclosure(function(Self, ...)
   local args = ...
   if Self == Workspace and args == "FilteringEnabled" then
       return false
   end
   return old(Self, ...)
end))