# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS := device/zte/raise/overlay

# Discard inherited values and use our own instead.
PRODUCT_NAME := zte_raise
PRODUCT_DEVICE := raise
PRODUCT_MODEL := ZTE raise
PRODUCT_LOCALES := zh_CN en_US

PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni \
    Gallery3d \
    SpareParts \
    Term \
    gralloc.raise \
    copybit.raise \
    gps.raise \
    libOmxCore \
    libOmxVidEnc \
    dexpreopt

# proprietary side of the device
$(call inherit-product-if-exists, vendor/zte/raise/raise-vendor.mk)

DISABLE_DEXPREOPT := false


PRODUCT_COPY_FILES += \
    device/zte/raise/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/zte/raise/raise_keypad.kl:system/usr/keylayout/raise_keypad.kl

#system patch
PRODUCT_COPY_FILES += \
    device/zte/raise/system/bin/touch_to_key:system/bin/touch_to_key \
    device/zte/raise/system/bin/dexopt-wrapper:system/bin/dexopt-wrapper \
    device/zte/raise/system/app/RootExplorer.apk:system/app/RootExplorer.apk \
    device/zte/raise/system/app/SystemInfoPro.apk:system/app/SystemInfoPro.apk \
    device/zte/raise/system/etc/apns-conf.xml:system/etc/apns-conf.xml \
    device/zte/raise/system/etc/enhanced.conf:system/etc/enhanced.conf \
    device/zte/raise/system/etc/gps.conf:system/etc/gps.conf \
    device/zte/raise/system/lib/hw/copybit.raise.so:system/lib/hw/copybit.raise.so \
    device/zte/raise/system/lib/hw/gralloc.default.so:system/lib/hw/gralloc.default.so \
    device/zte/raise/system/lib/hw/gralloc.raise.so:system/lib/hw/gralloc.raise.so \
    device/zte/raise/system/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so \
    device/zte/raise/system/lib/hw/sensors.goldfish.so:system/lib/hw/sensors.goldfish.so \
    device/zte/raise/system/usr/keychars/raise_keypad.kcm.bin:system/usr/keychars/raise_keypad.kcm.bin

# prebuilt vold
PRODUCT_COPY_FILES += \
    device/zte/raise/vold.fstab:system/etc/vold.fstab

# Init
PRODUCT_COPY_FILES += \
    device/zte/raise/ramdisk/init.raise.rc:root/init.raise.rc \
    device/zte/raise/ramdisk/ueventd.raise.rc:root/ueventd.raise.rc

# LOGO
PRODUCT_COPY_FILES += \
    device/zte/raise/ramdisk/initlogo.rle:root/initlogo.rle

# Geno script
PRODUCT_COPY_FILES += \
    device/zte/raise/ramdisk/sbin/geno:root/sbin/geno \
    device/zte/raise/ramdisk/sbin/odex:root/sbin/odex \
    device/zte/raise/ramdisk/sbin/timing:root/sbin/timing \
    device/zte/raise/ramdisk/sbin/gk/1-app2sd.sh:root/sbin/gk/1-app2sd.sh \
    device/zte/raise/ramdisk/sbin/gk/2-data2ext.sh:root/sbin/gk/2-data2ext.sh \
    device/zte/raise/ramdisk/sbin/gk/3-swap.sh:root/sbin/gk/3-swap.sh \
    device/zte/raise/ramdisk/sbin/gk/4-optimize.sh:root/sbin/gk/4-optimize.sh \
    device/zte/raise/ramdisk/sbin/gk/5-backup.sh:root/sbin/gk/5-backup.sh \
    device/zte/raise/ramdisk/sbin/gk/6-restore.sh:root/sbin/gk/6-restore.sh \
    device/zte/raise/ramdisk/sbin/gk/readme.txt:root/sbin/gk/readme.txt

# Audio
PRODUCT_COPY_FILES += \
    device/zte/raise/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/zte/raise/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

# WLAN + BT
PRODUCT_COPY_FILES += \
    device/zte/raise/init.bt.sh:system/etc/init.bt.sh \
    device/zte/raise/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/zte/raise/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \

#Kernel Modules
PRODUCT_COPY_FILES += \
    device/zte/raise/prebuilt/zram.ko:system/lib/modules/2.6.32.9-perf/zram.ko \
    device/zte/raise/prebuilt/ar6000.ko:system/wifi/ar6000.ko \
    device/zte/raise/prebuilt/hostapd:system/bin/hostapd \
    device/zte/raise/prebuilt/hostapd.conf:system/etc/wifi/hostapd.conf

PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.media.dec.jpeg.memcap=10000000

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-1.so \
    rild.libargs=-d /dev/smd0 \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=120 \
    ro.sf.hwrotation=0 \
    debug.sf.hw=0 \
    persist.sys.language=zh \
    persist.sys.country=CN \
    persist.sys.timezone=Asia/Shanghai

# raise uses mide-density artwork where available
PRODUCT_LOCALES += mdpi ldpi

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# This should not be needed but on-screen keyboard uses the wrong density without it.
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.sf.lcd_density=120 

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.ril.hsxpa=2 \
    ro.ril.gprsclass=10 \
    ro.build.baseband_version=P729BB01 \
    ro.telephony.default_network=0 \
    ro.telephony.call_ring.multiple=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.jpeg.memcap=20000000 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.heapsize=24m \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.dexopt-data-only=1 \
    ro.opengles.version=131072  \
    ro.compcache.default=0

