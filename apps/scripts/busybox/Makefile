APP_NAME := busybox
REPO_PATH := ../../$(APP_NAME)

.PHONY: all clean

all: $(REPO_PATH)/busybox

$(REPO_PATH)/busybox:
	$(MAKE) -C $(REPO_PATH) defconfig
	$(MAKE) -C $(REPO_PATH)

clean:
	$(MAKE) -C $(REPO_PATH) clean
