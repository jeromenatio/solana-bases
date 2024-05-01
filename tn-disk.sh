#!/bin/bash

# Check if sufficient arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <disk-name> <mount-directory>"
    exit 1
fi

DISK="/dev/$1"
MOUNT_DIR=$2

# Check if solanauser exists
if ! id "solanauser" &>/dev/null; then
    echo "User 'solanauser' does not exist. Please create this user before running the script."
    exit 1
fi

# Ensure the disk exists
if [ ! -b "$DISK" ]; then
    echo "Disk $DISK does not exist."
    exit 1
fi

# Create mount directory if it doesn't exist
if [ ! -d "$MOUNT_DIR" ]; then
    echo "Mount directory $MOUNT_DIR does not exist. Creating it..."
    mkdir -p "$MOUNT_DIR"
fi

# Unmount disk if it is mounted
mountpoint -q "$MOUNT_DIR" && umount "$MOUNT_DIR"
umount "$DISK" 2> /dev/null

# Create a new partition table
echo "Creating new GPT partition table on $DISK..."
parted -s "$DISK" mklabel gpt

# Create a single primary partition that spans the entire disk
echo "Creating a primary partition on $DISK..."
parted -s "$DISK" mkpart primary ext4 0% 100%

# Wait for the partition to be recognized
sleep 2

# Get partition name (assuming it's the first partition)
PARTITION="${DISK}p1"
if [ ! -b "$PARTITION" ]; then
    PARTITION="${DISK}1"  # Adjust naming scheme for NVMe devices
fi

# Format the partition with ext4 filesystem optimized for performance
echo "Formatting the partition $PARTITION with ext4 filesystem..."
mkfs.ext4 -F -O ^has_journal -E stride=2,stripe-width=512 "$PARTITION"

# Add fstab entry
echo "Adding fstab entry for $PARTITION..."
UUID=$(blkid -s UUID -o value "$PARTITION")
echo "UUID=$UUID $MOUNT_DIR ext4 noatime,nodiratime,data=writeback,barrier=0,commit=5 0 2" >> /etc/fstab

# Mount the partition
echo "Mounting $PARTITION to $MOUNT_DIR..."
mount "$PARTITION" "$MOUNT_DIR"

# Change ownership of the mount directory to solanauser
echo "Changing ownership of $MOUNT_DIR to solanauser:solanauser..."
chown solanauser:solanauser "$MOUNT_DIR"

echo "Partition $PARTITION has been formatted and mounted to $MOUNT_DIR and added to fstab for auto-mounting."
echo "Ownership of $MOUNT_DIR has been changed to solanauser:solanauser."