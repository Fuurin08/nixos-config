# Nushell Config File
#
# version = 0.81.1

# let's define some colors

# https://github.com/catppuccin/i3/blob/main/themes/catppuccin-mocha
let rosewater = "#f5e0dc"
let flamingo  = "#f2cdcd"
let pink      = "#f5c2e7"
let mauve     = "#cba6f7"
let red       = "#f38ba8"
let maroon    = "#eba0ac"
let peach     = "#fab387"
let green     = "#a6e3a1"
let teal      = "#94e2d5"
let sky       = "#89dceb"
let sapphire  = "#74c7ec"
let blue      = "#89b4fa"
let lavender  = "#b4befe"
let text      = "#cdd6f4"
let subtext1  = "#bac2de"
let subtext0  = "#a6adc8"
let overlay2  = "#9399b2"
let overlay1  = "#7f849c"
let overlay0  = "#6c7086"
let surface2  = "#585b70"
let surface1  = "#45475a"
let surface0  = "#313244"
let base      = "#1e1e2e"
let mantle    = "#181825"
let crust     = "#11111b"

# we're creating a theme here that uses the colors we defined above.

let catppuccin_theme = {
    separator: $overlay2
    leading_trailing_space_bg: $surface2
    header: $red
    date: $pink
    filesize: $green
    row_index: $text
    bool: $peach
    int: $red
    duration: $sky
    range: $sapphire
    float: $lavender
    string: $text
    nothing: $overlay1
    binary: $subtext1
    cellpath: $subtext0
    hints: dark_gray

    shape_garbage: { fg: $overlay2 bg: $red attr: b}
    shape_bool: $maroon
    shape_int: { fg: $pink attr: b}
    shape_float: { fg: $pink attr: b}
    shape_range: { fg: $overlay0 attr: b}
    shape_internalcall: { fg: $maroon attr: b}
    shape_external: $mauve
    shape_externalarg: { fg: $red attr: b}
    shape_literal: $flamingo
    shape_operator: $rosewater
    shape_signature: { fg: $red attr: b}
    shape_string: $red
    shape_filepath: $peach
    shape_globpattern: { fg: $teal attr: b}
    shape_variable: $pink
    shape_flag: { fg: $mauve attr: b}
    shape_custom: {attr: b}
}

# The default config record. This is where much of your global configuration is setup.
$env.config = {
  color_config: $catppuccin_theme  # 使用定义的主题
  use_ansi_coloring: true  # 启用 ANSI 颜色

  show_banner: true  # 启动时不显示欢迎横幅
  
  table: {
    mode: rounded  # 表格显示模式为圆角
    index_mode: always  # 总是显示索引
    show_empty: true  # 显示空列表和空记录占位符
    trim: {
      methodology: wrapping  # 自动换行
      wrapping_try_keep_words: true  # 换行时尽量保持单词完整
      truncating_suffix: "..."  # 截断后缀
    }
  }

  completions: {
    case_sensitive: false  # 不区分大小写
    quick: true  # 自动选择唯一的补全
    partial: true  # 部分填充提示
    algorithm: "prefix"  # 使用前缀匹配
    external: {
      enable: true  # 启用外部补全
      max_results: 100  # 最大补全结果数量
      completer: null  # 没有自定义补全器
    }
  }
  filesize: {
    metric: true  # 使用公制单位
    format: "auto"  # 自动选择格式
  }
  cursor_shape: {
    emacs: line  # 在 emacs 模式下使用行光标
    vi_insert: block  # 在 vi 插入模式下使用块光标
    vi_normal: underscore  # 在 vi 普通模式下使用下划线光标
  }
  use_grid_icons: true  # 使用网格图标
  footer_mode: "25"  # 在行数为 25 时显示页脚
  float_precision: 2  # 浮点数显示精度为 2 位
  bracketed_paste: true  # 启用括号粘贴
  edit_mode: emacs  # 使用 emacs 编辑模式
  # shell_integration: true  # 启用终端标记和箭头键修复
  render_right_prompt_on_last_line: false  # 不在最后一行显示右提示
}