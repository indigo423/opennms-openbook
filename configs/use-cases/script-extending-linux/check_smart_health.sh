# !/bin/sh
# Location: remote server in /opt/monitoring
# File: check_smart_health.sh
#
# Check local hard disks with S.M.A.R.T.

# Test if device exist 
ls -l $1 1>&2 >/dev/null
if [ $? -eq 0 ]; then
  # Run smartctl check
  RESULT=$(smartctl -n idle -H ${1} | grep result)
  echo ${RESULT}
else
  exit 1
fi