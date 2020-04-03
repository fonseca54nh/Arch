/usr/bin/optimus-manager_Xsetup 
exec i3
#exec twm
#exec openbox
#exec herbstluftwm
#exec /usr/bin/startplasma-x11 && plasma_session
#exec bspwm
#uncomment bellow for plasma
#exec startplasma-x11 

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
