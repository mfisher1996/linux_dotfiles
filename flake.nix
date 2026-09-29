{
    description = "Modular Home Manager Configuration Flake";
    inputs = {
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
        pkgs = import nixpkgs {
            localSystem = system;
            config.allowUnfree = true;
        };

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
