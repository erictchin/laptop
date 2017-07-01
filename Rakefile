# coding: utf-8

require "yaml"
require "open3"

#######################
# Packages to install #
#######################

PACKAGES = [

  # Filesystem.

  [:cask, "osxfuse"],
  "bindfs",
  "sshfs",
  "ntfs-3g",
  "ext2fuse",
  "ext4fuse",
  [:cask, "android-file-transfer"],

  # Networking.

  "nmap",
  "wget",
  "httpie",
  [:cask, "transmission"],
  [:cask, "wireshark"],
  [:cask, "postman"],

  # Internet browsing.

  [:cask, "firefox"],
  [:cask, "flash-npapi"],
  [:cask, "google-chrome"],

  # Instant messaging.

  [:cask, "skype"],
  [:cask, "google-hangouts"],
  [:cask, "mattermost"],
  [:cask, "slack"],

  # Command-line utils.

  [:cask, "iterm2"],
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

  # Desktop utils.

  [:cask, "caffeine"],
  [:cask, "shiftit"],
  [:cask, "flux"],
  [:cask, "the-unarchiver"],
  [:cask, "grandperspective"],
  [:cask, "licecap"],
  [:cask, "keycastr"],
  [:cask, "cool-retro-term"],
  [:cask, "free-ruler"],
  [:cask, "unicodechecker"],
  [:cask, "xquartz"],

  # Drivers.

  [:cask, "darwiinremoteosc"],

  # Encryption.

  "gnupg",
  "pinentry-mac",

  # Text editing.

  [:cask, "atom"],
  [:cask, "emacs"],

  # Ebook management.

  [:cask, "calibre"],

  # Audio and video.

  [:cask, "ableton-live-lite"],
  [:cask, "vlc"],
  [:cask, "spotify"],

  # Graphs and diagrams.

  "graphviz",
  [:cask, "yed"],
  "ditaa",
  "plantuml",
  "imagemagick",

  # Image editing.

  [:cask, "skitch"],
  # TODO: [:cask, "inkscape"], # https://inkscape.org/en/%7Etghs/%E2%98%85inkscape-0921-tghs_2-x11-107-x86_64dmg
  [:cask, "color-oracle"],

  # Font editing.

  [:cask, "fontforge"],

  # Virtualization.

  [:cask, "virtualbox"],
  [:cask, "docker"],

  # Writing.

  [:cask, "mactex"],
  "pandoc",
  [:cask, "skim"],
  [:cask, "adobe-reader"],
  ["aspell", "--with-lang-en", "--with-lang-pt_BR"],
  "languagetool",
  [:cask, "detexify"],
  [:cask, "microsoft-office"],

  # Backup.

  "duplicity",

  # Email.

  [:cask, "thunderbird"],

  # Password generation.

  "pwgen",

  # Programming languages.

  ## OCaml.

  "ocaml",
  "opam",

  ## Racket.

  [:cask ,"racket"],

  ## Go.

  "go",
  "glide",

  ## Arduino.

  [:cask, "arduino"],

  # Fonts.

  [:cask, "font-fontawesome"],
  [:cask, "font-meslo-lg"],
  [:cask, "font-dejavu-sans"],
  [:cask, "font-hack"],
  [:cask, "font-charter"],
  [:cask, "font-fantasque-sans-mono"],
  [:cask, "font-input"],
  [:cask, "font-linux-libertine"],
  [:cask, "font-charis-sil"],
  [:cask, "font-norwester"],
  [:cask, "font-mononoki"],
  [:cask, "font-hermit"],
  [:cask, "font-bungee"],
  [:cask, "font-eb-garamond"],
  [:cask, "font-et-book"],
  [:cask, "font-open-sans"],
  [:cask, "font-open-sans-condensed"],
  [:cask, "font-roboto"],
  [:cask, "font-roboto-condensed"],
  [:cask, "font-roboto-mono"],
  [:cask, "font-roboto-slab"],
  [:cask, "font-lato"],
  [:cask, "font-oswald"],
  [:cask, "font-source-code-pro"],
  [:cask, "font-source-sans-pro"],
  [:cask, "font-source-serif-pro"],
  [:cask, "font-montserrat"],
  [:cask, "font-raleway"],
  [:cask, "font-pt-mono"],
  [:cask, "font-pt-sans"],
  [:cask, "font-pt-serif"],
  [:cask, "font-lora"],
  [:cask, "font-droid-sans"],
  [:cask, "font-droid-sans-mono"],
  [:cask, "font-droid-serif"],
  [:cask, "font-ubuntu"],
  [:cask, "font-merriweather"],
  [:cask, "font-merriweather-sans"],
  [:cask, "font-noto-sans"],
  [:cask, "font-noto-emoji"],
  [:cask, "font-noto-serif"],
  [:cask, "font-inconsolata"],
  [:cask, "font-alegreya"],
  [:cask, "font-alegreya-sc"],
  [:cask, "font-alegreya-sans"],
  [:cask, "font-alegreya-sans-sc"],
  [:cask, "font-exo"],
  [:cask, "font-exo2"],
  [:cask, "font-fira-code"],
  [:cask, "font-fira-mono"],
  [:cask, "font-fira-sans"],
  [:cask, "font-crimson-text"],
  [:cask, "font-vollkorn"],
  [:cask, "font-andada"],
  [:cask, "font-andada-sc"],
  [:cask, "font-abril-fatface"],
  [:cask, "font-cardo"],
  [:cask, "font-gentium-basic"],
  [:cask, "font-gentium-book-basic"],
  [:cask, "font-gentium-plus"],
  [:cask, "font-libre-baskerville"],
  [:cask, "font-playfair-display"],
  [:cask, "font-playfair-display-sc"],
  [:cask, "font-gravitas-one"],
  [:cask, "font-old-standard-tt"],
  [:cask, "font-hasklig"],
  [:cask, "font-monoid"],
  [:cask, "font-monoisome"],
  [:cask, "font-iosevka"],
  # TODO: [:cask, "font-julius-sans-one"],
  [:cask, "font-oxygen"],
  [:cask, "font-oxygen-mono"],
  [:cask, "font-bebas-neue"],
  [:cask, "font-cabin"],
  [:cask, "font-cabin-condensed"],
  [:cask, "font-cabin-sketch"],
  [:cask, "font-bitstream-vera"],
  # TODO: [:cask, "font-bree-serif"],
  [:cask, "font-junicode"],
  [:cask, "font-overpass"],
  [:cask, "font-rajdhani"],
  [:cask, "font-tangerine"],
  [:cask, "font-anonymous-pro"],
  [:cask, "font-everson-mono"],
  [:cask, "font-gnu-unifont"],
  # TODO: [:cask, "font-andika"],
  [:cask, "font-cooper-hewitt"],
  [:cask, "font-nunito"],
]

###########
# Compose #
###########

# http://xahlee.info/kbd/osx_keybinding_key_syntax.html

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

COMPOSE = {
  "~a" => {
    # https://docs.racket-lang.org/drracket/Keyboard_Shortcuts.html
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
    "~\\UF702" => "↤",
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
    ":)" => "☺",
    "blacksmiley" => "☻",
    ":(" => "☹",
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

    # macOS keys.
    "option" => "⌥",
    "shift" => "⇧",
    "command" => "⌘",

    # http://unicode.org/charts/PDF/U2070.pdf
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
  }
}

#################
# Homebrew taps #
#################

HOMEBREW_TAPS = [
  "caskroom/cask",
  "caskroom/fonts",
]

#################
# OPAM packages #
#################

OPAM_PACKAGES = [
  "merlin",
  "ocp-indent",
  "utop",
]

###################
# Racket packages #
###################

RACKET_PACKAGES = [
  "drracket-solarized",
  "pollen",
]

###################
# Python packages #
###################

PYTHON_PACKAGES = [
  "font-line",
  "pygments",
]

##############################
# Paths for GUI applications #
##############################

PATH_PATHS = [
  "/usr/local/bin",
  "/usr/bin",
  "/bin",
  "/usr/sbin",
  "/sbin",
  "/opt/X11/bin:/Library/TeX/texbin"
]

#########################
# General configuration #
#########################

USER  = "leafac"
GROUP = "admin"
HOME  = Dir.home

##########
# Backup #
##########

BACKUP_LAPTOP = "/Users/leafac"
BACKUP_LAPTOP_EXCLUDES = [
  "/Downloads/",
  "/.Trash/",
  "/.cache/",
  "/.local/",
  "/Library/Caches/",
  "/VirtualBox VMs/",
  "/Library/Containers/com.docker.docker/",
]
BACKUP_STORAGE = "/Volumes/leafac-flash-drive/storage"
BACKUP_REMOTE = "s3+http://backup.leafac.com/storage"
BACKUP_REMOTE_CREDENTIALS = <<-CREDENTIALS
-----BEGIN PGP MESSAGE-----

jA0ECQMKgygNVoKmD2j/0rgBomw2lbIcNsWFc6S8fLc+O7Rgc8ijEUUMu2VGVle4
KNamakoJFVBkAUYt4CpSIpHDxyHHXrjkca2heBx4mNbIadfMo0QnE0w0jD6YiaeV
sQO5zXHni0IqLClofyccdL1CWk/0XyWDE9rHD4On6t2pDQt/P5JcSFKJJMcfaSKV
mHuSRtYhP0BqN/8gvoV58LSi1FV7yes7HF1ol2ElgQ45xW/Ll5JRT/G7cZOtyB7j
ssFKJ3QI/oL0
=HcwM
-----END PGP MESSAGE-----
CREDENTIALS
BACKUP_REMOTE_FULL_EVERY = "6M"

####################
# Helper functions #
####################

class Array
  def quote_all
    map { |tap| "'#{tap}'" }.join(" ")
  end
end

class String
  def to_command
    gsub(/\n\s+/, " ").strip
  end
end

def install_file path, content, mode: nil
  if ! File.exists?(path) || File.read(path) != content
    puts "Install file #{path}"
    File.write path, content
    unless mode.nil?
      chmod mode, path
    end
  end
end

#########
# Tasks #
#########

# Main.

desc "Install all features."
task default: [
  "command-line-tools",
  :packages,
  :compose,
  :laptop,
  :path,
  :bash,
  "inkscape-palettes",
]

# Command-Line Tools.

# FIXME

desc "Install Command-Line Tools."
task "command-line-tools" do
  sh "xcode-select --install"
end

# Packages.

desc "Install packages."
task packages: [
       "packages:homebrew",
       "packages:opam",
       "packages:racket",
       "packages:python",
     ]

namespace :packages do

  desc "Install Homebrew packages."
  task homebrew: [
         "homebrew:install",
         "homebrew:taps",
       ] do
    installed_packages = (`brew list`.split("\n") +
                          `brew cask list`.split("\n")).map { |cask| cask.split(" ").first }
    PACKAGES.each do |package_specification|
      package_specification = Array(package_specification)
      cask = ""
      if package_specification.first == :cask
        package_specification.shift
        cask = " cask"
      end
      package, *args = package_specification
      if ! installed_packages.include? package.split("/").last
        sh "brew#{cask} install '#{package}' #{args.quote_all}"
      end
    end
  end

  namespace :homebrew do

    desc "Install Homebrew."
    task install: ["command-line-tools", "/usr/local/bin/brew"]

    file "/usr/local/bin/brew" do
      sh %Q{ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"}
      sh "sudo chown -R '#{USER}':'#{GROUP}' '/usr/local'"
    end

    desc "Install Homebrew taps."
    task :taps do
      homebrew_tapped_repositories = `brew tap`.split("\n")
      HOMEBREW_TAPS.each do |homebrew_tap|
        if ! homebrew_tapped_repositories.include? homebrew_tap
          sh "brew tap '#{homebrew_tap}'"
        end
      end
    end
  end

  desc "Install Opam packages."
  task opam: [:homebrew] do
    installed_opam_packages = `opam list --short`.split("\n")
    OPAM_PACKAGES.each do |opam_package|
      if ! installed_opam_packages.include? opam_package
        sh "opam install --yes '#{opam_package}'"
      end
    end
  end

  desc "Install Racket packages."
  task racket: [:homebrew] do
    # FIXME: The output of `raco pkg show' is not only the package names. So
    # this is list is not 100% accurate, but is a good enough approximation for
    # now.
    installed_racket_packages = begin
                                  `raco pkg show`.split("\n")
                                    .map { |racket_package|
                                    racket_package.strip.split(/\s+/).first
                                  }
                                end
    RACKET_PACKAGES.each do |racket_package|
      if ! installed_racket_packages.include? racket_package
        sh "raco pkg install --auto '#{racket_package}'"
      end
    end
  end

  desc "Install Python packages."
  task python: [:homebrew] do
    installed_python_packages = begin
                                  `pip list --format=legacy`.split("\n")
                                    .map { |python_package|
                                    python_package.strip.split(/\s+/).first.downcase
                                  }
                                end
    PYTHON_PACKAGES.each do |python_package|
      if ! installed_python_packages.include? python_package
        sh "pip install '#{python_package}'"
      end
    end
  end
end

# Compose.

desc "Install ‘compose’."

task compose: ["#{HOME}/Library/KeyBindings",
               "#{HOME}/Library/KeyBindings/DefaultKeyBinding.dict"]

directory "#{HOME}/Library/KeyBindings"

file "#{HOME}/Library/KeyBindings/DefaultKeyBinding.dict" => __FILE__ do
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
        pivot_first, _ = combination_split pivot
        included, rest = node.partition { |(combination, _)|
          combination_first, _ = combination_split combination
          combination_first == pivot_first
        }
        included = included.map { |(combination, node_child)|
          _, combination_rest = combination_split combination
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
        node.map { |(combination, node_child)| %Q{"#{combination}"=#{compose_to_s node_child};}}.join +
        "}"
    end
  end

  def combination_split combination
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

  def combination_all_combinations node
    case node
    when String then [""]
    when Hash
      node.map { |(combination, node_child)|
        combination_all_combinations(node_child)
          .map { |node_child_combination| combination + node_child_combination }
      }.reduce(:+)
    end
  end

  def combination_ambiguous_prefixes combinations
    combinations.product(combinations).select { |(combination_1, combination_2)|
      combination_1 != combination_2 && combination_2.start_with?(combination_1)
    }
  end

  ambiguous_prefixes = combination_ambiguous_prefixes(combination_all_combinations(COMPOSE))
  if ambiguous_prefixes.any?
    abort "Compose: The following combinations are ambiguous prefixes: #{ambiguous_prefixes}"
  end

  rendered = compose_render(COMPOSE)
  if ! File.exists?("#{HOME}/Library/KeyBindings/DefaultKeyBinding.dict") ||
     File.read("#{HOME}/Library/KeyBindings/DefaultKeyBinding.dict") != rendered
    File.write("#{HOME}/Library/KeyBindings/DefaultKeyBinding.dict", rendered)
    puts "Compose: Reopen applications for new compose combinations to take effect."
  end
end

# Laptop.

LAPTOP_PATH = "/usr/local/bin/laptop"

desc "Install ‘laptop’ executable."
task :laptop do
  install_file LAPTOP_PATH, <<-LAPTOP, mode: "a+x"
#!/usr/bin/env bash
(cd '#{File.expand_path("..", __FILE__)}' && rake $@)
LAPTOP
end

# Hosts.

# Required entries:
#
#   127.0.0.1 localhost
#   255.255.255.255 broadcasthost
#   ::1 localhost

HOSTS_REMOTE = "http://someonewhocares.org/hosts/hosts"
HOSTS_LOCAL = "/etc/hosts"

desc "Update ‘#{HOSTS_LOCAL}’."
task :hosts do
  sh %Q{sudo -u root bash -c "curl -L '#{HOSTS_REMOTE}' > '#{HOSTS_LOCAL}'"}
  sh "less '#{HOSTS_LOCAL}'"
end

# Path.

# FIXME

desc "Fix path for GUI applications."
task :path do
  sh "sudo launchctl config user path '#{PATH_PATHS.join ":"}'"
end

# Bash.

BASH_PATH = "/usr/local/bin/bash"
BASH_SHELLS = "/etc/shells"

desc "Install Bash configuration."
task :bash do
  _, status = Open3.capture2e "grep '#{BASH_PATH}' '#{BASH_SHELLS}'"
  if status != 0
    sh %Q{sudo -u root bash -c "echo '#{BASH_PATH}' >> '#{BASH_SHELLS}'"}
  end
  if ENV["SHELL"] != BASH_PATH
    sh "chsh -s '#{BASH_PATH}' '#{USER}'"
  end
end

# Inkscape palettes.

INKSCAPE_PALETTES = {
  solarized: <<-PALETTE,
GIMP Palette
Name: Solarized
Columns: 16
#
  0  43  54 base03
  7  54  66 base02
 88 110 117 base01
101 123 131 base00
131 148 150 base0
147 161 161 base1
238 232 213 base2
253 246 227 base3
181 137   0 yellow
203  75  22 orange
220  50  47 red
211  54 130 magenta
108 113 196 violet
 38 139 210 blue
 42 161 152 cyan
133 153   0 green
PALETTE

  "solarized-light" => <<-PALETTE,
GIMP Palette
Name: Solarized Light
Columns: 16
#
  0  43  54 base03
  7  54  66 base02
 88 110 117 base01-optional-emphasized-content
101 123 131 base00-body-text
131 148 150 base0
147 161 161 base1-comments
238 232 213 base2-background-highlights
253 246 227 base3-background
181 137   0 yellow
203  75  22 orange
220  50  47 red
211  54 130 magenta
108 113 196 violet
 38 139 210 blue
 42 161 152 cyan
133 153   0 green
PALETTE

  "solarized-dark" => <<-PALETTE,
GIMP Palette
Name: Solarized Dark
Columns: 16
#
  0  43  54 base03-background
  7  54  66 base02-background-highlights
 88 110 117 base01-comments
101 123 131 base00
131 148 150 base0-body
147 161 161 base1-optional-emphasized-content
238 232 213 base2
253 246 227 base3
181 137   0 yellow
203  75  22 orange
220  50  47 red
211  54 130 magenta
108 113 196 violet
 38 139 210 blue
 42 161 152 cyan
133 153   0 green
PALETTE
}
INKSCAPE_PALETTES_PATH = "/Applications/Inkscape.app/Contents/Resources/share/inkscape/palettes"

desc "Install Inkscape palettes."
task "inkscape-palettes" => INKSCAPE_PALETTES_PATH do
  INKSCAPE_PALETTES.each_pair do |(palette_name, palette)|
    install_file "#{INKSCAPE_PALETTES_PATH}/#{palette_name}.gpl", palette
  end
end

file INKSCAPE_PALETTES_PATH do
  abort "Failed to find folder for Inkscape palettes at ‘#{INKSCAPE_PALETTES_PATH}’. Is Inkscape installed?"
end

# Backup.

desc "Backup laptop, storage and ‘leafac.com’."
task backup: ["backup:laptop", "backup:storage", "backup:leafac.com"]

namespace :backup do

  desc "Backup laptop."
  task laptop: [BACKUP_LAPTOP, BACKUP_STORAGE] do
    sh <<-COMMAND.to_command
      rsync -av
            --delete
            --progress
            #{BACKUP_LAPTOP_EXCLUDES.map { |exclude| "--exclude '#{exclude}'" }.join(" ") }
            '#{BACKUP_LAPTOP}/'
            '#{BACKUP_STORAGE}/laptop/'
    COMMAND
  end

  desc "Backup storage."
  task storage: BACKUP_STORAGE do
    sh backup_remote_credentials, <<-COMMAND.to_command
      ulimit -n 1024 &&
      duplicity --allow-source-mismatch
                --full-if-older-than '#{BACKUP_FULL_EVERY}'
                --progress
                --dry-run
                '#{BACKUP_STORAGE}'
                '#{BACKUP_SERVER}'
    COMMAND
    puts
    puts
    puts "TODO: Remove ‘--dry-run’!"
  end

  desc "Backup ‘leafac.com’."
  task "leafac.com" do
    sh <<-COMMAND.to_command
      ssh leafac.com
        'cd leafac.com &&
         docker-compose -f docker-compose.yml
                        -f docker-compose.administration.yml
                        build administration &&
         docker-compose -f docker-compose.yml
                        -f docker-compose.administration.yml
                        run --rm
                        #{backup_remote_credentials.map { |(key, value)| "-e '#{key}=#{value}'"}.join(" ") }
                        administration make backup'
    COMMAND
  end

  # namespace :backup do
  # 
  #   desc "Restore backup."
  #   task :restore do
  #     if File.exists? DISK_REPOSITORY
  #       abort "Repository “#{DISK_REPOSITORY}” already exists."
  #     end
  # 
  #     sh disk_backup_credentials(DISK_BACKUP_PRIMARY_SERVER), <<-COMMAND.to_command
  #       ulimit -n 1024 &&
  #       duplicity --encrypt-sign-key '#{DISK_BACKUP_GNUPG_KEY}'
  #                 --progress
  #                 restore
  #                 '#{DISK_BACKUP_PRIMARY_SERVER}'
  #                 '#{DISK_REPOSITORY}'
  #     COMMAND
  #   end
  # 
  #   desc "Verify restored backup."
  #   task :verify do
  #     unless File.exists? DISK_REPOSITORY
  #       abort "Repository “#{DISK_REPOSITORY}” does not exist."
  #     end
  # 
  #     sh disk_backup_credentials(DISK_BACKUP_PRIMARY_SERVER), <<-COMMAND.to_command
  #       ulimit -n 1024 &&
  #       duplicity --encrypt-sign-key '#{DISK_BACKUP_GNUPG_KEY}'
  #                 verify
  #                 '#{DISK_BACKUP_PRIMARY_SERVER}'
  #                 '#{DISK_REPOSITORY}'
  #     COMMAND
  #   end
  # 
  #   desc "Describe backup status."
  #   task :status do
  #     sh disk_backup_credentials(DISK_BACKUP_PRIMARY_SERVER), <<-COMMAND.to_command
  #       ulimit -n 1024 &&
  #       duplicity --encrypt-sign-key '#{DISK_BACKUP_GNUPG_KEY}'
  #                 collection-status
  #                 '#{DISK_BACKUP_PRIMARY_SERVER}'
  #     COMMAND
  #   end
  # 
  #   desc "List backup files."
  #   task :list do
  #     sh disk_backup_credentials(DISK_BACKUP_PRIMARY_SERVER), <<-COMMAND.to_command
  #       ulimit -n 1024 &&
  #       duplicity --encrypt-sign-key '#{DISK_BACKUP_GNUPG_KEY}'
  #                 list-current-files
  #                 '#{DISK_BACKUP_PRIMARY_SERVER}'
  #     COMMAND
  #   end
  # 
  #   desc "Clean up old backups."
  #   task :clean do
  #     sh disk_backup_credentials(DISK_BACKUP_PRIMARY_SERVER), <<-COMMAND.to_command
  #       ulimit -n 1024 &&
  #       duplicity --encrypt-sign-key '#{DISK_BACKUP_GNUPG_KEY}'
  #                 remove-older-than '#{DISK_BACKUP_FULL_EVERY}'
  #                 --force
  #                 '#{DISK_BACKUP_PRIMARY_SERVER}'
  #     COMMAND
  #   end
  # 
  #   namespace :clean do
  # 
  #     desc "List which backups would “disk:backup:clean” remove."
  #     task "dry-run" do
  #       sh disk_backup_credentials(DISK_BACKUP_PRIMARY_SERVER), <<-COMMAND.to_command
  #         ulimit -n 1024 &&
  #         duplicity --encrypt-sign-key '#{DISK_BACKUP_GNUPG_KEY}'
  #                   remove-older-than '#{DISK_BACKUP_FULL_EVERY}'
  #                   '#{DISK_BACKUP_PRIMARY_SERVER}'
  #       COMMAND
  #     end
  #   end
  # end

  file BACKUP_LAPTOP do
    abort "Laptop not found at ‘#{BACKUP_LAPTOP}’."
  end

  file BACKUP_STORAGE do
    abort "Store not found at ‘#{BACKUP_STORAGE}’."
  end

  def backup_remote_credentials
    output, status = Open3.capture2 "gpg --decrypt --output - -", stdin_data: BACKUP_REMOTE_CREDENTIALS
    unless status == 0
      abort "Failed to unlock remote credentials."
    end
    YAML.load output
  end
end
