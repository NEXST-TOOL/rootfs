APP_NAME := dhrystone
REPO_PATH := ../../$(APP_NAME)

TARGET_FILE := $(INITRAMFS_ROOT)/bin/dhrystone

.PHONY: all clean

all: $(TARGET_FILE)

$(TARGET_FILE):
	$(MAKE) -C $(REPO_PATH) 
	cp $(REPO_PATH)/dhrystone $(TARGET_FILE)

clean:
	$(MAKE) -C $(REPO_PATH) clean
