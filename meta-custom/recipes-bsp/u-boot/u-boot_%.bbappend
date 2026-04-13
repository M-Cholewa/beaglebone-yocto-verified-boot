FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://fit-signature.cfg"

UBOOT_SIGN_ENABLE = "1"
UBOOT_SIGN_KEYDIR = "${TOPDIR}/../keys"
UBOOT_SIGN_KEYNAME = "dev"
