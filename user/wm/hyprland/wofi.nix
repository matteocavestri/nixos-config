{ pkgs, ... }:

{
  programs.wofi = {
    enable = true;
    package = pkgs.wofi;
    settings = {};
    style = ''
      window {
      margin: 0px;
      border: 1px solid #bd93f9;
      border-radius: 8px;
      background-color: #282a36;
      }

      #input {
      margin: 5px;
      border: none;
      color: #f8f8f2;
      background-color: #44475a;
      }

      #inner-box {
      margin: 5px;
      border: none;
      background-color: #282a36;
      }

      #outer-box {
      margin: 5px;
      border: none;
      background-color: #282a36;
      }

      #scroll {
      margin: 0px;
      border: none;
      }

      #text {
      margin: 5px;
      border: none;
      color: #f8f8f2;
      } 

      #entry:selected {
      background-color: #44475a;
      }
    '';
  };
}
