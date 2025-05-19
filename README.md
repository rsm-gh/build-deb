# build-deb

`build-deb` is a bash script that simplifies the process of building Debian packages. Its main
usage is simply to run `build-deb <directory>` and the package will be created and installed.

For more details look at the example or the manual.

## Example

The Debian package of `build-deb`, is built using the tool itself:
```bash
root@user-dev:/home/user/Software# build-deb build-deb

 Reading the control file...

 Copying the project ./build-deb_1.6.1_all_tmp... 

 Removing unwanted files and directories...
Deleted: /BUILD_DEB
Deleted: /DEBIAN_BASICS.md
Deleted: /.gitignore
Deleted: /install.sh
Deleted: /LICENSE
Deleted: /README.md
Deleted: /uninstall.sh
Deleted: /.git
Deleted: /.idea

 Changing the permissions...
0755: /usr/bin/build-deb

 Compressing manuals...
Gzip: ./build-deb_1.6.1_all_tmp/usr/share/man/man8/build-deb.8

 Filling the control file...
Installed-Size: 442 kB

 Building ./build-deb_1.6.1_all.deb...
dpkg-deb: building package 'build-deb' in './build-deb_1.6.1_all.deb'.
SHA256: 9f5ac420f4b51ecbcafcee422e004c5347deaf48c2b09b3fd57d23e4c607023a
SHA384: f7635ca21e4741af0185608c0a54875103a9fa34b8dbe8072657966fe4386f4fd9461c607fa704fa646177b18c764e3f
SHA512: 621375b6fa9f21f8b95737baca704400a2630bb89284192235742ef71c68c9366418005914ef87941251305059fe5bde8db8151ea6fdbd692bfe4a946b18f7e4

 Installing ./build-deb_1.6.1_all.deb...
(Reading database ... 176190 files and directories currently installed.)
Preparing to unpack ./build-deb_1.6.1_all.deb ...
Unpacking build-deb (1.6.1) over (1.6.1) ...
Setting up build-deb (1.6.1) ...
Processing triggers for man-db (2.13.0-1) ...

 Signing ./build-deb_1.6.1_all.deb...
 The root keyring do not contains the private key for 'rafael@senties-martinelli.com'.

 Deleting ./build-deb_1.6.1_all_tmp...

```

## Manual

```
                             System Manager's Manual           

NAME
       build-deb - Easy Debian and Tar.gz package builder.

HOME
       https://github.com/rsm-gh/build-deb

DESCRIPTION
       This script facilitates the creation of Debian packages for binaries or in‐
       terpreted languages such as Python, Bash, or Perl. It is designed for creat‐
       ing  "basic"  Debian  packages and does not replace more advanced tools like
       "dpkg-buildpackage." Nevertheless, it allows the use of features  like  pre-
       installation or post-installation scripts.

       Additionally, build-deb can automatically sign packages and perform more ad‐
       vanced tasks with a single command.

USAGE
       build-deb <command> [arguments]

COMMANDS
       <folder>
              This  command  will build a Debian package, and it can be filled with
              an absolute path or with a folder name of the current working  direc‐
              tory. The folder must have a valid Debian structure.

              For   more  details  about  the  folder  structure,  you  can  visit:
              https://rsm92.dev/articles/debian-packages#build

              Default:
                     • Set executable permissions for Bash, Python, Perl, and  Ruby
                     scripts,  and  binaries with MIME types such as "x-executable"
                     or "octet-stream".

                     • Compress manuals using gzip.

                     • Remove unnecessary files, such as *.pyc, backup files (*~),
                     and files/hidden dirs in the root directory.

              Optional:
                     • Sign the package (if a GPG key is available  and  the  main‐
                     tainer email is specified).

                     • Install the package (for Debian packages).

                     • Replace global variables (e.g., date, program version).

                     • Calculate and include the package size in the control file.

                     • Add the package to a reprepro repository (for Debian pack‐
                     ages).

                     • Copy the changelog to a specified location.

              *The  program  automatically  renames  packages   using   the  format
              "program-name_program-version_architecture,"  so  the  source  folder
              name can differ. This allows to use symbolic links outside the folder
              to simplify navigation.

              **To cancel the process, use Ctrl-C rather than closing the window.

       -c, --control
              Create a DEBIAN folder with a control file template.

       -o, --options
              Generate a template for the options file.

       -h, --help
              Display the help dialog.

       -v, --version
              Display the current build-deb version.

       -l, --license
              Display the license information.

ARGUMENTS
       -di, --dont-install
                Skip installing the package after building.

       -drgv, --dont-replace-global-variables
                Skip replacing global variables in the files.

       -frepo, --force-reprepro
                Force  the  package to be added to the reprepro repository, even if a
                package with the same or higher version exists.

       -drepo, --dont-add-reprepro
                Do not add the package to the reprepro repository.

       -dcpc, --dont-copy-changelog
                Do not copy the changelog as specified in the options file.

       -ds, --dont-sign
                Do not sign the package.

       -tgz, --targz
                Create a Tar.gz archive instead of a .deb package.

       -deb-tgz, --debian-targz
                Create both Debian and Tar.gz packages.

GLOBAL VARIABLES
       By default, build-deb read the files to identify and replace global vari‐
       ables with appropriate values. To disable this feature use "-drgv".

       DEB_BUILDER_VERSION
              Represents the version field in the control file.

       DEB_BUILDER_DATE_TIME
              Format: Sat Jan 10 16:32:30 CET 2015

       DEB_BUILDER_YEAR
              Format: 2015

       DEB_BUILDER_DATE
              Format: Year-Month-Day

CONTROL FILE
       Installed-Size
              Specifying "Installed-Size: DEB_BUILDER_SIZE" in the control file au‐
              tomatically calculate and fill the package size.

OPTIONS FILE
       The options file allows to define de build arguments and to include some ad‐
       ditional  options. For more details generate a BUILD_DEB file "build-deb -o"
       and review its contents.

EXAMPLES
       build-deb program_source --targz --dont-replace-global-variables
              Will create a Tar.gz package from the "program_source" folder in  the
              current  directory  and  it will skip replacing the global variables.
              This is how this package is created.

Written by Rafael Senties Martinelli       29 April 2015
```