ifeq ($(SUBTARGET),xrx500)

define Device/AX3000_1600_VDSL35B_11AX_SEC
  $(Device/xrx500)
  DEVICE_DTS := easy350_anywan_axepoint
  DEVICE_TITLE := GRX350 1600 AXEPOINT 6X WAV600 VDSL35B Secure Gateway
  FAKED_ENV := $(FAKEROOT_PROG)
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SEC) $(VOIP_PACKAGES_SEC) $(DECT_PACKAGES_SEC) $(WAV600_PACKAGES_UCI) $(WAV600_UGW_PACKAGES_UCI) $(UGW_PACKAGE_OVL_WHITELIST_SEC) \
                    $(DSL_CPE_UGW_PACKAGE) $(DSL_CPE_PACKAGES_R5) $(DSL_CPE_PACKAGES_RELEASE) \
                    $(AX_PACKAGES) $(COMMON_USER_FEATURES_PACKAGES)
endef
TARGET_DEVICES += AX3000_1600_VDSL35B_11AX_SEC

define Device/AX3000_1600_VDSL35B_11AX_SEC_DEBUG
  $(Device/xrx500)
  DEVICE_DTS := easy350_anywan_axepoint
  DEVICE_TITLE := GRX350 1600 AXEPOINT 6X WAV600 VDSL35B Debug Secure Gateway
  FAKED_ENV := $(FAKEROOT_PROG)
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SEC) $(UGW_PACKAGES_SEC_DEBUG) $(VOIP_PACKAGES_SEC) $(DECT_PACKAGES_SEC) $(DECT_PACKAGES_SEC_DEBUG) \
                    $(WAV600_PACKAGES_UCI) $(WAV600_PACKAGES_UCI_DEBUG) $(WAV600_UGW_PACKAGES_UCI_DEBUG) \
                    $(DSL_CPE_UGW_PACKAGE) $(DSL_CPE_PACKAGES_R5) $(DSL_CPE_PACKAGES_DEBUG) \
                    $(AX_PACKAGES) $(COMMON_USER_FEATURES_PACKAGES)
endef
TARGET_DEVICES += AX3000_1600_VDSL35B_11AX_SEC_DEBUG

define Device/AX3000_1600_ETH_11AX_SEC
  $(Device/xrx500)
  DEVICE_DTS := easy350_anywan_axepoint_rt
  DEVICE_TITLE := GRX350 1600 AXEPOINT 6X WAV600 Ethernet Secure Router
  FAKED_ENV := $(FAKEROOT_PROG)
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SEC) $(WAV600_PACKAGES_UCI) $(WAV600_UGW_PACKAGES_UCI) $(UGW_PACKAGE_OVL_WHITELIST_SEC) $(COMMON_USER_FEATURES_PACKAGES) $(AX_PACKAGES)
endef
TARGET_DEVICES += AX3000_1600_ETH_11AX_SEC

define Device/AX3000_1600_ETH_11AX_SEC_DEBUG
  $(Device/xrx500)
  DEVICE_DTS := easy350_anywan_axepoint_rt
  DEVICE_TITLE := GRX350 1600 AXEPOINT 6X WAV600 Ethernet Debug Secure Router
  FAKED_ENV := $(FAKEROOT_PROG)
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SEC) $(UGW_PACKAGES_SEC_DEBUG) $(WAV600_PACKAGES_UCI_DEBUG) $(WAV600_UGW_PACKAGES_UCI_DEBUG) $(RT_PACKAGES_DEBUG) $(COMMON_USER_FEATURES_PACKAGES) $(AX_PACKAGES)

endef
TARGET_DEVICES += AX3000_1600_ETH_11AX_SEC_DEBUG

define Device/AX6000_2000_ETH_11AX_SEC
  $(Device/xrx500)
  DEVICE_DTS := easy550_anywan_axepoint_rt
  DEVICE_TITLE := GRX550 2000 AXEPOINT 6X WAV600 Ethernet Secure Router
  FAKED_ENV := $(FAKEROOT_PROG)
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SEC) $(WAV600_PACKAGES_UCI) $(WAV600_UGW_PACKAGES_UCI) $(UGW_PACKAGE_OVL_WHITELIST_SEC) $(AX_PACKAGES)
endef
TARGET_DEVICES += AX6000_2000_ETH_11AX_SEC

define Device/AX6000_2000_ETH_11AX_SEC_DEBUG
  $(Device/xrx500)
  DEVICE_DTS := easy550_anywan_axepoint_rt
  DEVICE_TITLE := GRX550 2000 AXEPOINT 6X WAV600 Ethernet Debug Secure Router
  FAKED_ENV := $(FAKEROOT_PROG)
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SEC) $(UGW_PACKAGES_SEC_DEBUG) $(WAV600_PACKAGES_UCI) $(WAV600_UGW_PACKAGES_UCI) $(WAV600_UGW_PACKAGES_UCI) $(WAV600_PACKAGES_UCI_DEBUG) $(WAV600_UGW_PACKAGES_UCI_DEBUG) $(AX_PACKAGES)
endef
TARGET_DEVICES += AX6000_2000_ETH_11AX_SEC_DEBUG

define Device/AX6000_2000_VDSL35B_11AX_SEC
  $(Device/xrx500)
  DEVICE_DTS := easy550_anywan_axepoint
  DEVICE_TITLE := GRX550 2000 AXEPOINT 6X WAV600 VDSL35B Secure Gateway
  FAKED_ENV := $(FAKEROOT_PROG)
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SEC) $(VOIP_PACKAGES_SEC) $(DECT_PACKAGES_SEC) $(WAV600_PACKAGES_UCI) $(WAV600_UGW_PACKAGES_UCI) $(UGW_PACKAGE_OVL_WHITELIST_SEC) \
                    $(DSL_CPE_UGW_PACKAGE) $(DSL_CPE_PACKAGES_R5) $(DSL_CPE_PACKAGES_RELEASE) $(AX_PACKAGES)
endef
TARGET_DEVICES += AX6000_2000_VDSL35B_11AX_SEC

define Device/AX6000_2000_VDSL35B_11AX_SEC_DEBUG
  $(Device/xrx500)
  DEVICE_DTS := easy550_anywan_axepoint
  DEVICE_TITLE := GRX550 2000 AXEPOINT 6X WAV600 VDSL35B Debug Secure Gateway
  FAKED_ENV := $(FAKEROOT_PROG)
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SEC) $(UGW_PACKAGES_SEC_DEBUG) $(DSL_CPE_UGW_PACKAGE) $(DSL_CPE_PACKAGES_R5) $(DSL_CPE_PACKAGES_DEBUG) $(VOIP_PACKAGES_SEC) \
                    $(DECT_PACKAGES_SEC) $(DECT_PACKAGES_SEC_DEBUG) $(WAV600_PACKAGES_UCI) $(WAV600_UGW_PACKAGES_UCI) $(AX_PACKAGES) $(WAV600_PACKAGES_UCI_DEBUG) $(WAV600_UGW_PACKAGES_UCI_DEBUG)
endef
TARGET_DEVICES += AX6000_2000_VDSL35B_11AX_SEC_DEBUG

define Device/AX6000_2000_GFAST_11AX_SEC
  $(Device/xrx500)
  DEVICE_DTS := easy550_anywan_axepoint
  DEVICE_TITLE := GRX550 2000 AXEPOINT 6X WAV600 G.Fast Secure Gateway
  FAKED_ENV := $(FAKEROOT_PROG)
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SEC) $(VOIP_PACKAGES_SEC) $(DECT_PACKAGES_SEC) $(WAV600_PACKAGES_UCI) $(WAV600_UGW_PACKAGES_UCI) $(UGW_PACKAGE_OVL_WHITELIST_SEC) \
                    $(DSL_CPE_GFAST_PACKAGES) $(DSL_CPE_GFAST_PACKAGES_RELEASE) $(AX_PACKAGES) $(COMMON_USER_FEATURES_PACKAGES)
endef
TARGET_DEVICES += AX6000_2000_GFAST_11AX_SEC

define Device/AX6000_2000_GFAST_11AX_SEC_BND
  $(Device/xrx500)
  DEVICE_DTS := easy550_anywan_axepoint
  DEVICE_TITLE := GRX550 2000 AXEPOINT 6X WAV600 G.Fast bond Secure Gateway
  FAKED_ENV := $(FAKEROOT_PROG)
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SEC) $(VOIP_PACKAGES_SEC) $(DECT_PACKAGES_SEC) $(WAV600_PACKAGES_UCI) $(WAV600_UGW_PACKAGES_UCI) $(DSL_CPE_GFAST_PACKAGES) \
                    $(DSL_CPE_GFAST_PACKAGES_RELEASE_BND) $(AX_PACKAGES) $(COMMON_USER_FEATURES_PACKAGES)
endef
TARGET_DEVICES += AX6000_2000_GFAST_11AX_SEC_BND

define Device/AX6000_2000_GFAST_11AX_SEC_DEBUG
  $(Device/xrx500)
  DEVICE_DTS := easy550_anywan_axepoint
  DEVICE_TITLE := GRX550 2000 AXEPOINT 6X WAV600 G.Fast Debug Secure Gateway
  FAKED_ENV := $(FAKEROOT_PROG)
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SEC) $(UGW_PACKAGES_SEC_DEBUG) $(VOIP_PACKAGES_SEC) $(DSL_CPE_GFAST_PACKAGES) $(DSL_CPE_GFAST_PACKAGES_DEBUG) $(DECT_PACKAGES_SEC) $(DECT_PACKAGES_SEC_DEBUG) \
                    $(WAV600_PACKAGES_UCI) $(WAV600_UGW_PACKAGES_UCI) $(AX_PACKAGES) $(WAV600_PACKAGES_UCI_DEBUG) $(WAV600_UGW_PACKAGES_UCI_DEBUG) $(COMMON_USER_FEATURES_PACKAGES)
endef
TARGET_DEVICES += AX6000_2000_GFAST_11AX_SEC_DEBUG

define Device/AX3000_1600_GFAST_11AX_SEC
  $(Device/xrx500)
  DEVICE_DTS := easy350_anywan_axepoint
  DEVICE_TITLE := GRX350 1600 AXEPOINT 6X WAV600 G.Fast Secure Gateway
  FAKED_ENV := $(FAKEROOT_PROG)
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SEC) $(VOIP_PACKAGES_SEC) $(DECT_PACKAGES_SEC) $(WAV600_PACKAGES_UCI) $(WAV600_UGW_PACKAGES_UCI) $(UGW_PACKAGE_OVL_WHITELIST_SEC) \
                    $(DSL_CPE_GFAST_PACKAGES) $(DSL_CPE_GFAST_PACKAGES_RELEASE) $(AX_PACKAGES) $(COMMON_USER_FEATURES_PACKAGES)
endef
TARGET_DEVICES += AX3000_1600_GFAST_11AX_SEC

define Device/AX3000_1600_GFAST_11AX_SEC_BND
  $(Device/xrx500)
  DEVICE_DTS := easy350_anywan_axepoint
  DEVICE_TITLE := GRX350 1600 AXEPOINT 6X WAV600 G.Fast bond Secure Gateway
  FAKED_ENV := $(FAKEROOT_PROG)
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SEC) $(VOIP_PACKAGES_SEC) $(DECT_PACKAGES_SEC) $(WAV600_PACKAGES_UCI) $(WAV600_UGW_PACKAGES_UCI) $(DSL_CPE_GFAST_PACKAGES) \
                    $(DSL_CPE_GFAST_PACKAGES_RELEASE_BND) $(AX_PACKAGES) $(COMMON_USER_FEATURES_PACKAGES)
endef
TARGET_DEVICES += AX3000_1600_GFAST_11AX_SEC_BND

define Device/AX3000_1600_GFAST_11AX_SEC_DEBUG
  $(Device/xrx500)
  DEVICE_DTS := easy350_anywan_axepoint
  DEVICE_TITLE := GRX350 1600 AXEPOINT 6X WAV600 G.Fast Debug Secure Gateway
  FAKED_ENV := $(FAKEROOT_PROG)
  ROOTFS_PREPARE := add-servicelayer-schema
  DEVICE_PACKAGES := $(UGW_PACKAGES_SEC) $(UGW_PACKAGES_SEC_DEBUG) $(VOIP_PACKAGES_SEC) $(DSL_CPE_GFAST_PACKAGES) $(DSL_CPE_GFAST_PACKAGES_DEBUG) $(DECT_PACKAGES_SEC) \
                    $(DECT_PACKAGES_SEC_DEBUG) $(WAV600_PACKAGES_UCI_DEBUG) $(WAV600_UGW_PACKAGES_UCI_DEBUG) $(AX_PACKAGES) $(COMMON_USER_FEATURES_PACKAGES)
endef
TARGET_DEVICES += AX3000_1600_GFAST_11AX_SEC_DEBUG

endif
