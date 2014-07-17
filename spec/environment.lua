xml = require 'xml'

dofile('spec/mockstar/apollo.lua')
dofile('spec/mockstar/gamelib.lua')

toc_file = io.open('toc.xml', 'r')
toc = xml.load(toc_file:read('*a'))
toc_file:close()

for _, directive in ipairs(toc) do
  if directive.xml == "Script" and directive.Name ~= "src/main.lua" then
    dofile(directive.Name)
  end
end

-- Helpers

pretty = require 'pl.pretty'
