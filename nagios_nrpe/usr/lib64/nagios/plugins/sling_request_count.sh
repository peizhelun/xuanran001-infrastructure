#!/bin/bash

# Source function library.
. /usr/lib64/nagios/plugins/functions

#
# Check on all sling node
#

jstack_dump="/opt/glue/monitor/jstack_dump.txt"

request_count=`grep "HTTP" $jstack_dump | wc -l`

echo -n "Request count: $request_count; "

if [ $request_count -gt 50 ]; then
  echo "larger than 50"
  exit $RET_CR
elif [ $request_count -gt 30 ]; then
  echo "larger than 30"
  exit $RET_WR
fi

echo "OK"
exit $RET_OK
