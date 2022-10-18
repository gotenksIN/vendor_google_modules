#
# Copyright (C) 2022 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

# Configure APEX as updatable
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Mainline modules - APK type
PRODUCT_PACKAGES += \
    com.google.android.modulemetadata \
    DocumentsUIGoogle \
    CaptivePortalLoginGoogle \
    NetworkPermissionConfigGoogle \
    NetworkStackGoogle \
    com.google.mainline.telemetry

# Overlay packages for APK-type modules
PRODUCT_PACKAGES += \
    ModuleMetadataGoogleOverlay \
    GooglePermissionControllerOverlay \
    GooglePermissionControllerFrameworkOverlay \
    GoogleExtServicesConfigOverlay

# Mainline modules - APEX type
PRODUCT_PACKAGES += \
    com.google.android.tzdata4 \
    com.google.mainline.primary.libs

PRODUCT_COPY_FILES += \
    vendor/google/modules/build/google-staged-installer-whitelist.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/google-staged-installer-whitelist.xml \
    vendor/google/modules/build/google-rollback-package-whitelist.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/google-rollback-package-whitelist.xml 

PRODUCT_MAINLINE_SEPOLICY_DEV_CERTIFICATES=vendor/google/modules/certificates

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/apex/com.google.android.tzdata4.apex \
    system/apex/com.google.mainline.primary.libs.apex \
    system/priv-app/DocumentsUIGoogle/DocumentsUIGoogle.apk \
    system/priv-app/NetworkPermissionConfigGoogle/NetworkPermissionConfigGoogle.apk \
    system/priv-app/NetworkStackGoogle/NetworkStackGoogle.apk \
    system/app/CaptivePortalLoginGoogle/CaptivePortalLoginGoogle.apk \
    system/etc/permissions/GoogleCellBroadcast_permissions.xml \
    system/etc/permissions/GoogleDocumentsUI_permissions.xml \
    system/etc/permissions/GoogleExtServices_permissions.xml \
    system/etc/permissions/GoogleMediaProvider_permissions.xml \
    system/etc/permissions/GoogleNetworkStack_permissions.xml \
    system/etc/permissions/GooglePermissionController_permissions.xml \
    system/etc/permissions/GoogleTethering_permissions.xml \
    system/etc/sysconfig/preinstalled-packages-com.google.android.providers.media.module.xml

# Mainline modules - APEX type - Compressed
PRODUCT_PACKAGES += \
    com.google.android.adbd_trimmed_compressed \
	com.google.android.adservices_compressed \
    com.google.android.art_compressed \
    com.google.android.cellbroadcast_compressed \
    com.google.android.conscrypt_compressed \
    com.google.android.extservices_compressed \
    com.google.android.ipsec_compressed \
    com.google.android.media_compressed \
    com.google.android.media.swcodec_compressed \
    com.google.android.mediaprovider_compressed \
    com.google.android.neuralnetworks_compressed \
	com.google.android.ondevicepersonalization_compressed \
    com.google.android.os.statsd_compressed \
    com.google.android.permission_compressed \
    com.google.android.resolv_compressed \
    com.google.android.scheduling_compressed \
    com.google.android.sdkext_compressed \
    com.google.android.tethering_compressed

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/apex/com.google.android.adbd_trimmed_compressed.apex \
    system/apex/com.google.android.art_compressed.apex \
    system/apex/com.google.android.cellbroadcast_compressed.apex \
    system/apex/com.google.android.conscrypt_compressed.apex \
    system/apex/com.google.android.extservices_compressed.apex \
    system/apex/com.google.android.ipsec_compressed.apex \
    system/apex/com.google.android.media_compressed.apex \
    system/apex/com.google.android.media.swcodec_compressed.apex \
    system/apex/com.google.android.mediaprovider_compressed.apex \
    system/apex/com.google.android.neuralnetworks_compressed.apex \
    system/apex/com.google.android.os.statsd_compressed.apex \
    system/apex/com.google.android.permission_compressed.apex \
    system/apex/com.google.android.resolv_compressed.apex \
    system/apex/com.google.android.scheduling_compressed.apex \
    system/apex/com.google.android.sdkext_compressed.apex \
    system/apex/com.google.android.tethering_compressed.apex

# Optional Bluetooth Module
MAINLINE_INCLUDE_BT_MODULE ?= false
ifeq ($(MAINLINE_INCLUDE_WIFI_MODULE),true)
PRODUCT_PACKAGES += \
    com.google.android.bluetooth_compressed
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/apex/com.google.android.bluetooth_compressed.apex
endif

# Optional UWB Module
MAINLINE_INCLUDE_BT_MODULE ?= false
ifeq ($(MAINLINE_INCLUDE_WIFI_MODULE),true)
PRODUCT_PACKAGES += \
    com.google.android.uwb_compressed
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/apex/com.google.android.uwb_compressed.apex
endif

# Optional WiFi module
MAINLINE_INCLUDE_WIFI_MODULE ?= false
ifeq ($(MAINLINE_INCLUDE_WIFI_MODULE),true)
PRODUCT_PACKAGES += \
    com.google.android.wifi_compressed
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/apex/com.google.android.wifi_compressed.apex
endif
