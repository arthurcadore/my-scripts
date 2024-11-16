# Commands to allocate more disk size on PVE-local storage


## Step 1: Delete the "local-pve" mount point

This mount point is created to allocate the disk space to the VMs. 

We'll not use it beacause another RAID volume was created to allocate the VMs data. 

```
pve(gui) -> Datacenter -> Storage -> local -> Delete
```

## Step 2: Create a new mount point

On the node command line, create a new mount point to allocate the disk space to the VMs: 

```
lvremove /dev/pve/data
lvresize -l +100%FREE /dev/pve/root
resize2fs /dev/mapper/pve-root
```