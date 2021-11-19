
**`build-deb` is a program to easily create Debian packages for binaries or interpreted languages (Python, Bash, Perl, etc...)**

For understanding the basics of Debian packages you can read [this article](https://github.com/rsm-gh/build-deb/blob/master/DEBIAN_BASICS.md).


```
build-deb(8)                                                                         System Manager's Manual                                                                         build-deb(8)

NAME
        build-deb - Easy Debian/Tar.Gz package builder.

HOME
        https://github.com/rsm-gh/build-deb

DESCRIPTION
       This  program  allows  you to create Debian packages for binaries or interpreted languages (Python, Bash, Perl.. etc..). You must keep in mind that this is only to create "basic" Debian
       packages, Debian Maintainers use more complicated tools like "dpkg-buildpackage" (You are able to use all the features of a Debian package like pre-installation scripts, etc..).

       Nevertheless, this package will allow you to automatically sign your packages, and doing more complicated stuff with the magic of only one command.

USAGE
       build-deb <first command> [Arguments..]

FIRST COMMAND
       <folder>
              By default, if you only enter the <source folder> field without any other option, It will build a Debian Package.

                     The program will:
                             - Change the executable permissions to: Bash, Python, Perl, and Ruby scripts, and to  binaries  with  the  mime-type : x-executable or octet-stream.
                             - Gzip manuals.
                             - Delete: *.pyc, *~ (backup files), and files placed in the root directory "/". It will also delete the ".git" folder.
                     Optional:
                             - Sign the package (If you have a GPG key in your root key ring, and your email is in the maintainer filed)
                             - Install the package (only for Debian Packages)
                             - Use Global Variables (To replace, the date, program version, etc.. )
                             - Fill the size of the package in the control file.
                             - Add your package to your reprepro repository (only for Debian Packages)
                             - Copy the changelog somewhere.
                             - and more..

              <source folder>  can be either an absolute path or the name of a directory placed in the current working directory. The source folder must contain a  DEBIAN  STRUCTURE!  Tutorial: https://github.com/rsm-gh/build-deb/blob/master/DEBIAN_BASICS.md
              *Note:  Since the program automatically rename the packages "program-name_program-version_architecture" the source
              folder can contain a different name. This is pretty useful to create links outside the folder to prevent you from navigating trough the un-useful directories.

              **To cancel the process use ctrl-c rather than closing the window.
       -c, --control
              Create a DEBIAN folder with a template of the control file.
       -o,--options
              Template of the options file.
       -h, -help
              Display the help dialog.
       -v,--version
              Display your current build-deb version.
       -l, --license
              Display the license.

ARGUMENTS
       -di, --dont-install
              After building the package, do not install it.
       -drgv, --dont-replace-global-variables
              The program won't read the files in order to replace the global variables.
       -frepo, --force-reprepro
              Force your package to enter to the reprepro repository, even if there is package with the same or a higher version.
       -drepo, --dont-add-reprepro
              Ignore the copy changelog option of the options file.
       -dcpc, --dont-copy-changelog
              Ignore the copy changelog option of the options file.
       -ds, --dont-sign
              Do not sign the package.
       -ds-tg, --dont-sign-targz
              Do not sign TarGz packages
       -tg, -targz
              Create a tar.gz archive instead of the .deb
       -deb-tg,  --debian-targz
              Create a Debian and a TarGz Package

GLOBAL VARIABLES
       By default the program will read your files to try to find the Global Variables and replace them with the right value. (This can be skipped)

       DEB_BUILDER_VERSION
              Value of the version field of the control file.
       DEB_BUILDER_DATE_TIME
              Format: Sat Jan 10 16:32:30 CET 2015
       DEB_BUILDER_YEAR
              Format: 2015
       DEB_BUILDER_DATE
              Format: Year-Month-Day

CONTROL FILE
       Installed-Size
              If you set "Installed-Size: DEB_BUILDER_SIZE" in the control file, the size of the package will automatically be substituted.

BUILD_DEB Options File
       It is possible of using some more options and setting default arguments when building packages thanks to the BUILD_DEB file.
              Some of the options are: Setting default arguments, adding the package to a reprepro repository, copying the changelog, changing the tar.gz location, etc..
       For more information generate a BUILD_DEB file "build-deb -o" and see its content

EXAMPLES
       build-deb program_source --targz --dont-replace-global-variables
       Will create a tar.gz package from a folder in the current directory called "program_source". The program will also skip replacing global variables.

Written by Rafael Senties Martinelli.                                                     29 April 2015                                                                              build-deb(8)
```
