#
# Copyright (C) 2017-2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/xiaomi/mithorium-common

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Build
BUILD_BROKEN_DUP_RULES := true

# Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 androidboot.bootdevice=7824900.sdhci loop.max_part=7
BOARD_KERNEL_CMDLINE += console=ttyMSM0,115200,n8 androidboot.console=ttyMSM0 earlycon=msm_serial_dm,0x78af000
BOARD_KERNEL_CMDLINE += androidboot.usbconfigfs=true
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_PAGESIZE :=  2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100
TARGET_KERNEL_VERSION := 4.9
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_ADDITIONAL_FLAGS := LLVM=1

# ANT
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Audio
BOARD_USES_ALSA_AUDIO := true
USE_XML_AUDIO_POLICY_CONF := 1
BOARD_SUPPORTS_SOUND_TRIGGER := true
AUDIO_USE_DEEP_AS_PRIMARY_OUTPUT := false
AUDIO_FEATURE_ENABLED_HIFI_AUDIO := true
AUDIO_FEATURE_ENABLED_VBAT_MONITOR := true
AUDIO_FEATURE_ENABLED_NT_PAUSE_TIMEOUT := true
AUDIO_FEATURE_ENABLED_ANC_HEADSET := true
AUDIO_FEATURE_ENABLED_CUSTOMSTEREO := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_HDMI_EDID := true
AUDIO_FEATURE_ENABLED_EXT_HDMI := false
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_INCALL_MUSIC := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_ENABLED_SPKR_PROTECTION := true
AUDIO_FEATURE_ENABLED_ACDB_LICENSE := true
AUDIO_FEATURE_ENABLED_DEV_ARBI := false
MM_AUDIO_ENABLED_FTM := true
TARGET_USES_QCOM_MM_AUDIO := true
AUDIO_FEATURE_ENABLED_SOURCE_TRACKING := true
BOARD_SUPPORTS_QAHW := false
AUDIO_FEATURE_ENABLED_DYNAMIC_LOG := false
AUDIO_FEATURE_ENABLED_SND_MONITOR := true
AUDIO_FEATURE_ENABLED_SVA_MULTI_STAGE := true
AUDIO_FEATURE_ENABLED_DLKM := false

# Bootloader
ifeq ($(TARGET_BOARD_PLATFORM),msm8953)
TARGET_BOOTLOADER_BOARD_NAME := MSM8953
else
TARGET_BOOTLOADER_BOARD_NAME := MSM8937
endif
TARGET_NO_BOOTLOADER := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(COMMON_PATH)/bluetooth

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_USES_QTI_CAMERA_DEVICE := true
BOARD_QTI_CAMERA_32BIT_ONLY := true
TARGET_TS_MAKEUP := true

# Display
TARGET_USES_ION := true
TARGET_USES_GRALLOC1 := true
TARGET_USES_HWC2 := true
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# FM
BOARD_HAVE_QCOM_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
LOC_HIDL_VERSION := 4.0

# Filesystem
TARGET_FS_CONFIG_GEN := $(COMMON_PATH)/config.fs

# HIDL
DEVICE_MANIFEST_FILE := $(COMMON_PATH)/manifest.xml
ifneq ($(TARGET_HAS_NO_CONSUMERIR),true)
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/configs/manifest/consumerir.xml
endif
ifneq ($(TARGET_EXCLUDE_CRYPTFSHW),true)
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/configs/manifest/cryptfshw.xml
endif
ifneq ($(TARGET_USES_DEVICE_SPECIFIC_GATEKEEPER),true)
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/configs/manifest/gatekeeper.xml
endif
ifneq ($(TARGET_USES_DEVICE_SPECIFIC_KEYMASTER),true)
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/configs/manifest/keymaster.xml
endif
DEVICE_MATRIX_FILE := $(COMMON_PATH)/compatibility_matrix.xml

# HW crypto
ifneq ($(TARGET_EXCLUDE_CRYPTFSHW),true)
TARGET_HW_DISK_ENCRYPTION := true
endif

# Init
TARGET_INIT_VENDOR_LIB ?= //$(COMMON_PATH):init_xiaomi_mithorium
TARGET_RECOVERY_DEVICE_MODULES ?= init_xiaomi_mithorium

# Partitions
TARGET_COPY_OUT_VENDOR := vendor
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_ROOT_EXTRA_SYMLINKS := \
    /vendor/dsp:/dsp \
    /vendor/firmware_mnt:/firmware \
    /mnt/vendor/persist:/persist

# Power
TARGET_USES_INTERACTION_BOOST := true

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_ENFORCE_QSSI := true

# Properties
TARGET_ODM_PROP += $(COMMON_PATH)/odm.prop
TARGET_SYSTEM_PROP += $(COMMON_PATH)/system.prop
TARGET_SYSTEM_EXT_PROP += $(COMMON_PATH)/system_ext.prop
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor.prop

# Recovery
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# SELinux
include device/qcom/sepolicy-legacy-um/SEPolicy.mk
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(COMMON_PATH)/sepolicy/private
BOARD_VENDOR_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/vendor
ifeq (true,$(call math_lt,$(PRODUCT_SHIPPING_API_LEVEL),28))
BOARD_VENDOR_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/legacy/vendor
endif

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true
BOARD_VNDK_VERSION := current

# Wi-Fi
BOARD_HAS_QCOM_WLAN := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
PRODUCT_VENDOR_MOVE_ENABLED := true
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_AVOID_IFACE_RESET_MAC_CHANGE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Inherit from the proprietary version
include vendor/xiaomi/mithorium-common/BoardConfigVendor.mk
