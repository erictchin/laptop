#lang scribble/manual

@title{laptop}
@author{@author+email["Leandro Facchinetti" "me@leafac.com"]}

@emph{Configuration for Leandro Facchinetti’s personal machine.}

@tabular[#:style 'boxed
         #:sep @hspace[1]
         #:row-properties '(bottom-border)
         `((, @bold{Documentation} , @hyperlink["https://www.leafac.com/software/laptop"]{https://www.leafac.com/software/laptop})
           (, @bold{License} , @hyperlink["https://gnu.org/licenses/gpl-3.0.txt"]{GNU General Public License Version 3})
           (, @bold{Code of Conduct} , @hyperlink["http://contributor-covenant.org/version/1/4/"]{Contributor Covenant v1.4.0})
           (, @bold{Source} , @hyperlink["https://git.leafac.com/laptop"]{https://git.leafac.com/laptop})
           (, @bold{Bug Reports} , @para{Write emails to @hyperlink["mailto:laptop@leafac.com"]|{laptop@leafac.com}|.})
           (, @bold{Contributions} , @para{Send @hyperlink["https://git-scm.com/docs/git-format-patch"]{patches} and @hyperlink["https://git-scm.com/docs/git-request-pull"]{pull requests} via email to @hyperlink["mailto:laptop@leafac.com"]|{laptop@leafac.com}|.}))]

@section[#:tag "overview"]{Overview}

This software is a collection of separate features:

@itemlist[
 @item{Installation of selected software and font packages with @hyperlink["http://brew.sh/"]{Homebrew}, @hyperlink["https://caskroom.github.io/"]{Homebrew Cask} and other package managers.}
 @item{Disk management that allows for the use of an external drive as the main storage mechanism and the computer as a working station for the data.}
 @item{Backup to @hyperlink["https://aws.amazon.com/s3/"]{Amazon S3} with @hyperlink["http://duplicity.nongnu.org/"]{Duplicity}.}
 @item{
  @margin-note{This project @hyperlink["http://nullprogram.com/blog/2012/06/24/"]{includes the private keys}. This way it is possible to retrieve backups and reproduce the whole machine from scratch.}

  Encryption with @hyperlink["https://gnupg.org/"]{GnuPG}.
  }
 @item{Credentials management with @hyperlink["https://www.emacswiki.org/emacs/GnusAuthinfo"]{Authinfo}.}
 @item{Configuration of command-line tools such as @hyperlink["https://git-scm.com/"]{Git} and @hyperlink["https://www.gnu.org/software/bash/"]{Bash}.}
 @item{Email management with @hyperlink["http://pyropus.ca/software/getmail/"]{getmail} for fetching, @hyperlink["http://msmtp.sourceforge.net/"]{msmtp} for sending, @hyperlink["https://www.dovecot.org/"]{Dovecot} for local delivery with @hyperlink["http://sieve.info/"]{Sieve} filtering, @hyperlink["http://bogofilter.sourceforge.net/"]{Bogofilter} for content-based spam filtering, @hyperlink["http://www.djcbsoftware.nl/code/mu/"]{mu} for indexing and @hyperlink["http://www.djcbsoftware.nl/code/mu/mu4e.html"]{mu4e} as the email client.}
 @item{@hyperlink["https://www.gnu.org/software/emacs/"]{Emacs} configuration based on @hyperlink["http://batsov.com/prelude/"]{Prelude}.}
 @item{Customized @tt{/etc/hosts} based on @hyperlink["http://someonewhocares.org/hosts/"]{Dan Pollock's configurations}.}
 @item{Templates for projects and basic diagramming with @hyperlink["http://plantuml.com/"]{PlantUML} and @hyperlink["http://graphviz.org/"]{Graphviz}.}
 @item{@hyperlink["http://ethanschoonover.com/solarized"]{Solarized} colorscheme everywhere.}
 @item{A compose key for macOS.}]

@section[#:tag "installation"]{Installation}

On a fresh macOS installation, run:

@nested[#:style 'code-inset @verbatim|{
$ curl https://git.leafac.com/laptop/plain/installer/install.sh | bash
         }|]

@section[#:tag "usage"]{Usage}

Refer to:

@nested[#:style 'code-inset @verbatim|{
$ laptop -T
         }|]
