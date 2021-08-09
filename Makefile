#############################################################################
## Customizable Section: adapt those variables to suit your program.
##==========================================================================
include ../config.mak
include $(SDK_DIR)/base.mak

RPATH            := ../..
GROUPNAME        :=
PROJECTNAME      := libqrencode
INCLUDEDIR       := -I../../../../framecore/poco/linux/${ARCHTAG}/include \
					-I../../../../include \
					-I$(SDK_DIR)/sample/libqrencode/ \
					-I../../../../common

ifeq (YES, ${USE_HS_SDK})
INCLUDEDIR += -I$(HI_INCLUDE_DIR)
INCLUDEDIR += -I$(MSP_DIR)/api/higo/include
INCLUDEDIR += -I$(SDK_DIR)/sample/common/
LDFLAGS := -L$(HI_SHARED_LIB_DIR) -L$(HI_EXTERN_LIB_DIR) -L$(HI_LIBS) -DUSE_HS_SDK -leffect -lhigo -lhi_charsetMgr -lplayer -lsubdec -lhiplayer_utils -lhi_common -lhi_msp -lfreetype -lharfbuzz -lhi_so -ljpeg -lhigo -lhigoadp
CODE_SRC  = /media/disk1/disk2/HiSTBLinuxV100R005C00SPC060_update/sample/libqrencode/qrencode.c \
            /media/disk1/disk2/HiSTBLinuxV100R005C00SPC060_update/sample/libqrencode/qrinput.c \
            /media/disk1/disk2/HiSTBLinuxV100R005C00SPC060_update/sample/libqrencode/bitstream.c \
            /media/disk1/disk2/HiSTBLinuxV100R005C00SPC060_update/sample/libqrencode/qrspec.c \
            /media/disk1/disk2/HiSTBLinuxV100R005C00SPC060_update/sample/libqrencode/rsecc.c \
            /media/disk1/disk2/HiSTBLinuxV100R005C00SPC060_update/sample/libqrencode/split.c \
            /media/disk1/disk2/HiSTBLinuxV100R005C00SPC060_update/sample/libqrencode/mask.c \
            /media/disk1/disk2/HiSTBLinuxV100R005C00SPC060_update/sample/libqrencode/mqrspec.c \
            /media/disk1/disk2/HiSTBLinuxV100R005C00SPC060_update/sample/libqrencode/mmask.c
             



endif

LDFLAGS += -L../../../../framecore/poco/linux/${ARCHTAG}/lib -L../../../../lib/linux/${ARCHTAG} -L../../../../third/mdns/linux/bin/${ARCHTAG} -L../../../../third/airplay/linux/lib/${ARCHTAG} \
 -lstdc++ -lpthread -lm -lrt -ldl -L$(HI_LIBS) -leffect -lcutils -lutils -llog -lpng -lcrypto

OUTPUT   = /media/disk1/disk2/HiSTBLinuxV100R005C00SPC060_update/out/hi3716mv430/hi3716mv430_dmd_dongle_loader/lib/share/${PROJECTNAME}.so

SHELL   = /bin/sh
all :
	$(CC) -g -rdynamic -funwind-tables $(CODE_SRC) $(INCLUDEDIR) $(LDFLAGS) $(CFLAGS) -shared -fPIC -o $(OUTPUT)

clean:
	rm -f $(OUTPUT)
