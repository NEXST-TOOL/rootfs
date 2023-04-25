APP_NAME := libtirpc
REPO_PATH := ../../$(APP_NAME)

TARGET_FILE := $(INITRAMFS_ROOT)/lib/libtirpc.so

.PHONY: all clean

all: $(TARGET_FILE)

$(TARGET_FILE):
	cd $(REPO_PATH) && ./configure --prefix=/ --host=riscv64-unknown-linux-gnu --disable-gssapi
	$(MAKE) -C $(REPO_PATH)
	$(MAKE) -C $(REPO_PATH) DESTDIR=$(INITRAMFS_ROOT) install

clean:
	$(MAKE) -C $(REPO_PATH) clean
