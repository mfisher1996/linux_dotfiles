{
    description = "Modular Home Manager Configuration Flake";
    inputs = {
        # this might need to be set to something more stable later if I run into issues.
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        zen-browser.url = "github:youwen5/zen-browser-flake";
    };

  outputs = { nixpkgs, home-manager, zen-browser, ... }@inputs:
        let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};

        mkHomeConfig = username: home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs; };
        modules = [
            ./home.nix
            {
                home.username = username;
                home.homeDirectory = "/home/${username}";
            }
        ];
    };
    in {
        homeConfigurations = {
            "masonf" = mkHomeConfig "masonf";
            "mason" = mkHomeConfig "mason";
        };
    };
}
