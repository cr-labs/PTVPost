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



# call as "  switchtouser.sh (username)
# example: switchtouser.sh member
/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -switchToUserID `id -u $1`
