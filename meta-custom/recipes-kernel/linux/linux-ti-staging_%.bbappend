KERNEL_IMAGETYPE:forcevariable = "fitImage"
KERNEL_CLASSES += "kernel-fitimage"

UBOOT_SIGN_ENABLE = "1"
UBOOT_SIGN_KEYDIR = "${TOPDIR}/../keys"
UBOOT_SIGN_KEYNAME = "dev"
UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
FIT_SIGN_ALG = "rsa4096"

# Fix load addresses
UBOOT_LOADADDRESS = "0x80008000"
UBOOT_ENTRYPOINT = "0x80008000"

do_assemble_fitimage[depends] += "u-boot:do_deploy"

