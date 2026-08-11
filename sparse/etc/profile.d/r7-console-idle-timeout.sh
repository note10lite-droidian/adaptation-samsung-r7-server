# r7-server: idle-logout for the local console only, not SSH - a session
# left open at the physical console is a real walk-away risk the same way
# an unauthenticated shell was (see r7-console-login); an idle SSH session
# is a different, already-covered threat model (key+TOTP to get in at
# all). $SSH_CONNECTION is set by sshd for every SSH session and absent
# for a console login via `su -`, so it's a reliable way to scope this
# without touching r7-console-login itself.
#
# Deliberately not tied to display power state (r7-hw-buttons' power
# button toggle) - this fires purely on absence of terminal input,
# independent of whether the screen happens to be on or off.
if [ -z "$SSH_CONNECTION" ]; then
    TMOUT=60
    export TMOUT
fi
