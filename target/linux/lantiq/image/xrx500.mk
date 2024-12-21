ifeq ($(SUBTARGET),xrx500)

FAKEROOT_PROG:=$(if $(CONFIG_PACKAGE_ugw-fakeroot), \
	ALTPATH="$(STAGING_DIR_ROOT)" CONFFILE="$(STAGING_DIR_HOST)/share/fakeroot/fakeroot.conf" \
	fakeroot -- $(STAGING_DIR_HOST)/bin/fakeroot.sh)

define Device/xrx500
  $(Device/lantiqFullImage)
  $(Device/NAND)
  IMAGE_SIZE := 64512k
  KERNEL_LOADADDR := 0xa0020000
  KERNEL_ENTRY := 0xa0020000
  IMAGE_PREFIX := $$(DEVICE_NAME)
  IMAGE_UBOOT := grx500-mr-cpe
endef

define Device/GRX500_EVM_GFAST_DEBUG
  $(Device/xrx500)
  DEVICE_DTS := grx500_evm_gfast
  DEVICE_TITLE := GRX500 Evaluation Board GFAST Gateway
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES) $(DSL_CPE_GFAST_PACKAGES) $(DSL_CPE_GFAST_PACKAGES_DEBUG) $(WAV500_PACKAGES) $(WAV500_UGW_PACKAGES) $(VOIP_PACKAGES) $(DECT_PACKAGES) $(DEBUG_PACKAGES)
endef
TARGET_DEVICES += GRX500_EVM_GFAST_DEBUG

define Device/GRX500_EVM_VDSL35B_DEBUG
  $(Device/xrx500)
  DEVICE_DTS := grx500_evm_vdsl35b
  DEVICE_TITLE := GRX500 Evaluation Board VDSL35b Gateway
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES) $(DSL_CPE_UGW_PACKAGE) $(DSL_CPE_PACKAGES) $(DSL_CPE_PACKAGES_DEBUG) $(WAV500_PACKAGES) $(WAV500_UGW_PACKAGES) $(VOIP_PACKAGES) $(DECT_PACKAGES) $(DEBUG_PACKAGES)
endef
TARGET_DEVICES += GRX500_EVM_VDSL35B_DEBUG

define Device/GRX550_2000_VDSL35B_11AC
  $(Device/xrx500)
  DEVICE_DTS := easy550_anywan
  DEVICE_TITLE := GRX550 11AC Dual Band Wifi VDSL Gateway
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SDL) $(DSL_CPE_UGW_PACKAGE) $(DSL_CPE_PACKAGES) $(DSL_CPE_PACKAGES_RELEASE) $(WAV500_PACKAGES) $(WAV500_UGW_PACKAGES) $(VOIP_PACKAGES) $(DECT_PACKAGES)
endef
TARGET_DEVICES += GRX550_2000_VDSL35B_11AC

define Device/GRX550_2000_VDSL35B_11AC_SEC
  $(Device/xrx500)
  DEVICE_DTS := easy550_anywan
  DEVICE_TITLE := GRX550 11AC Dual Band Wifi VDSL Secure Gateway
  FAKED_ENV := $(FAKEROOT_PROG)
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SEC) $(VOIP_PACKAGES_SEC) $(DECT_PACKAGES_SEC) $(GRX_PACKAGES)
endef
TARGET_DEVICES += GRX550_2000_VDSL35B_11AC_SEC

define Device/GRX550_2000_VDSL35B_11AC_DEBUG
  $(Device/xrx500)
  DEVICE_DTS := easy550_anywan
  DEVICE_TITLE := GRX550 11AC Dual Band Wifi VDSL Gateway with Debug Tools
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES) $(UGW_PACKAGES_IOT) $(DSL_CPE_UGW_PACKAGE) $(DSL_CPE_PACKAGES) $(DSL_CPE_PACKAGES_DEBUG) $(WAV500_PACKAGES) $(WAV500_UGW_PACKAGES) $(DEBUG_PACKAGES)
endef
TARGET_DEVICES += GRX550_2000_VDSL35B_11AC_DEBUG

define Device/GRX550_2000_ETHWAN_11AC
  $(Device/xrx500)
  DEVICE_DTS := easy550_anywan
  DEVICE_TITLE := GRX550 11AC Dual Band Wifi Ethernet Gateway
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SDL) $(WAV500_PACKAGES) $(WAV500_UGW_PACKAGES)
endef
TARGET_DEVICES += GRX550_2000_ETHWAN_11AC

define Device/AX3000_1600_ETH_11AXUCI
  $(Device/xrx500)
  DEVICE_DTS := easy350_anywan_axepoint
  DEVICE_TITLE := GRX350 1600 AXEPOINT 6X WAV600 Ethernet Router UCI Model
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SDL) $(WAV600_PACKAGES_UCI) $(WAV600_UGW_PACKAGES_UCI)
endef
TARGET_DEVICES += AX3000_1600_ETH_11AXUCI

define Device/AX3000_1600_ETH_11AXUCI_ASURADA
  $(Device/xrx500)
  DEVICE_DTS := easy350_anywan_axepoint_asurada
  DEVICE_TITLE := GRX350 1600 AXEPOINT 6X WAV600 Ethernet Router UCI Model
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SDL) $(WAV600_PACKAGES_UCI) $(WAV600_UGW_PACKAGES_UCI)
endef
TARGET_DEVICES += AX3000_1600_ETH_11AXUCI_ASURADA

define Device/AX6000_2000_ETH_11AXUCI
  $(Device/xrx500)
  DEVICE_DTS := easy550_anywan_axepoint
  DEVICE_TITLE := GRX550 2000 AXEPOINT 6X WAV600 Ethernet Gateway UCI Model
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SDL) $(WAV600_PACKAGES_UCI) $(WAV600_UGW_PACKAGES_UCI)
endef
TARGET_DEVICES += AX6000_2000_ETH_11AXUCI

define Device/AX3000_1600_GFAST_11AXUCI
  $(Device/xrx500)
  DEVICE_DTS := easy350_anywan_axepoint
  DEVICE_TITLE := GRX350 1600 AXEPOINT 6X WAV600 G.Fast Gateway UCI Model
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SDL) $(WAV600_PACKAGES_UCI) $(WAV600_UGW_PACKAGES_UCI) $(DSL_CPE_GFAST_PACKAGES) $(DSL_CPE_GFAST_PACKAGES_DEBUG) $(VOIP_PACKAGES)
endef
TARGET_DEVICES += AX3000_1600_GFAST_11AXUCI

define Device/AX6000_2000_GFAST_11AXUCI
  $(Device/xrx500)
  DEVICE_DTS := easy550_anywan_axepoint
  DEVICE_TITLE := GRX550 2000 AXEPOINT 6X WAV600 G.Fast Gateway UCI Model
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SDL) $(WAV600_PACKAGES_UCI) $(WAV600_UGW_PACKAGES_UCI) $(DSL_CPE_GFAST_PACKAGES) $(DSL_CPE_GFAST_PACKAGES_DEBUG) $(VOIP_PACKAGES)
endef
TARGET_DEVICES += AX6000_2000_GFAST_11AXUCI

define Device/AX3000_1600_VDSL35B_11AXUCI
  $(Device/xrx500)
  DEVICE_DTS := easy350_anywan_axepoint
  DEVICE_TITLE := GRX350 1600 AXEPOINT 6X WAV600 VDSL35B Gateway UCI Model
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SDL) $(WAV600_PACKAGES_UCI) $(WAV600_UGW_PACKAGES_UCI) $(DSL_CPE_UGW_PACKAGE) $(DSL_CPE_PACKAGES_R5) $(DSL_CPE_PACKAGES_RELEASE) $(VOIP_PACKAGES)
endef
TARGET_DEVICES += AX3000_1600_VDSL35B_11AXUCI

define Device/AX6000_2000_VDSL35B_11AXUCI
  $(Device/xrx500)
  DEVICE_DTS := easy550_anywan_axepoint
  DEVICE_TITLE := GRX550 2000 AXEPOINT 6X WAV600 VDSL35B Gateway UCI Model
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SDL) $(WAV600_PACKAGES_UCI) $(WAV600_UGW_PACKAGES_UCI) $(DSL_CPE_UGW_PACKAGE) $(DSL_CPE_PACKAGES_R5) $(DSL_CPE_PACKAGES_RELEASE) $(VOIP_PACKAGES)
endef
TARGET_DEVICES += AX6000_2000_VDSL35B_11AXUCI

define Device/GRX550_2000_ETHWAN_11AC_OWRT
  $(Device/xrx500)
  DEVICE_DTS := easy550_anywan
  DEVICE_TITLE := GRX550 11AC Dual Band Wifi OpenWRT Ethernet Router
  FAKED_ENV := $(FAKEROOT_PROG)
  DEVICE_PACKAGES := $(OWRT_PACKAGES) $(DSL_CPE_PACKAGES) $(DSL_CPE_PACKAGES_RELEASE) $(WAV500_PACKAGES)
endef
TARGET_DEVICES += GRX550_2000_ETHWAN_11AC_OWRT

define Device/GRX550_2000_GFAST_11AC
  $(Device/xrx500)
  DEVICE_DTS := easy550_anywan
  DEVICE_TITLE := GRX550 11AC Dual Band Wifi G.Fast Gateway
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SDL) $(DSL_CPE_GFAST_PACKAGES) $(DSL_CPE_GFAST_PACKAGES_RELEASE) $(WAV500_PACKAGES) $(WAV500_UGW_PACKAGES) $(VOIP_PACKAGES) $(DECT_PACKAGES)
endef
TARGET_DEVICES += GRX550_2000_GFAST_11AC

define Device/GRX550_2000_GFAST_11AC_DEBUG
  $(Device/xrx500)
  DEVICE_DTS := easy550_anywan
  DEVICE_TITLE := GRX550 11AC Dual Band Wifi G.Fast Gateway with Debug Tools
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES) $(UGW_PACKAGES_IOT) $(DSL_CPE_GFAST_PACKAGES) $(DSL_CPE_GFAST_PACKAGES_DEBUG) $(WAV500_PACKAGES) $(WAV500_UGW_PACKAGES) $(VOIP_PACKAGES) $(DECT_PACKAGES) $(DEBUG_PACKAGES)
endef
TARGET_DEVICES += GRX550_2000_GFAST_11AC_DEBUG

define Device/GRX550_2000_GFAST_11AC_BND
  $(Device/xrx500)
  DEVICE_DTS := easy550_anywan
  DEVICE_TITLE := GRX550 11AC Dual Band Wifi G.Fast Gateway with Bonding
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SDL) $(DSL_CPE_GFAST_PACKAGES) $(DSL_CPE_GFAST_PACKAGES_RELEASE_BND) $(WAV500_PACKAGES) $(WAV500_UGW_PACKAGES) $(VOIP_PACKAGES) $(DECT_PACKAGES) 
endef
TARGET_DEVICES += GRX550_2000_GFAST_11AC_BND

define Device/GRX550_MR_GFAST_CO
  $(Device/xrx500)
  DEVICE_DTS := easy550_anywan
  DEVICE_TITLE := GRX550_MR_GFAST_CO
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SDL) $(DSL_CPE_GFAST_PACKAGES) $(DSL_CPE_GFAST_PACKAGES_DEBUG) $(GFAST_CO_PACKAGES) $(WAV500_PACKAGES) $(WAV500_UGW_PACKAGES) $(VOIP_PACKAGES) $(DECT_PACKAGES)
endef
TARGET_DEVICES += GRX550_MR_GFAST_CO

define Device/GRX550_2000_V1_VDSL35B_11AC
  $(Device/xrx500)
  DEVICE_DTS := easy550_V1_anywan
  DEVICE_TITLE := GRX550(v1) 11AC Dual Band Wifi VDSL Gateway
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SDL) $(DSL_CPE_UGW_PACKAGE) $(DSL_CPE_PACKAGES) $(DSL_CPE_PACKAGES_RELEASE) $(WAV500_PACKAGES) $(WAV500_UGW_PACKAGES) $(VOIP_PACKAGES) $(DECT_PACKAGES)
endef
TARGET_DEVICES += GRX550_2000_V1_VDSL35B_11AC

define Device/GRX550_2000_V1_ETHWAN_11AC_OWRT
  $(Device/xrx500)
  DEVICE_DTS := easy550_V1_anywan
  DEVICE_TITLE := GRX550(v1) 11AC Dual Band WiFi OpenWrt Ethernet Router
  DEVICE_PACKAGES := $(OWRT_PACKAGES) $(DSL_CPE_PACKAGES) $(DSL_CPE_PACKAGES_RELEASE) $(WAV500_PACKAGES)
endef
TARGET_DEVICES += GRX550_2000_V1_ETHWAN_11AC_OWRT

define Device/GRX350_1600_VDSL35B_11AC
  $(Device/xrx500)
  DEVICE_DTS := easy350_anywan
  DEVICE_TITLE := GRX350 11AC Dual Band Wifi VDSL Gateway
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SDL) $(DSL_CPE_UGW_PACKAGE) $(DSL_CPE_PACKAGES) $(DSL_CPE_PACKAGES_RELEASE) $(WAV500_PACKAGES) $(WAV500_UGW_PACKAGES) $(VOIP_PACKAGES) $(DECT_PACKAGES) 
endef
TARGET_DEVICES += GRX350_1600_VDSL35B_11AC

define Device/GRX350_1600_GFAST_11AC
  $(Device/xrx500)
  DEVICE_DTS := easy350_anywan
  DEVICE_TITLE := GRX350 11AC Dual Band Wifi G.Fast Gateway
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SDL) $(DSL_CPE_GFAST_PACKAGES) $(DSL_CPE_GFAST_PACKAGES_DEBUG) $(WAV500_PACKAGES) $(WAV500_UGW_PACKAGES) 
endef
TARGET_DEVICES += GRX350_1600_GFAST_11AC

define Device/GRX350_1200_VDSL35B_11AC
  $(Device/xrx500)
  DEVICE_DTS := easy350_anywan_600m
  DEVICE_TITLE := GRX350-1200 11AC Dual Band Wifi VDSL Gateway
  ROOTFS_PREPARE := add-servicelayer-schema
  IMAGE_UBOOT := grx350-1200-mr-cpe
  DEVICE_PACKAGES := $(UGW_PACKAGES_SDL) $(DSL_CPE_UGW_PACKAGE) $(DSL_CPE_PACKAGES) $(DSL_CPE_PACKAGES_RELEASE) $(WAV500_PACKAGES) $(WAV500_UGW_PACKAGES) $(VOIP_PACKAGES) $(DECT_PACKAGES)
endef
TARGET_DEVICES += GRX350_1200_VDSL35B_11AC

define Device/GRX350_1600_ETHWAN_11AC_OWRT
  $(Device/xrx500)
  DEVICE_DTS := easy350_anywan
  DEVICE_TITLE := GRX350 11AC Dual Band Wifi OpenWRT Ethernet Router
  DEVICE_PACKAGES := $(OWRT_PACKAGES) $(WAV500_PACKAGES)
endef
TARGET_DEVICES += GRX350_1600_ETHWAN_11AC_OWRT

define Device/GRX350_1600_V1_VDSL35B_11AC
  $(Device/xrx500)
  DEVICE_DTS := easy350_V1_anywan
  DEVICE_TITLE := GRX350(v1) 11AC Dual Band Wifi VDSL Gateway
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SDL) $(DSL_CPE_UGW_PACKAGE) $(DSL_CPE_PACKAGES) $(WAV500_PACKAGES) $(WAV500_UGW_PACKAGES) $(VOIP_PACKAGES) $(DECT_PACKAGES)
endef
TARGET_DEVICES += GRX350_1600_V1_VDSL35B_11AC

endif

ifeq ($(SUBTARGET),xrx500_4kec)

define Device/easy350550_bootcore
  $(Device/lantiqBootImage)
  IMAGE_SIZE := 16512k
  DEVICE_DTS := easy350550_bootcore
  DEVICE_TITLE := LANTIQ EASY350/550 ANYWAN BOOTCORE
  UIMAGE_NAME := MIPS 4Kec Bootcore
  KERNEL_LOADADDR := 0x88000000
  KERNEL_ENTRY := 0x88000000
endef
TARGET_DEVICES += easy350550_bootcore

endif