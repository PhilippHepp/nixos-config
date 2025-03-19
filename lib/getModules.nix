{lib, ...}:

let
    filesIn = dir: builtins.attrNames (builtins.readDir dir);
    namesIn = dir: map(file: lib.removeSuffix ".nix" file) (filesIn dir);
    pathsIn = dir: map(file: dir + "/${file}") (filesIn dir);
    zipPairs = dir: map(attr: {name = attr.fst; value = attr.snd;}) (lib.zipLists (namesIn dir) (pathsIn dir));
in dir: builtins.listToAttrs (zipPairs dir)
