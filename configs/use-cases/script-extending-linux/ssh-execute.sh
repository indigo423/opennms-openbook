# !/bin/bash
# Location: OpenNMS Server /opt/monitoring
# Wrapper to execute remote commands over SSH
#
# The seconde argument $2 will be ignored. Capsd and Pollerd give
# arg1[skriptname], arg2[device], arg3[--hostname], arg4[ip-address]
#
IP=${4}
SCRIPT_BASE=/opt/monitoring
SSH_USER=monitoring
SCRIPT_PARM=${2}
SCRIPT=${1}
SUDO=/usr/bin/sudo

CMD="ssh ${SSH_USER}@${IP} ${SUDO} ${SCRIPT_BASE}/${SCRIPT} ${SCRIPT_PARM}"
RESULT=`${CMD}`
if [ ! $? -eq 0 ]; then
  echo ${RESULT}
  exit 0
else
  echo "Error during executing ${CMD}"
  exit 1
fi