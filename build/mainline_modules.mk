#
# Copyright (C) 2022 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

ifneq (true,$(MODULE_BUILD_FROM_SOURCE))
ifeq ($(PLATFORM_SDK_VERSION),33)
    $(call inherit-product, vendor/google/modules/build/mainline_modules_t.mk)
endif
endif
