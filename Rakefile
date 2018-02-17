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
  :bash,
  :hosts
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
]

PACKAGES_HOMEBREW_CASK = [

  # Filesystem and Networking

  "wireshark",
  "postman",

  # Internet browsing.

  # "firefox",
  # "google-chrome",

  # Instant messaging and chat

  # "skype",
  # "google-hangouts",
  "slack",
  "zoomus",

  # Desktop utils.

  # "shiftit",
  # "divvy",
  "the-unarchiver",
  # "cyberduck",
  "iterm2",

  # Text editing.

  "atom",

  # Ebook management.

  "calibre",

  # Audio and video.

  "vlc",

  # Virtualization.

  "virtualbox",
  "docker",

  # Writing.

  # "mactex",
  # "skim",
  # "detexify",
  # "microsoft-office",

  # Programming languages.

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

  "openssl",
  "gnupg"

  # Filesystem.

  # "bindfs",
  # "sshfs",
  # "ntfs-3g",
  # "ext2fuse",
  # "ext4fuse",
  # "e2fsprogs",

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
  "the_silver_searcher",
  "youtube-dl",
  "timelimit",
  "watch",
  "rlwrap",
  "jq",
  "vim",

  # Programming languages.

  ## Go.

  "go",
  "glide",

  ## Python.

  "python",
  "python3",

]

PACKAGES_RACKET = [
  "drracket-solarized",
]

PACKAGES_PYTHON = [
  "font-line",
  "pygments",
]


desc "Install packages."
task packages: [
  "packages:homebrew",
  "packages:racket",
  "packages:python",
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

end

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
