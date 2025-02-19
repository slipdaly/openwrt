ifeq ($(SUBTARGET),prx300)
include $(INCLUDE_DIR)/version.mk

FAKEROOT_CMD:=$(if $(CONFIG_PACKAGE_ugw-fakeroot), \
	ALTPATH="$(STAGING_DIR_ROOT)" CONFFILE="$(PWD)/image/fakeroot-prx300.conf" \
	fakeroot -- $(STAGING_DIR_HOST)/bin/fakeroot.sh)

FAKEROOT_CMD_PRX321_ETH:=$(if $(CONFIG_PACKAGE_ugw-fakeroot), \
	ALTPATH="$(STAGING_DIR_ROOT)" CONFFILE="$(STAGING_DIR_HOST)/share/fakeroot/fakeroot.conf" \
	fakeroot -- $(STAGING_DIR_HOST)/bin/fakeroot.sh)

# NAND configs are based on MX35LF1GEAB flash
# Max volume 32 MiB (256 blocks)
# Journal size 1 MiB to fit in small (<4 MiB) image
define Device/PRX_GENERIC
  $(Device/lantiqFullImage)
  IMAGE_SIZE := 64512k
  KERNEL_LOADADDR := 0xa0020000
  KERNEL_ENTRY := 0xa0020000
  KERNEL_INITRAMFS := kernel-bin | append-dtb | lzma | uImage lzma
  UIMAGE_NAME:=$(if $(VERSION_IMAGE_SED),$(VERSION_IMAGE_SED))
  FAKED_ENV := $(FAKEROOT_CMD)
  DEVICE_PACKAGES:=kmod-intel_eth_drv_xrx500 -dropbear
endef

define Device/PRX_ETH
  $(Device/PRX_GENERIC)
  $(Device/NAND)
  DEVICE_PACKAGES += ltq-gphy-fw-prx3xx $(PON_ETH_PACKAGES)
endef

define Device/PRX_SFP
  $(Device/PRX_GENERIC)
  $(Device/NAND)
  DEVICE_PACKAGES += $(PON_BASE_PACKAGES) $(PON_SFP_PACKAGES)
endef

define Device/PRX_SFU
  $(Device/PRX_GENERIC)
  $(Device/NAND)
  DEVICE_PACKAGES += $(PON_BASE_PACKAGES) $(PON_SFU_PACKAGES)
endef

### Board definitions ###

define Device/PRX321_EVA_GPHY_ETH
  $(Device/PRX_ETH)
  DEVICE_DTS := prx321-eva-gphy-eth
  DEVICE_TITLE := PRX321 EVA GPHY Ethernet WAN
endef
TARGET_DEVICES += PRX321_EVA_GPHY_ETH

define Device/PRX321_EVA_PCIE
  $(Device/PRX_ETH)
  DEVICE_DTS := prx321-eva-pcie
  DEVICE_TITLE := PRX321 EVA PCIe
endef
TARGET_DEVICES += PRX321_EVA_PCIE

define Device/PRX321_EVA_QSPI_ETH
  $(Device/PRX_ETH)
  DEVICE_DTS := prx321-eva-qspi-eth
  DEVICE_TITLE := PRX321 EVA QSPI Ethernet WAN
endef
TARGET_DEVICES += PRX321_EVA_QSPI_ETH

define Device/PRX321_EVA_QSPI_PON
  $(Device/PRX_SFU)
  DEVICE_DTS := prx321-eva-qspi-pon
  DEVICE_TITLE := PRX321 EVA QSPI PON WAN
endef
TARGET_DEVICES += PRX321_EVA_QSPI_PON

define Device/PRX321_SFU_QSPI_PON
  $(Device/PRX_SFU)
  DEVICE_DTS := prx321-sfu-qspi-pon
  DEVICE_TITLE := PRX321 SFU QSPI PON WAN
endef
TARGET_DEVICES += PRX321_SFU_QSPI_PON

define Device/PRX321_SFU_QSPI_ETH
  $(Device/PRX_ETH)
  DEVICE_DTS := prx321-sfu-qspi-eth
  DEVICE_TITLE := PRX321 SFU QSPI ETH WAN
endef
TARGET_DEVICES += PRX321_SFU_QSPI_ETH

define Device/PRX126_SFP_EVA_PON
  $(Device/PRX_SFP)
  FILESYSTEMS := squashfs initramfs
  DEVICE_DTS := prx126-sfp-eva-pon
  DEVICE_TITLE := PRX126 SFP EVA PON WAN
endef
TARGET_DEVICES += PRX126_SFP_EVA_PON

define Device/PRX126_SFP_EVA_ETH
  $(Device/PRX_ETH)
  FILESYSTEMS := squashfs Initramfs
  DEVICE_DTS := prx126-sfp-eva-eth
  DEVICE_TITLE := PRX126 SFP EVA ETH WAN
endef
TARGET_DEVICES += PRX126_SFP_EVA_ETH

define Device/PRX126_SFP_PON
  $(Device/PRX_SFP)
  DEVICE_DTS := prx126-sfp-pon
  DEVICE_TITLE := PRX126 SFP PON WAN
endef
TARGET_DEVICES += PRX126_SFP_PON

define Device/PRX321_SFU_QSPI_PON_FPGA
  $(Device/PRX_SFU)
  DEVICE_DTS := prx321-sfu-qspi-pon-fpga
  DEVICE_TITLE := PRX321 SFU QSPI PON FPGA
  DEVICE_PACKAGES += kmod-spi-intel_mips-grx500
endef
TARGET_DEVICES += PRX321_SFU_QSPI_PON_FPGA

define Device/PRX120_SFU_QSPI_PON
  $(Device/PRX_SFU)
  DEVICE_DTS := prx120-sfu-qspi-pon
  DEVICE_TITLE := PRX120 SFU QSPI PON WAN
endef
TARGET_DEVICES += PRX120_SFU_QSPI_PON

define Device/PRX321_GW_11AX
  $(Device/PRX_ETH)
  DEVICE_DTS := prx321-gw-11ax
  DEVICE_TITLE := PRX321 GW 11AX
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES += $(UGW_PACKAGES) $(WAV600_PACKAGES_UCI) $(WAV600_UGW_PACKAGES_UCI) \
			$(PON_BASE_PACKAGES) $(PON_DEBUG_PACKAGES) $(PON_HGU_PACKAGES) \
			$(DSL_CPE_GFAST_PACKAGES_PRX)$(DSL_CPE_GFAST_PACKAGES_DEBUG) \
			$(MPE_ACCEL_PACKAGES)
endef
TARGET_DEVICES += PRX321_GW_11AX

define Device/PRX321_HGU_PON_GFAST_11AX
  $(Device/PRX_ETH)
  DEVICE_DTS := prx321-hgu-pon-gfast-11ax
  DEVICE_TITLE := PRX321 HGU PON GFAST 11AX
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES += $(UGW_PACKAGES) $(WAV600_PACKAGES_UCI) $(WAV600_UGW_PACKAGES_UCI) \
			$(PON_BASE_PACKAGES) $(PON_DEBUG_PACKAGES) $(PON_HGU_PACKAGES) \
			$(DSL_CPE_GFAST_PACKAGES_PRX) $(DSL_CPE_GFAST_PACKAGES_DEBUG) \
			$(MPE_ACCEL_PACKAGES)
endef
TARGET_DEVICES += PRX321_HGU_PON_GFAST_11AX

define Device/PRX321_GW_ETH_GFAST_11AX
  $(Device/PRX_ETH)
  DEVICE_DTS := prx321-gw-eth-gfast-11ax
  DEVICE_TITLE := PRX321 GW GFAST 11AX ETH
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES += $(UGW_PACKAGES) $(WAV600_PACKAGES_UCI) $(WAV600_UGW_PACKAGES_UCI) \
			$(DSL_CPE_GFAST_PACKAGES_PRX) $(DSL_CPE_GFAST_PACKAGES_DEBUG)
endef
TARGET_DEVICES += PRX321_GW_ETH_GFAST_11AX

define Device/PRX321_GW_ETH_GFAST_11AX_SEC
  $(Device/PRX_GENERIC)
  $(Device/NAND)
  DEVICE_DTS := prx321-gw-eth-gfast-11ax
  DEVICE_TITLE := PRX321 GW GFAST 11AX ETH_SEC
  FAKED_ENV := $(FAKEROOT_CMD_PRX321_ETH)
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES += $(UGW_PACKAGES_SEC) $(WAV600_PACKAGES_UCI) $(WAV600_UGW_PACKAGES_UCI) \
			$(DSL_CPE_GFAST_PACKAGES_PRX) $(DSL_CPE_GFAST_PACKAGES_DEBUG) $(PRX_SDL_SYS_PACKAGES)
endef
TARGET_DEVICES += PRX321_GW_ETH_GFAST_11AX_SEC

define Device/PRX321_GW_11AX_SP_ETH_WAN_GPHY
  $(Device/PRX_ETH)
  DEVICE_DTS := prx321-gw-11ax-sp-eth-wan-gphy
  DEVICE_TITLE := PRX321 GW 11AX SP ETH WAN GPHY
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES += $(UGW_PACKAGES_SDL) $(WAV600_PACKAGES_UCI) $(WAV600_UGW_PACKAGES_UCI)
endef
TARGET_DEVICES += PRX321_GW_11AX_SP_ETH_WAN_GPHY

endif # end prx300

ifeq ($(SUBTARGET),prx300_4kec)

define Device/PRX300_bootcore
  $(Device/lantiqBootImage)
  IMAGE_SIZE := 16512k
  DEVICE_DTS := prx300-bootcore
  DEVICE_TITLE := PRX300 secure Bootcore image
  UIMAGE_NAME := MIPS 4Kec Bootcore
  KERNEL_LOADADDR := 0x88000000
  KERNEL_ENTRY := 0x88000000
endef
TARGET_DEVICES += PRX300_bootcore

define Device/PRX300_bootcore_debug
  $(Device/lantiqBootImage)
  IMAGE_SIZE := 16512k
  DEVICE_DTS := prx300-bootcore-debug
  DEVICE_TITLE := PRX300 secure Bootcore debug image
  UIMAGE_NAME := MIPS 4Kec Bootcore
  KERNEL_LOADADDR := 0x88000000
  KERNEL_ENTRY := 0x88000000
endef
TARGET_DEVICES += PRX300_bootcore_debug

endif # end prx300_4kec
