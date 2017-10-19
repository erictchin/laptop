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

The @tt{laptop} executable provides a collection of separate features:

@itemlist[
 @item{Installation of selected software and font packages with @hyperlink["http://brew.sh/"]{Homebrew}, @hyperlink["https://caskroom.github.io/"]{Homebrew Cask} and other package managers.}
 @item{Installation of a compose key ⎄ for macOS.}
 @item{Installation of custom @tt{/etc/hosts} based on @hyperlink["http://someonewhocares.org/hosts/"]{Dan Pollock's configurations}.}
 @item{Fix @tt{$PATH} environment variable for GUI applications.}]

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

Configure by editing the @tt{Rakefile}.
