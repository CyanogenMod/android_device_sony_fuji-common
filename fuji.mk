$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/sony/fuji-common/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Bootsplash
PRODUCT_COPY_FILES += \
   device/sony/fuji-common/prebuilt/logo_X.rle:root/logo.rle

# EGL config
PRODUCT_COPY_FILES += \
    device/sony/fuji-common/config/egl.cfg:system/lib/egl/egl.cfg

# Common Qualcomm scripts
PRODUCT_COPY_FILES += \
    device/sony/fuji-common/config/init.qcom.efs.sync.sh:system/etc/init.qcom.efs.sync.sh

# QCOM Display
PRODUCT_PACKAGES += \
    copybit.msm8660 \
    gralloc.msm8660 \
    hwcomposer.msm8660 \
    libgenlock \
    libhwcexternal \
    libhwcservice \
    libmemalloc \
    liboverlay \
    libqdutils \
    libtilerenderer

# NFC Support
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := device/sony/fuji-common/config/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := device/sony/fuji-common/config/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

# FM Radio
PRODUCT_PACKAGES += \
    FmRadioReceiver

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.stericsson.hardware.fm.receiver.xml:system/etc/permissions/com.stericsson.hardware.fm.receiver.xml

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio_policy.msm8660 \
    audio.primary.msm8660 \
    audio_policy.conf \
    libaudioutils

PRODUCT_COPY_FILES += \
    device/sony/fuji-common/config/media_codecs.xml:system/etc/media_codecs.xml

# Omx
PRODUCT_PACKAGES += \
    libdivxdrmdecrypt \
    libI420colorconvert \
    libmm-omxcore \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw \
    libstagefright_client

# GPS
PRODUCT_PACKAGES += \
    gps.msm8660

# Light
PRODUCT_PACKAGES += \
    lights.msm8660

# Power
PRODUCT_PACKAGES += \
    power.msm8660

# QRNGD
PRODUCT_PACKAGES += \
    qrngd

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Recovery
PRODUCT_PACKAGES += \
    extract_elf_ramdisk

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Custom init / uevent
PRODUCT_COPY_FILES += \
    device/sony/fuji-common/config/init.semc.rc:root/init.semc.rc \
    device/sony/fuji-common/config/init.fixbt.sh:system/etc/init.fixbt.sh \
    device/sony/fuji-common/config/ueventd.semc.rc:root/ueventd.semc.rc

# Post recovery script
PRODUCT_COPY_FILES += \
    device/sony/fuji-common/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

# CNE config
PRODUCT_COPY_FILES += \
   device/sony/fuji-common/config/OperatorPolicy.xml:system/etc/OperatorPolicy.xml \
   device/sony/fuji-common/config/UserPolicy.xml:system/etc/UserPolicy.xml

# Thermal monitor configuration
PRODUCT_COPY_FILES += \
    device/sony/fuji-common/config/thermald-semc.conf:system/etc/thermald-semc.conf

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=SonyQualcommRIL \
    ro.telephony.ril.v3=skippinpukcount \
    ro.telephony.call_ring.multiple=false \
    rild.libpath=/system/lib/libril-qc-qmi-1.so \
    rild.libargs=-d /dev/smd0 \
    persist.rild.nitz_plmn= \
    persist.rild.nitz_long_ons_0= \
    persist.rild.nitz_long_ons_1= \
    persist.rild.nitz_long_ons_2= \
    persist.rild.nitz_long_ons_3= \
    persist.rild.nitz_short_ons_0= \
    persist.rild.nitz_short_ons_1= \
    persist.rild.nitz_short_ons_2= \
    persist.rild.nitz_short_ons_3= \
    ril.subscription.types=NV,RUIM \
    DEVICE_PROVISIONED=1 \
    keyguard.no_require_sim=1 \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.use_data_netmgrd=true \
    ro.ril.transmitpower=true

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true \
    debug.sf.hw=1 \
    debug.enabletr=true \
    debug.composition.type=dyn \
    debug.mdpcomp.maxlayer=3 \
    debug.mdpcomp.logs=0 \
    ro.hwui.text_cache_width=2048

# QCOM CpuGovernorService
PRODUCT_PROPERTY_OVERRIDES += \
    dev.pm.dyn_samplingrate=1

# OpenGL ES
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=30

# ALS
PRODUCT_PROPERTY_OVERRIDES += \
   ro.hardware.respect_als=true
