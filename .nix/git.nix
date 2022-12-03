# Shell configuration for git/ssh

{ config, lib, pkgs, ... }:

{
  programs.gpg = {
    enable = true;
  };

  programs.ssh = {
    enable = true;
    extraConfig = ''
      AddKeysToAgent yes
      IgnoreUnknown UseKeychain
      UseKeychain yes
      IdentityFile fixme
    '';
  };

  programs.git = {
    enable = true;
    userName = "Darin Douglass";
    userEmail = "douglassdarin@gmail.com";
    signing = {
      key = "fixme";
      signByDefault = true;
    };
  };
}
