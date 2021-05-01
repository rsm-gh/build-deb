
# Basics of Debian Packages

Debian packages are easy installation packages for Debian or Debian Based distributions. This tutorial is divided in two parts;
the parts [PGP Signature](https://github.com/rsm-gh/build-deb/new/master#pgp-signature) & [Installation](https://github.com/rsm-gh/build-deb/new/master#installation) are destined to any user,
and the parts [Getting the package's code](https://github.com/rsm-gh/build-deb/new/master#getting-the-packages-code) & [How to Build](https://github.com/rsm-gh/build-deb/new/master#how-to-build) for programmers or more advanced users.

	
## PGP Signature
Most of the GNU-Linux packages are Libre Software, and because of it
anyone can take their source code, modify it with malicious code, and redistribute it. 
PGP signatures are the method that maintainers and people use to trust the origin of a package.

	
If you have already installed packages in GNU-Linux, you probably did it from a repository. When installing a packages
from a repository the package manager automatically verifies the signatures.
On the other hand, if you manually downloaded the package, the signature will not be checked, and it is then very important
to do a manual verification.

Here are the steps to verify the signature of a package:

  + Download the developer's PGP key.
  + Import the key to your keyring `gpg --import /path/to/the/file`.
  + Verify the package's signature: `gpg --verify /path/to/the/package`.

		
		
## Installation
To install Debian packages it is necessary to use a package manager (Ex: from a root terminal use `dpkg -i /path/to/the/pacakge/`). 	
In some distributions it's even possible to avoid using the terminal and just install them by double-left-clicking.

Personally, I rather doing the installation from the terminal because sometimes the packages display messages (errors, warnings, etc)
that get hidden in graphical interfaces. It really depends of the distribution and the package manager, but in any case doing it
from the terminal will always give you the maximum of information.

When doing a local installation (installing a package that does not comes from a repository), the dependencies are not automatically 
installed. The terminal output is then like the following:

```bash
 root@debian:/home/user/Downloads# dpkg -i 1.6-7zRecover.deb
 Selecting previously unselected package 7zRecover.
 (Reading database ... 105435 files and directories currently installed.)
 Unpacking 7zRecover (from 1.6-7zRecover.deb) ...
 dpkg: dependency problems prevent configuration of 7zRecover:
  7zRecover depends on p7zip; however:
   Package p7zip is not installed.
  7zRecover depends on python-psutil; however:
   Package python-psutil is not installed.

 dpkg: error processing 7zRecover (--install):
 dependency problems - leaving unconfigured
 Errors were encountered while processing:
 7zRecover
 ```

In this case I installed `1.6-7zRecover.deb` and the dependencies `p7zip` and `python-psutil` are missing.
To fix them, the command `apt-get -f install` is very useful. It will try to fill the dependencies by using the available repositories.

If after using the previous command the dependencies are not installed, it means that the repositories do not have the 
missing packages. You can then manually install them or add a repository. 

The steps for adding a repository are the following:

  + Add the url of the repository into `/etc/apt/sources.list`.
  + If the repository is PGP signed, download the developer's PGP key, and add it to your trusted keys `apt-key add /path/to/the/key`.
  + Update the software list: `apt-get update`.
  + Install the missing packages: `apt-get -f install`.

		
## Getting the package's code
Debian packages are basically divided in two contents; the software's files and the information for the package manager.
      
  + To obtain the software files it is only necessary to decompress the package with any decompression tool like `p7zip`, ex: `7z x /path/to/the/deb`.
  + To obtain the package manager information, it is necessary to use `dpkg`, ex:`dpkg -e /path/to/the/debian`.

Some distributions allow to extract the package by doing `right-click > decompress` and sometimes even both parts are extracted.

				

## How to build
The right way of building a Debian package is by using `dpkg-buildpackage` but it may be a little bit complicated. Instead, it is possible to use `dpkg -b <folder>`
These are the basics for creating Debian packages with `dpkg -b <folder path>` for any binary or interpreted language (Python, Bash, etc..):

		
### 1. Create a DEBIAN files & folders structure
```
ProgramName-Version/
ProgramName-Version/DEBIAN
ProgramName-Version/DEBIAN/control
ProgramName-Version/usr/
ProgramName-Version/usr/bin/
ProgramName-Version/usr/bin/executable_script
```

### 2. Copy the software files

The folder structure will be the structure of the program once it's installed.            
  + Scripts placed at `/usr/bin/` are directly called from the terminal and their extension should not be added. This is the location where the main executable must be placed.
  + As a general rule, if the program has multiple files, they should be placed under `ProgramName-Version/usr/share/ProgramName/all the files`.

For having more information about this you can read about the GNU/Linux structure since there are many locations for different stuff. For example, if the package is a python library, you will probably don't have a script in `usr/bin/` but instead the python module shall be added to `/usr/lib/pythonX.X/site-packages/python_module.py`.

Some Remarks:
  + It is possible to add pre-installation, post-installation, pre-removal scripts to the package. They only need to be added inside the `DEBIAN` folder with their respective name (`preinst`, `postinst`, `prerm`, etc..).
  + For adding a graphical launcher (application icon) it is only necessary to create a `program_name.desktop` file into the applications folder `/usr/share/applications/` To figure out the content of the file, just sniff the files of the application directory of your system, you will probably find good examples.


### 3. Fill the control file

Here is an example of the control file. For creating it just paste the following text into an empty file: 

```
Package: ProgramName
Version: VERSION
Architecture: all
Maintainer: YOUR NAME &lt;EMAIL&gt;
Depends: python2.7, etc , etc,
Installed-Size: in_kb
Homepage: http://foo.com
Description: Here you can put a one line description. This is the short Description.
 Here you put the long description, indented by 1 space.
```


### 4. Change all the folder permission to root
`chown root:root -R /path/to/ProgramName-Version`

### 5. Change the script's permissions to executable
`chmod a+x /path/to/the/scripts`

### 6. Finally, build the package
`dpkg -b /path/to/the/ProgramName-Version`

  
### Bonus
Doing all the previous steps, and filling the control file it is some times annoying and time consuming. This is why I created [build-deb](https://github.com/rsm-gh/build-deb).
build-deb will allow you to easily build and customize your packages with out doing any effort.

___________

Publish on October 8, 2014.  
Last Modification on January 11, 2016.  
Hosted on GitHub since 27 April, 2021. 

The concent of this page is released under the [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/deed.fr) license.

