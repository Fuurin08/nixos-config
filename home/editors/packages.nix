{
  config,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    nixd
    rust-analyzer

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
