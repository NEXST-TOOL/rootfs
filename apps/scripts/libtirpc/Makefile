APP_NAME := libtirpc
REPO_PATH := ../../$(APP_NAME)

TARGET_FILE := $(INITRAMFS_ROOT)/lib/libtirpc.so

CC = $(CROSS_COMPILE)gcc
CXX = $(CROSS_COMPILE)g++
LD = $(CROSS_COMPILE)ld

export CC
export CXX
export LD

.PHONY: all clean

all: $(TARGET_FILE)

$(TARGET_FILE):
	cd $(REPO_PATH) && \
		./configure --prefix=/ --host=riscv64-linux-gnu --disable-gssapi
	$(MAKE) -C $(REPO_PATH)
	$(MAKE) -C $(REPO_PATH) DESTDIR=$(INITRAMFS_ROOT) install

clean:
	$(MAKE) -C $(REPO_PATH) clean
