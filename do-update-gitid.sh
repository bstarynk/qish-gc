#!/bin/bash
# file qish-gc/do-update-gitid.sh
SHORTGITID=$(./do-generate-gitid.sh -s)
FULLGITID=$(./do-generate-gitid.sh)
TIMESTAMP=$(/usr/bin/date +"%c")
/bin/cp include/qish.h include/qish.h~
/bin/ed include/qish.h <<EOF
1,50s:^#define QISH_GITID .*$:#define QISH_GITID "$SHORTGITID":
1,50s:^#define QISH_TIMESTAMP .*$:#define QISH_TIMESTAMP "$TIMESTAMP":
w
q
EOF

