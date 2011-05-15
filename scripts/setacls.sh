#!/bin/sh


# COPYRIGHT NOTICE
# This software is copyright (c) 2009 by Challenge/Response, LLC (Licensor). All rights reserved.
# Challenge/Response, LLC (info@cr-labs.com) is the sole owner of this software.
# Unauthorized reuse or redistribution of this software is a violation of copyright law.
# THIS SOFTWARE IS USED UNDER LICENSE FROM CHALLENGE/RESPONSE, LLC.
# NO OTHER USE IS PERMITTED EXCEPT THE FOLLOWING SPECIFIC RIGHTS.
# RIGHTS GRANTED:
# 1. To install the software on ONE (1) Provincetown Community TV (Licensee) "post-processing computer" 
# for the sole purpose of processing member/producer and staff-created videos for distribution by
# Provincetown Community TV; (2) to back-up the software to local media solely to protect against
# data loss; (3) to run the software to perform post-production processing on member/producer
# and staff-created videos.
# PROHIBITIONS:
# Any and all other uses not expressly mentinoed above under "RIGHTS GRANTED" are prohibited. 
# Examples of prohibited uses include but are not limited to: redistribution; conveyance to any 
# party by any means; disassembly; modification; derivative works.
# VIOLATION
# In the event of any violation of the terms of this license, all RIGHTS GRANTED shall be immediately
# terminated and the Licensee shall immediate cease any and all use of the licensed software,
# destroy all copies in its possession, and certify to the Licensor that it has done so.


### this script was only run once to set up ACLs on folders so that scripts can operate on the files by changing the owner to 'robot'
### Set the ACL on the incoming Dropbox folder so that 'robot' gets access to dropped files
###  http://www.macosxhints.com/comment.php?mode=display&format=threaded&order=ASC&pid=103722

### Revision history
### May 2009 - Created by Jim Youll
### June 21, 2009 JY revised to reflect new file structure for automation

MY_PATH=`dirname $0`
source $MY_PATH/ptvconfig

MEDIAPATH="/Users/robot/ptvpost_media"


echo "setacls.sh - set ACL lists on all folders inside the media folder, make scripts executable"

# Make all scripts executable
chmod 755 $MY_PATH/*

sudo chmod +a "robot allow list,add_file,search,delete,add_subdirectory,delete_child,readattr,writeattr,readextattr,writeextattr,readsecurity,writesecurity,chown,file_inherit,directory_inherit" "$MEDIAPATH/Submit-High"
sudo chmod +a "robot allow list,add_file,search,delete,add_subdirectory,delete_child,readattr,writeattr,readextattr,writeextattr,readsecurity,writesecurity,chown,file_inherit,directory_inherit" "$MEDIAPATH/Submit-Low"
sudo chmod +a "robot allow list,add_file,search,delete,add_subdirectory,delete_child,readattr,writeattr,readextattr,writeextattr,readsecurity,writesecurity,chown,file_inherit,directory_inherit" "$MEDIAPATH/Submit-DVD"
sudo chmod +a "robot allow list,add_file,search,delete,add_subdirectory,delete_child,readattr,writeattr,readextattr,writeextattr,readsecurity,writesecurity,chown,file_inherit,directory_inherit" "$MEDIAPATH/OUT-Digital"
sudo chmod +a "robot allow list,add_file,search,delete,add_subdirectory,delete_child,readattr,writeattr,readextattr,writeextattr,readsecurity,writesecurity,chown,file_inherit,directory_inherit" "$MEDIAPATH/OUT-NTSC"
sudo chmod +a "robot allow list,add_file,search,delete,add_subdirectory,delete_child,readattr,writeattr,readextattr,writeextattr,readsecurity,writesecurity,chown,file_inherit,directory_inherit" "$MEDIAPATH/OUT-Proofsheet"
sudo chmod +a "robot allow list,add_file,search,delete,add_subdirectory,delete_child,readattr,writeattr,readextattr,writeextattr,readsecurity,writesecurity,chown,file_inherit,directory_inherit" "$MEDIAPATH/OUT-DVD"
sudo chmod +a "robot allow list,add_file,search,delete,add_subdirectory,delete_child,readattr,writeattr,readextattr,writeextattr,readsecurity,writesecurity,chown,file_inherit,directory_inherit" "$MEDIAPATH/PROCESSED"
sudo chmod +a "robot allow list,add_file,search,delete,add_subdirectory,delete_child,readattr,writeattr,readextattr,writeextattr,readsecurity,writesecurity,chown,file_inherit,directory_inherit" "$MEDIAPATH/REJECTED"
sudo chmod +a "robot allow list,add_file,search,delete,add_subdirectory,delete_child,readattr,writeattr,readextattr,writeextattr,readsecurity,writesecurity,chown,file_inherit,directory_inherit" "$MEDIAPATH/ERROR"
sudo chmod +a "robot allow list,add_file,search,delete,add_subdirectory,delete_child,readattr,writeattr,readextattr,writeextattr,readsecurity,writesecurity,chown,file_inherit,directory_inherit" "$MEDIAPATH/Roxio Converted Items"
