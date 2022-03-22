{
  description = ''Library for working with Xiaomi devices'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-xiaomi-v0_1_1.flake = false;
  inputs.src-xiaomi-v0_1_1.owner = "ThomasTJdev";
  inputs.src-xiaomi-v0_1_1.ref   = "v0_1_1";
  inputs.src-xiaomi-v0_1_1.repo  = "nim_xiaomi.git";
  inputs.src-xiaomi-v0_1_1.type  = "github";
  
  inputs."multicast".owner = "nim-nix-pkgs";
  inputs."multicast".ref   = "master";
  inputs."multicast".repo  = "multicast";
  inputs."multicast".dir   = "";
  inputs."multicast".type  = "github";
  inputs."multicast".inputs.nixpkgs.follows = "nixpkgs";
  inputs."multicast".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."nimcrypto".owner = "nim-nix-pkgs";
  inputs."nimcrypto".ref   = "master";
  inputs."nimcrypto".repo  = "nimcrypto";
  inputs."nimcrypto".dir   = "";
  inputs."nimcrypto".type  = "github";
  inputs."nimcrypto".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimcrypto".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-xiaomi-v0_1_1"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-xiaomi-v0_1_1";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}