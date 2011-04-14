# Inherit AOSP device configuration for raise.
$(call inherit-product, device/zte/raise/device_raise.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_raise
PRODUCT_BRAND := zte
PRODUCT_DEVICE := raise
PRODUCT_MODEL := raise
PRODUCT_MANUFACTURER := ZTE
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=cyanogen_raise BUILD_ID=FRG83 BUILD_DISPLAY_ID=CM7-2.3-Geno-Goapk BUILD_FINGERPRINT=google/passion/passion:2.3.3/Geno/102588:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.3 Geno 102588 release-keys"



# Extra overlay for LDPI
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/ldpi


#
# Set ro.modversion
#

ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7-$(shell date +%m%d%Y)-NIGHTLY-raise
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.0.0-raise
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.0.0-raise-Geno
    endif
endif


#
# Copy legend specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/ldpi/media/bootanimation.zip:system/media/bootanimation.zip
