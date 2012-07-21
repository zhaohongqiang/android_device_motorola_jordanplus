# Copyright (C) 2011 The Android Open Source Project
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
# build for toro hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and toro, hence its name.
#

# Inherit from those products. Most specific first.
$(call inherit-product, device/moto/mb526/jordan.mk)
$(call inherit-product, vendor/motorola/jordan_plus/jordan-vendor.mk)

# copy all vendor (motorola) kernel modules to system/lib/modules
PRODUCT_COPY_FILES += $(shell test -d vendor/motorola/jordan_plus/lib/modules &&  \
	find vendor/motorola/jordan_plus/lib/modules -name '*.ko' \
	-printf '%p:system/lib/modules/%f ')


PRODUCT_NAME := full_jordan_plus
PRODUCT_DEVICE := jordan_plus
PRODUCT_BRAND := Android
PRODUCT_MODEL := MB526
PRODUCT_MANUFACTURER := motorola
