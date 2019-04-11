#!/bin/bash
#
# Created by Alisson Mesquita.
# Script for collecting information from offered calls from a SIP trunk.

# Asterisk consumed variables:
NUM=$1          #1 CALLERID(num)        --> External Phone
DN=$2           #2 EXTEN                --> Internal branch
DSTAT=$3        #3 DIALSTATUS           --> Dialstatus
GPCNT=$4        #4 GRPCOUNT-CALLS       --> Concurrent Call Count: ${GROUP_COUNT(OUT_GVT_edserj)}
FCHN=$5         #5 CDR(channel)         --> Incoming call start channel
CONTEXT=$6      #6 CONTEXT              --> Call In Context
HOST=`hostname | cut -d. -f1`

# Learn more about GELF at http://docs.graylog.org/en/2.5/pages/gelf.html
# Sending the logs through the GELF method via curl:
curl -X POST -H 'Content-Type: application/json' -d '{ "source": "'$HOST'", "application": "incoming_call", "site": "EDSERJ", "from_external": "'$NUM'", "dial_number": "'$DN'", "dial_status": "'$DSTAT'", "concurrent_calls": "'$GPCNT'", "message": "'$FCHN'", "context": "'$CONTEXT'" }' 'http://10.101.2.210:12201/gelf'
