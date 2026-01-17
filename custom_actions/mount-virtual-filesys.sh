mounttarget=$(zenity --list --title="Mount target" --width=200 --height=400 --column=device /dev/nbd{0..15});
    if [ -n "$mounttarget" ]; then
    ro=$(zenity --info --title "Mount Setting" --text "Would you like to mount as read only or writable?" --ok-label "Read Only" --extra-button "Writeable" --extra-button "Cancel");
    if [ $? = 0 ]; then
    pkexec sh -c "modprobe nbd && qemu-nbd -c $mounttarget --read-only %f";
    elif [ "$ro" = "Writeable" ]; then
    pkexec sh -c "modprobe nbd && qemu-nbd -c $mounttarget %f";
    fi;
    fi
