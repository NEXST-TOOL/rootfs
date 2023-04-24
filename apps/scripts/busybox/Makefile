APP_NAME := busybox
REPO_PATH := ../../$(APP_NAME)

.PHONY: all clean

all:
	$(MAKE) -C $(REPO_PATH) defconfig
	$(MAKE) -C $(REPO_PATH)
	$(MAKE) -C $(REPO_PATH) CONFIG_PREFIX=$(INITRD_PATH) install

clean:
	$(MAKE) -C $(REPO_PATH) clean
