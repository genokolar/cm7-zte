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

DEVICE_PACKAGE_OVERLAYS := device/zte/blade/overlay

# Discard inherited values and use our own instead.
PRODUCT_NAME := zte_blade
PRODUCT_DEVICE := blade
PRODUCT_MODEL := ZTE Blade
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
    gralloc.blade \
    copybit.blade \
    gps.blade \
    libOmxCore \
    libOmxVidEnc \
    dexpreopt

# proprietary side of the device
$(call inherit-product-if-exists, vendor/zte/blade/blade-vendor.mk)

DISABLE_DEXPREOPT := false

PRODUCT_COPY_FILES += \
    device/zte/blade/qwerty.kl:system/usr/keylayout/qwerty.kl

# fstab
PRODUCT_COPY_FILES += \
    device/zte/blade/vold.fstab:system/etc/vold.fstab

# Init
PRODUCT_COPY_FILES += \
    device/zte/blade/init.blade.rc:root/init.blade.rc \
    device/zte/blade/ueventd.blade.rc:root/ueventd.blade.rc

# Audio
PRODUCT_COPY_FILES += \
    device/zte/blade/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/zte/blade/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

# WLAN + BT
PRODUCT_COPY_FILES += \
    device/zte/blade/init.bt.sh:system/etc/init.bt.sh \
    device/zte/blade/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/zte/blade/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/zte/blade/prebuilt/hostapd:system/bin/hostapd \
    device/zte/blade/prebuilt/hostapd.conf:system/etc/wifi/hostapd.conf

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

#system patch
PRODUCT_COPY_FILES += \
    device/zte/blade/system/bin/dexopt-wrapper:system/bin/dexopt-wrapper \
    device/zte/blade/system/app/RootExplorer.apk:system/app/RootExplorer.apk \
    device/zte/blade/system/app/SystemInfoPro.apk:system/app/SystemInfoPro.apk \
    device/zte/blade/system/etc/apns-conf.xml:system/etc/apns-conf.xml \
    device/zte/blade/system/etc/enhanced.conf:system/etc/enhanced.conf \
    device/zte/blade/system/etc/gps.conf:system/etc/gps.conf \


# Geno script
PRODUCT_COPY_FILES += \
    device/zte/blade/ramdisk/sbin/geno:root/sbin/geno \
    device/zte/blade/ramdisk/sbin/odex:root/sbin/odex \
    device/zte/blade/ramdisk/sbin/timing:root/sbin/timing \
    device/zte/blade/ramdisk/sbin/gk/1-app2sd.sh:root/sbin/gk/1-app2sd.sh \
    device/zte/blade/ramdisk/sbin/gk/2-data2ext.sh:root/sbin/gk/2-data2ext.sh \
    device/zte/blade/ramdisk/sbin/gk/3-swap.sh:root/sbin/gk/3-swap.sh \
    device/zte/blade/ramdisk/sbin/gk/4-optimize.sh:root/sbin/gk/4-optimize.sh \
    device/zte/blade/ramdisk/sbin/gk/5-backup.sh:root/sbin/gk/5-backup.sh \
    device/zte/blade/ramdisk/sbin/gk/6-restore.sh:root/sbin/gk/6-restore.sh \
    device/zte/blade/ramdisk/sbin/gk/readme.txt:root/sbin/gk/readme.txt

# LOGO
PRODUCT_COPY_FILES += \
    device/zte/raise/ramdisk/initlogo.rle:root/initlogo.rle

#Kernel Modules
PRODUCT_COPY_FILES += \
    device/zte/blade/prebuilt/ar6000.ko:system/wifi/ar6000.ko \
    device/zte/blade/prebuilt/zram.ko:system/lib/modules/2.6.32.9-perf/zram.ko \

#WiFi firmware
PRODUCT_COPY_FILES += \
    device/zte/blade/firmware/regcode:system/wifi/regcode \
    device/zte/blade/firmware/data.patch.hw2_0.bin:system/wifi/data.patch.hw2_0.bin \
    device/zte/blade/firmware/athwlan.bin.z77:system/wifi/athwlan.bin.z77 \
    device/zte/blade/firmware/athtcmd_ram.bin:system/wifi/athtcmd_ram.bin

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
    ro.sf.lcd_density=240 \
    ro.sf.hwrotation=180 \
    persist.sys.language=zh \
    persist.sys.country=CN \
    persist.sys.timezone=Asia/Shanghai

# Blade uses high-density artwork where available
PRODUCT_LOCALES += hdpi

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# This should not be needed but on-screen keyboard uses the wrong density without it.
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.sf.lcd_density=240 

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
    dalvik.vm.heapsize=32m \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.dexopt-data-only=1 \
    ro.opengles.version=131072  \
    ro.compcache.default=0

