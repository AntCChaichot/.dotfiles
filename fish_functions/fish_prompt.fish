# You can override some default options with config.fish:
#
#  set -g theme_short_path yes

function fish_prompt
  set -l last_command_status $status
  set -l cwd

  if test "$theme_short_path" = 'yes'
    set cwd (basename (prompt_pwd))
  else
    set cwd (prompt_pwd)
  end

  # main icon, select one
  set -l fish     "⋊>"
  set -l arrow     "➹ "
  set -l moon1      "⏾ "
  set -l moon2       "🌙"
  set -l seal       "🦭"
  set -l hedgehog   "🦔"
  set -l ai         "愛"
  set -l yume       "夢"
  set -l tanabata   "🎋"
  set -l lantern    "🏮"
  set -l fox        "🦊"
  set -l butterfly  "🦋"
  set -l arrow1     "⤷"
  set -l arrow2     "↪"
  set -l arrow3     "╚⟫"
  #set -l arrow4     "╰ ⧿⌲ " #alternative
  set -l arrow4     "╰‑⌲ "
  set -l ahead    "↑"
  set -l behind   "↓"
  set -l diverged "⥄ "
  set -l dirty    "⨯"
  set -l none     "◦"

  set -l normal_color     (set_color normal)
  set -l good_color      (set_color  86C166)
  set -l failed_color       (set_color  F75C2F)
  set -l color_name         (set_color 006284)
  set -l work_dir           (prompt_pwd)
  #set -l success_color    (set_color $fish_pager_color_progress 2> /dev/null; or set_color cyan)
  set -l success_color    (set_color cyan)
  set -l error_color      (set_color $fish_color_error 2> /dev/null; or set_color red --bold)
  set -l directory_color  (set_color $fish_color_quote 2> /dev/null; or set_color brown)
  set -l repository_color (set_color $fish_color_cwd 2> /dev/null; or set_color green)

  # change prompt icons and others here
  if git_is_repo
    if test "$theme_short_path" = 'yes'
      set root_folder (command git rev-parse --show-toplevel 2> /dev/null)
      set parent_root_folder (dirname $root_folder)
      set cwd (echo $PWD | sed -e "s|$parent_root_folder/||")
    end

    if test $last_command_status -eq 0
      # separate lines to minimize spaces
      echo -n -s "$tanabata $normal_color" 
      echo -n -s "with $color_name$USER $normal_color"
      echo -n -s "at $directory_color$cwd $normal_color"
      echo -n -s "on " $repository_color (git_branch_name) $normal_color " "
      if git_is_touched
        echo -n -s -e $dirty "\n$good_color$arrow4"
      else
        echo -n -s -e (git_ahead $ahead $behind $diverged $none) "\n$good_color$arrow4"
      end

    else
      echo -n -s "$lantern $normal_color" 
      echo -n -s "with $color_name$USER $normal_color"
      echo -n -s "at $directory_color$cwd $normal_color"
      echo -n -s "on " $repository_color (git_branch_name) $normal_color " "
      if git_is_touched
        echo -n -s -e $dirty "\n$failed_color$arrow4"
      else
        echo -n -s -e (git_ahead $ahead $behind $diverged $none) "\n$failed_color$arrow4"
      end
    end

  else
    if test $last_command_status -eq 0
      # separate lines to minimize spaces
      echo -n -s "$tanabata $normal_color" 
      echo -n -s "with $color_name$USER $normal_color"
      echo -n -s -e "at $directory_color$cwd $normal_color\n$good_color$arrow4"
    else
      echo -n -s "$lantern $normal_color" 
      echo -n -s "with $color_name$USER $normal_color"
      echo -n -s -e "at $directory_color$cwd $normal_color\n$failed_color$arrow4"
    end
  end

  echo -n -s " "

end
