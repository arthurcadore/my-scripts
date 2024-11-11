sudo lvextend -l +90%FREE /dev/ubuntu-vg/ubuntu-lv

#for ext4 partition: 

sudo resize2fs /dev/ubuntu-vg/ubuntu-lv

#for xfs partition: 

sudo xfs_growfs /
