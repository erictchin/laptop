require "yaml"
require "open3"
require "etc"
require "shellwords"

######################################################################################################
# Default

desc "Install all features."
task default: [
  :laptop,
  :packages,
  :compose,
  :bash,
]

######################################################################################################
# Laptop

LAPTOP_PATH = "/usr/local/bin/laptop"

desc "Install ‘laptop’ executable."
task :laptop do
  install_file LAPTOP_PATH, <<-LAPTOP do
#!/usr/bin/env bash
(cd '#{File.expand_path("..", __FILE__)}' && rake $@)
LAPTOP
    chmod "a+x", LAPTOP_PATH
  end
end

######################################################################################################
# Packages

PACKAGES_HOMEBREW_TAPS = [
  "caskroom/cask",
  "caskroom/fonts",
  "caskroom/drivers",
]

PACKAGES_HOMEBREW_CASK = [

  # Filesystem.

  "osxfuse",
  "android-file-transfer",

  # Networking.

  "transmission",
  "wireshark",
  "postman",

  # Internet browsing.

  "firefox",
  "flash-npapi",
  "google-chrome",
  "torbrowser",

  # Instant messaging.

  "skype",
  "google-hangouts",
  "mattermost",
  "slack",

  # Desktop utils.

  "shiftit",
  "the-unarchiver",
  "grandperspective",
  "licecap",
  "keycastr",
  "cool-retro-term",
  "free-ruler",
  "unicodechecker",
  "zotero",
  "day-o",
  "color-oracle",
  "cyberduck",

  # Drivers.

  "darwiinremoteosc",

  # Text editing.

  "atom",

  # Ebook management.

  "calibre",

  # Audio and video.

  "vlc",

  # Graphs and diagrams.

  "yed",

  # Backup.

  "backblaze",

  # Vector graphics.

  "xquartz",
  "inkscape",

  # Virtualization.

  "virtualbox",
  "docker",

  # Writing.

  "mactex",
  "skim",
  "detexify",
  "microsoft-office",

  # Programming languages.

  ## Racket.

  "racket",

  # Fonts.

  "font-fontawesome",
  "font-meslo-lg",
  "font-dejavu-sans",
  "font-hack",
  "font-charter",
  "font-fantasque-sans-mono",
  "font-input",
  "font-linux-libertine",
  "font-charis-sil",
  "font-norwester",
  "font-mononoki",
  "font-hermit",
  "font-bungee",
  "font-eb-garamond",
  "font-et-book",
  "font-open-sans",
  "font-open-sans-condensed",
  "font-roboto",
  "font-roboto-condensed",
  "font-roboto-mono",
  "font-roboto-slab",
  "font-lato",
  "font-oswald",
  "font-source-code-pro",
  "font-source-sans-pro",
  "font-source-serif-pro",
  "font-montserrat",
  "font-raleway",
  "font-pt-mono",
  "font-pt-sans",
  "font-pt-serif",
  "font-lora",
  "font-droid-sans",
  "font-droid-sans-mono",
  "font-droid-serif",
  "font-ubuntu",
  "font-merriweather",
  "font-merriweather-sans",
  "font-noto-sans",
  "font-noto-emoji",
  "font-noto-serif",
  "font-inconsolata",
  "font-alegreya",
  "font-alegreya-sc",
  "font-alegreya-sans",
  "font-alegreya-sans-sc",
  "font-exo",
  "font-exo2",
  "font-fira-code",
  "font-fira-mono",
  "font-fira-sans",
  "font-crimson-text",
  "font-vollkorn",
  "font-andada",
  "font-andada-sc",
  "font-abril-fatface",
  "font-cardo",
  "font-gentium-basic",
  "font-gentium-book-basic",
  "font-gentium-plus",
  "font-libre-baskerville",
  "font-playfair-display",
  "font-playfair-display-sc",
  "font-gravitas-one",
  "font-old-standard-tt",
  "font-hasklig",
  "font-monoid",
  "font-monoisome",
  "font-iosevka",
  "font-julius-sans-one",
  "font-oxygen",
  "font-oxygen-mono",
  "font-bebas-neue",
  "font-cabin",
  "font-cabin-condensed",
  "font-cabin-sketch",
  "font-bitstream-vera",
  "font-bree-serif",
  "font-junicode",
  "font-overpass",
  "font-rajdhani",
  "font-tangerine",
  "font-anonymous-pro",
  "font-everson-mono",
  "font-gnu-unifont",
  "font-andika",
  "font-cooper-hewitt",
  "font-nunito",
  "font-space-mono",
  "font-metropolis",
  "font-euphoria-script",
  "font-interface",
]

PACKAGES_HOMEBREW_HOMEBREW = [

  # Filesystem.

  "bindfs",
  "sshfs",
  "ntfs-3g",
  "ext2fuse",
  "ext4fuse",
  "e2fsprogs",

  # Networking.

  "nmap",
  "wget",
  "httpie",

  # Command-line utils.

  "coreutils",
  "bash",
  "git",
  "cloc",
  "tree",
  "pstree",
  "figlet",
  "the_silver_searcher",
  "ffmpeg",
  "youtube-dl",
  "timelimit",
  "watch",
  "rlwrap",

  # Graphs and diagrams.

  "graphviz",
  "ditaa",
  "plantuml",
  "imagemagick",

  # Writing.

  "pandoc",
  "aspell --with-lang-en --with-lang-pt_BR",

  # Password generation.

  "pwgen",

  # Programming languages.

  ## Go.

  "go",
  "glide",

  ## Python.

  "python",

  ## OCaml.

  "ocaml",
  "opam",
]

PACKAGES_RACKET = [
  "drracket-solarized",
]

PACKAGES_PYTHON = [
  "font-line",
  "pygments",
]

PACKAGES_OCAML = [
  "merlin",
  "ocp-indent",
  "utop",
]

desc "Install packages."
task packages: [
  "packages:homebrew",
  "packages:racket",
  "packages:python",
  "packages:ocaml",
]

namespace :packages do

  def package_manager name, packages, list, install
    desc "Install #{name} packages."
    task name.downcase do
      installed_packages_string, status = Open3.capture2 list
      unless status == 0
        abort "Failed to list installed packages for #{name} with ‘#{list}’."
      end
      installed_packages = installed_packages_string.strip.split(/\n+/)
        .map { |installed_package_string| package_name installed_package_string}
      packages.each do |package|
        if ! installed_packages.include? package_name(package)
            sh "#{install} #{package}"
        end
      end
    end
  end

  def package_name package_specification
    package_specification.strip.split(/\s+/).first.downcase
  end

  desc "Install Homebrew packages and Casks."
  task homebrew: ["homebrew:install", "homebrew:taps", "homebrew:cask", "homebrew:homebrew"]

  namespace :homebrew do

    desc "Install Homebrew."
    task install: ["install:command-line-tools", "/usr/local/bin/brew"]

    namespace :install do

      desc "Install Command-Line Tools."
      task "command-line-tools" => "/Library/Developer/CommandLineTools/usr/bin/make"

      file "/Library/Developer/CommandLineTools/usr/bin/make" do
        sh "xcode-select --install"
      end

      file "/usr/local/bin/brew" do
        sh %Q{/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"}
        sh "sudo chown -R '#{Etc.getlogin}:#{Etc.getgrgid(Etc.getpwuid.gid).name}' '/usr/local'"
      end
    end

    package_manager "Taps", PACKAGES_HOMEBREW_TAPS, "env HOMEBREW_NO_AUTO_UPDATE=true brew tap", "brew tap"

    package_manager "Cask", PACKAGES_HOMEBREW_CASK, "brew cask list", "brew cask install"

    package_manager "Homebrew", PACKAGES_HOMEBREW_HOMEBREW, "brew list", "brew install"
  end

  package_manager "Racket", PACKAGES_RACKET, "raco pkg show --user", "raco pkg install --auto"

  package_manager "Python", PACKAGES_PYTHON, "pip list --format=legacy", "pip install"

  package_manager "OCaml", PACKAGES_OCAML, "opam list --short", "opam install --yes"
end

######################################################################################################
# Compose

# Prefix   Meaning
# ~        ⌥ Option key
# $        ⇧ Shift key
# ^        ^ Control key
# @        ⌘ Command key
# #        keys on number pad

# Key                        Code
# ⎋ Esc                      \\U001B
# ⌫ Backspace/delete         \\U007F
# ⇥ Tab                      \\U0009
# ↩ Enter/Return           \\U000D
# ⌤ Enter (on number-pad)    \\U0003
# ↑ up arrow                 \\UF700
# ↓ down arrow               \\UF701
# ← left arrow               \\UF702
# → right arrow              \\UF703
# ↖ Home                   \\UF729
# ↘ End                    \\UF72B
# ⇞ Page Up                  \\UF72C
# ⇟ Page Down                \\UF72D
# Insert                     \\UF727
# ⌦ Delete (forward delete)  \\UF728
# ⌧ NumLock/clear           \\UF739
# F1                         \\UF704
# F2                         \\UF705
# F3                         \\UF706
# F4                         \\UF707
# F5                         \\UF708
# F6                         \\UF709
# F7                         \\UF70A
# F8                         \\UF70B
# F9                         \\UF70C
# F10                        \\UF70D
# F11                        \\UF70E
# F12                        \\UF71F
# F13                        \\UF710
# F14                        \\UF711
# F15                        \\UF712
# ⎙ PrintScreen              \\UF72E
# ScrollLock                 \\UF72F
# Pause                      \\UF730
# SysReq                     \\UF731
# Break                      \\UF732
# Reset                      \\UF733
# Stop                       \\UF734
# Menu                       \\UF735
# ↶ Undo                     \\UF743
# ↷ Redo                     \\UF744
# Find                       \\UF745
# Help                       \\UF746

# http://xahlee.info/kbd/osx_keybinding_key_syntax.html

COMPOSE_MAPPINGS = {
  "~a" => {
    "$\\UF701" => "⇓",
    "Downarrow" => "⇓",
    "nwarrow" => "↖",
    "\\UF701" => "↓",
    "downarrow" => "↓",
    "$\\UF703" => "⇒",
    "Rightarrow" => "⇒",
    "\\UF703" => "→",
    "rightarrow" => "→",
    "~\\UF703" => "↦",
    "|->" => "↦",
    "mapsto" => "↦",
    "<-|" => "↤",
    "reversemapsto" => "↤",
    "searrow" => "↘",
    "swarrow" => "↙",
    "\\UF702" => "←",
    "leftarrow" => "←",
    "\\UF700" => "↑",
    "uparrow" => "↑",
    "$\\UF702" => "⇐",
    "Leftarrow" => "⇐",
    "$\\UF700" => "⇑",
    "Uparrow" => "⇑",
    "~\\UF702" => "⇔",
    "Leftrightarrow" => "⇔",
    "updownarrow" => "↕",
    "leftrightarrow" => "↔",
    "nearrow" => "↗",
    "~\\UF700" => "⇕",
    "Updownarrow" => "⇕",
    "$~\\UF702" => "⇇",
    "doubleleftarrow" => "⇇",
    "$~\\UF703" => "⇉",
    "doublerightarrow" => "⇉",
    "aleph" => "א",
    "'" => "′",
    "prime" => "′",
    "emptyset" => "∅",
    "nabla" => "∇",
    "suit" => {
      "spade" => "♠",
      "club" => "♣",
      "heart" => "♥",
      "diamond" => "♦",
    },
    "sharp" => "♯",
    "flat" => "♭",
    "natural" => "♮",
    "surd" => "√",
    "neg" => "¬",
    "triangleup" => "△",
    "forall" => "∀",
    "exists" => "∃",
    "circ" => "∘",
    "alpha" => "α",
    "theta" => "θ",
    "tau" => "τ",
    "beta" => "β",
    "vartheta" => "ϑ",
    "pi" => "π",
    "upsilon" => "υ",
    "gamma" => "γ",
    "varpi" => "ϖ",
    "phi" => "φ",
    "delta" => "δ",
    "kappa" => "κ",
    "rho" => "ρ",
    "varphi" => "ϕ",
    "epsilon" => "ϵ",
    "lambda" => "λ",
    "varrho" => "ϱ",
    "chi" => "χ",
    "varepsilon" => "ε",
    "mu" => "μ",
    "sigma" => "σ",
    "psi" => "ψ",
    "zeta" => "ζ",
    "nu" => "ν",
    "varsigma" => "ς",
    "omega" => "ω",
    "eta" => "η",
    "xi" => "ξ",
    "iota" => "ι",
    "Gamma" => "Γ",
    "Lambda" => "Λ",
    "Sigma" => "Σ",
    "Psi" => "Ψ",
    "Delta" => "Δ",
    "Xi" => "Ξ",
    "Upsilon" => "Υ",
    "Omega" => "Ω",
    "Theta" => "Θ",
    "Pi" => "Π",
    "Phi" => "Φ",
    "pm" => "±",
    "cap" => "∩",
    "diamond" => "◇",
    "oplus" => "⊕",
    "mp" => "∓",
    "cup" => "∪",
    "bigtriangleup" => "△",
    "ominus" => "⊖",
    "times" => "×",
    "uplus" => "⊎",
    "bigtriangledown" => "▽",
    "otimes" => "⊗",
    "div" => "÷",
    "sqcap" => "⊓",
    "triangleright" => "▹",
    "oslash" => "⊘",
    "ast" => "∗",
    "sqcup" => "⊔",
    "vee" => "∨",
    "lor" => "∨",
    "wedge" => "∧",
    "land" => "∧",
    "triangleleft" => "◃",
    "odot" => "⊙",
    "star" => "★",
    "dagger" => "†",
    "bullet" => "•",
    "whitebullet" => "◦",
    "ddagger" => "‡",
    "wr" => "≀",
    "amalg" => "⨿",
    "leq" => "≤",
    "geq" => "≥",
    "equiv" => "≡",
    "|=" => "⊨",
    "models" => "⊨",
    "prec" => "≺",
    "succ" => "≻",
    "dotprec" => "⋖",
    "dotsucc" => "⋗",
    "sim" => "∼",
    "perp" => "⊥",
    "bot" => "⊥",
    "top" => "⊤",
    "eqprec" => "≼",
    "eqsucc" => "≽",
    "eqsim" => "≃",
    "ll" => "≪",
    "gg" => "≫",
    "asymp" => "≍",
    "||" => "∥",
    "parallel" => "∥",
    "subset" => "⊂",
    "supset" => "⊃",
    "approx" => "≈",
    "bowtie" => "⋈",
    "halfbowtie" => {
      "left" => "⋉",
      "right" => "⋊",
    },
    "eqsubset" => "⊆",
    "eqsupset" => "⊇",
    "congruent" => "≅",
    "reversecongruent" => "≌",
    "sqsubsetb" => "⊏",
    "sqsupsetb" => "⊐",
    "neq" => "≠",
    "smile" => "⌣",
    "eqsqsubset" => "⊑",
    "eqsqsupset" => "⊒",
    "doteq" => "≐",
    "frown" => "⌢",
    "in" => "∈",
    "ni" => "∋",
    "notin" => "∉",
    "propto" => "∝",
    "vdash" => "⊢",
    "dashv" => "⊣",
    "." => "·",
    "sum" => "∑",
    "prod" => "∏",
    "coprod" => "∐",
    "Int" => "∫",
    "oint" => "∮",
    "sqrt" => "√",
    "skull" => "☠",
    ":)" => "😀",
    ":D" => "😁",
    "+1" => "👍",
    "-1" => "👎",
    ":P" => "😛",
    "l/" => "ł",
    "vdots" => "⋮",
    "ddots" => "⋱",
    "cdots" => "⋯",
    "hdots" => "⋯",
    "langle" => "⟨",
    "rangle" => "⟩",
    "heart" => "❤",
    "note" => {
      "quarter" => "♩",
      "eigth" => "♪",
      "beamedeigth" => "♫",
      "beamedsixteenth" => "♬",
    },
    "check" => "✓",
    "(|" => "◖",
    "|)" => "◗",
    "semicircle" => {
      "left" => "◖",
      "right" => "◗",
    },
    "$`" => "≁",
    "nottilde" => "≁",
    "ell" => "ℓ",
    "B" => {
      "n" => "ℕ",
      "p" => "ℙ",
      "r" => "ℝ",
      "z" => "ℤ",
    },
    "{" => "⌈",
    "leftceiling" => "⌈",
    "}" => "⌉",
    "rightceiling" => "⌉",
    "[" => "⌊",
    "leftfloor" => "⌊",
    "]" => "⌋",
    "rightfloor" => "⌋",
    "option" => "⌥",
    "shift" => "⇧",
    "command" => "⌘",
    "compose" => "⎄",
    "_" => {
      "0" => "₀",
      "1" => "₁",
      "2" => "₂",
      "3" => "₃",
      "4" => "₄",
      "5" => "₅",
      "6" => "₆",
      "7" => "₇",
      "8" => "₈",
      "9" => "₉",
      "+" => "₊",
      "-" => "₋",
      "=" => "₌",
      "(" => "₍",
      ")" => "₎",
      "a" => "ₐ",
      "e" => "ₑ",
      "o" => "ₒ",
      "x" => "ₓ",
      "h" => "ₕ",
      "k" => "ₖ",
      "l" => "ₗ",
      "m" => "ₘ",
      "n" => "ₙ",
      "p" => "ₚ",
      "s" => "ₛ",
      "t" => "ₜ",
    },
    "6" => {
      "0" => "⁰",
      "1" => "¹",
      "2" => "²",
      "3" => "³",
      "4" => "⁴",
      "5" => "⁵",
      "6" => "⁶",
      "7" => "⁷",
      "8" => "⁸",
      "9" => "⁹",
      "+" => "⁺",
      "-" => "⁻",
      "=" => "⁼",
      "(" => "⁽",
      ")" => "⁾",
      "i" => "ⁱ",
      "k" => "ᵏ",
      "n" => "ⁿ",
    },
  },
}
COMPOSE_PATH = "#{Dir.home}/Library/KeyBindings"
COMPOSE_FILE = "#{COMPOSE_PATH}/DefaultKeyBinding.dict"

desc "Install ‘compose’."
task compose: COMPOSE_PATH do
  def compose_render node
    compose_to_s(compose_decompose(node))
  end

  def compose_decompose node
    case node
    when String, {} then node
    when Hash
      pivot, node_child_pivot = node.first
      if pivot.empty?
        compose_decompose node_child_pivot
      else
        pivot_first, _ = compose_combination_split pivot
        included, rest = node.partition { |(combination, _)|
          combination_first, _ = compose_combination_split combination
          combination_first == pivot_first
        }
        included = included.map { |(combination, node_child)|
          _, combination_rest = compose_combination_split combination
          [combination_rest, node_child]
        }
        included = Hash[included]
        rest = Hash[rest]
        {
          pivot_first => compose_decompose(included)
        }.merge(compose_decompose rest)
      end
    end
  end

  def compose_to_s node
    case node
    when String then %Q{("insertText:","#{node}")}
    when Hash
      "{" +
      node.map { |(combination, node_child)| %Q{"#{combination}"=#{compose_to_s node_child};} }.join +
      "}"
    end
  end

  def compose_combination_split combination
    combination_first, combination_rest =
      if %w{~ $ ^ @ #}.include? combination[0]
        combination_first, combination_rest = combination[1..-1]
        [combination[0] + combination_first, combination_rest]
      elsif combination[0..1] == '\\U'
        [combination[0..5], combination[6..-1]]
      else
        [combination[0], combination[1..-1]]
      end
    [combination_first, combination_rest || ""]
  end

  def compose_combination_all_combinations node
    case node
    when String then [""]
    when Hash
      node.map { |(combination, node_child)|
        compose_combination_all_combinations(node_child)
          .map { |node_child_combination| combination + node_child_combination }
      }.reduce(:+)
    end
  end

  def compose_combination_ambiguous_prefixes combinations
    combinations.product(combinations).select { |(combination_1, combination_2)|
      combination_1 != combination_2 && combination_2.start_with?(combination_1)
    }
  end

  ambiguous_prefixes = compose_combination_ambiguous_prefixes(compose_combination_all_combinations(COMPOSE_MAPPINGS))
  if ambiguous_prefixes.any?
    abort "Compose: The following combinations are ambiguous prefixes: #{ambiguous_prefixes}"
  end

  install_file COMPOSE_FILE, compose_render(COMPOSE_MAPPINGS) do
    puts "Reopen applications for the new compose combinations to take effect."
  end
end

directory COMPOSE_PATH

######################################################################################################
# Bash

BASH_PATH = "/usr/local/bin/bash"
BASH_SHELLS = "/etc/shells"

desc "Install Bash configuration."
task bash: "/usr/local/bin/bash" do
  _, status = Open3.capture2e "grep '#{BASH_PATH}' '#{BASH_SHELLS}'"
  unless status == 0
    sh %Q{sudo -u root bash -c "echo '#{BASH_PATH}' >> '#{BASH_SHELLS}'"}
  end
  unless Etc.getpwuid.shell == BASH_PATH
    sh "chsh -s '#{BASH_PATH}' '#{Etc.getlogin}'"
  end
end

file "/usr/local/bin/bash" => "packages:homebrew"

######################################################################################################
# Hosts

HOSTS_REMOTE = "http://someonewhocares.org/hosts/hosts"
HOSTS_LOCAL = "/etc/hosts"

desc "Update ‘#{HOSTS_LOCAL}’."
task :hosts do
  sh %Q{sudo -u root bash -c "curl -L '#{HOSTS_REMOTE}' > '#{HOSTS_LOCAL}'"}
  puts <<-REQUIRED_ENTRIES
Inspect required entries:

  127.0.0.1 localhost
  255.255.255.255 broadcasthost
  ::1 localhost

Press any key to continue...
REQUIRED_ENTRIES
  STDIN.gets
  sh "less '#{HOSTS_LOCAL}'"
end

######################################################################################################
# GUI ‘$PATH’

GUI_PATH_PATHS = [
  "/usr/local/bin",
  "/usr/bin",
  "/bin",
  "/usr/sbin",
  "/sbin",
  "/opt/X11/bin",
  "/Library/TeX/texbin",
]

desc "Fix ‘$PATH’ environment variable for GUI applications."
task "gui-path" do
  sh "sudo launchctl config user path '#{GUI_PATH_PATHS.join ":"}'"
  puts %Q{Reboot and test in DrRacket with ‘(getenv "PATH")’.}
end

######################################################################################################
# Auxiliary

def install_file path, content
  if ! File.exists?(path) || File.read(path) != content
    puts "Install file ‘#{path}’."
    File.write path, content
    yield if block_given?
  end
end
