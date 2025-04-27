#!/bin/bash

#  Copyright (C) 2015, 2024  Rafael Senties Martinelli
#
#  This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License 3 as published by
#   the Free Software Foundation.
#
#  This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software Foundation,
#   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA.



#
# Set the scripts permissions
#

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd "$DIR" || (echo "problem in cd" && exit)

if [ "$EUID" -ne 0 ]
  then echo "Please run as root."
  exit
fi


#
# Remove previous versions
#
echo -e "\e[00;32mRemoving previous versions..\e[00m"
chmod a+x ./remove
./remove -s


#
# Start the installation
#


echo -e "\e[00;32m\nInstalling the software files...\e[00m"

function install_files(){
    
    echo "installing: $1"
    
    install -d "$1"
    install -D "$DIR$1"/* "$1"
    
}

install_files "/usr/bin"
install_files "/usr/share/doc/build-deb"
install_files "/usr/share/man/man8"


#
# End
#

echo -e "\e[00;32m\nThe installation is complete.\e[00m"
