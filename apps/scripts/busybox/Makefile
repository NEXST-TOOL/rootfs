APP_NAME := busybox
REPO_PATH := ../../$(APP_NAME)

TARGET_FILE := $(INITRAMFS_ROOT)/bin/busybox

.PHONY: all clean

all: $(TARGET_FILE)

$(TARGET_FILE):
	$(MAKE) -C $(REPO_PATH) defconfig
	$(MAKE) -C $(REPO_PATH)
	$(MAKE) -C $(REPO_PATH) CONFIG_PREFIX=$(INITRAMFS_ROOT) install

clean:
	$(MAKE) -C $(REPO_PATH) clean
