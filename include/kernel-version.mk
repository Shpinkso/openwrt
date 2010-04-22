# Use the default kernel version if the Makefile doesn't override it

ifeq ($(KERNEL),2.4)
  LINUX_VERSION?=2.4.37.9
endif
LINUX_RELEASE?=1

ifeq ($(LINUX_VERSION),2.4.37.9)
  LINUX_KERNEL_MD5SUM:=b85b8962840c13f17f944e7b1890f8f8
endif
ifeq ($(LINUX_VERSION),2.6.25.20)
  LINUX_KERNEL_MD5SUM:=0da698edccf03e2235abc2830a495114
endif
ifeq ($(LINUX_VERSION),2.6.30.10)
  LINUX_KERNEL_MD5SUM:=eb6be465f914275967a5602cb33662f5
endif
ifeq ($(LINUX_VERSION),2.6.31.12)
  LINUX_KERNEL_MD5SUM:=517be354b81b780e2f4b2ad614d030de
endif
ifeq ($(LINUX_VERSION),2.6.32.10)
  LINUX_KERNEL_MD5SUM:=5d996507ad482a3a8c8e6b2d48e7994b
endif
ifeq ($(LINUX_VERSION),2.6.32.11)
  LINUX_KERNEL_MD5SUM:=3709c691d909b4f8ca692edc6c726cb6
endif
ifeq ($(LINUX_VERSION),2.6.33.2)
  LINUX_KERNEL_MD5SUM:=80c5ff544b0ee4d9b5d8b8b89d4a0ef9
endif
ifeq ($(LINUX_VERSION),2.6.34-rc5)
  LINUX_KERNEL_MD5SUM:=c09ea93cd4e2684ebb506866c65a4c9f
endif

# disable the md5sum check for unknown kernel versions
LINUX_KERNEL_MD5SUM?=x

split_version=$(subst ., ,$(1))
merge_version=$(subst $(space),.,$(1))
KERNEL_BASE=$(firstword $(subst -, ,$(LINUX_VERSION)))
KERNEL=$(call merge_version,$(wordlist 1,2,$(call split_version,$(KERNEL_BASE))))
KERNEL_PATCHVER=$(call merge_version,$(wordlist 1,3,$(call split_version,$(KERNEL_BASE))))

