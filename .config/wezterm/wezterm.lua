
local wezterm = require 'wezterm';

local config = {}

config.automatically_reload_config = true

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- keybinds
-- デフォルトのkeybindを無効化
config.disable_default_key_bindings = true

-- `keybinds.lua`を読み込み
local keybind = require 'keybinds'

-- keybindの設定
config.keys = keybind.keys
config.key_tables = keybind.key_tables

-- Leaderキーの設定
config.leader = { key = ",", mods = "CTRL" }


-- フォントサイズ変更
config.font_size = 12.0

config.window_frame = {
  font = wezterm.font { family ='Roboto', weight = 'Bold' },
  font_size = 11.0,
}

-- IMEで日本語を入力をできるようにする
config.use_ime = true

-- 背景の透過
config.window_background_opacity = 0.85

-- 背景のぼかし
config.macos_window_background_blur = 20

-- タイトルバーの削除
config.window_decorations = "RESIZE"

-- タブバーの+を消す
config.show_new_tab_button_in_tab_bar = false

-- タブ同士の境界線を非表示
config.colors = {
  tab_bar = {
    inactive_tab_edge = "none",
  },
}

function split(str, ts)
  -- 引数がないときは空tableを返す
  if ts == nil then return {} end

  local t = {} ;
  i=1
  for s in string.gmatch(str, "([^"..ts.."]+)") do
    t[i] = s
    i = i + 1
  end

  return t
end

-- 各タブの「ディレクトリ名」を記憶しておくテーブル
local title_cache = {}

wezterm.on('update-status', function(window, pane)
  local pane_id = pane:pane_id()
  title_cache[pane_id] = "-"
  local process_info = pane:get_foreground_process_info()
  if process_info then
    local cwd = process_info.cwd
    -- 文字列を削除している
    -- 環境に応じて変えること
    local rm_home = string.gsub(cwd, os.getenv 'HOME', '')
    local prj = string.gsub(rm_home, '/Development/Projects', '')
    local dirs = split(prj, '/')
    local root_dir = dirs[1]
    title_cache[pane_id] = root_dir
  end
end)

-- タブの形をカスタマイズ
-- タブの左側の装飾
local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
-- タブの右側の装飾
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#666666"
  local foreground = "#e6e6e6"
  local edge_background = "none"
  if tab.is_active then
    background = "#000000"
    foreground = "#e6e6e6"
  end
  local edge_foreground = background
  local pane = tab.active_pane
  local pane_id = pane.pane_id

  local cwd = "none"
  if title_cache[pane_id] then
    cwd = title_cache[pane_id]
  else
    cwd = "-"
  end

  local title = " " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   [ " .. cwd .. " ]   "
  return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_LEFT_ARROW },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_RIGHT_ARROW },
  }
end)

return config
