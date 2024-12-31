#!/bin/bash

#  Copyright (C) 2015, 2019  Rafael Senties Martinelli 
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

if [ "$EUID" -ne 0 ]
  then echo "Please run as root."
  exit
fi

if [ -d /usr/share/build-deb ]; then
	rm -rf /usr/bin/build-deb
fi

if [ -d /usr/share/doc/build-deb ]; then
	rm -rf /usr/share/doc/build-deb
fi

if [ "$1" != "-s" ]; then
	echo "The uninstall is complete."
fi