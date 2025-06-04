{
  config,
  pkgs,
  ...
}:

{
  programs.kitty = {
    enable = true;

    settings = {
      #  background_opacity = "0.8";

      enabel_audio_bell = false;

      cursor_trail = 1;

      tab_bar_edge = "bottom"; # #設置標籤攔樣式
      tab_bar_style = "powerline";
      tab_fade = "0.75";

      cursor_shape = "block";

      confirm_os_window_close = "0"; # #關閉窗口時不確認

      # initial_window_width  = "640";
      # initial_window_height = "400";

      shell = "${pkgs.bash}/bin/bash --login -c 'nu --login --interactive'";
    };
  };
}
