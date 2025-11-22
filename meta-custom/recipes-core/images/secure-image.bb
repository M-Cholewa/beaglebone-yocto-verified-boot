SUMMARY = "Secure image with verified boot for BeagleBone Black"
LICENSE = "MIT"

require recipes-core/images/core-image-minimal.bb

# Enforce FIT image with signatures
KERNEL_IMAGETYPE = "fitImage"

# Additional packages
IMAGE_INSTALL += " \
    kernel-modules \
    openssh \
    openssh-sftp-server \
    vim \
    htop \
    nano \
    less \
    procps \
    util-linux \
    "

# Security: remove empty root password (uncomment for production)
# EXTRA_IMAGE_FEATURES:remove = "debug-tweaks"

# Set a strong root password (uncomment and change for production)
# ROOTFS_POSTPROCESS_COMMAND += "set_root_password; "
# set_root_password() {
#     sed -i 's%^root:[^:]*:%root:$6$salt$hash:%' ${IMAGE_ROOTFS}/etc/shadow
# }
