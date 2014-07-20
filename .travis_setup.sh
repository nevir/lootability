# Sets up Lua and Luarocks for travis-ci testing.
# LUA_VERSION must be "Lua 5.1"; you can see WildStar's
# executed version via `/eval Print(_VERSION)` in-game.

echo 'rocks_servers = {
  "http://rocks.moonscript.org/",
  "http://luarocks.org/repositories/rocks"
}' >> ~/config.lua


if [ "$LUA" == "Lua 5.1" ]; then
  curl http://www.lua.org/ftp/lua-5.1.5.tar.gz | tar xz
  cd lua-5.1.5;
  sudo make linux install;
  cd ..
fi

curl http://luarocks.org/releases/luarocks-2.1.2.tar.gz | tar xz
cd luarocks-2.1.2
./configure;

make && sudo make install
cd ..

git clone https://github.com/Olivine-Labs/busted.git --quiet
