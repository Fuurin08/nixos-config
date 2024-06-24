{
  config,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    nixd

    # (python312.withPackages (ps: with ps; [
    #   epc
    #   orjson
    #   sexpdata
    #   six
    #   setuptools
    #   paramiko
    #   rapidfuzz
    # ]))
  ];
}
