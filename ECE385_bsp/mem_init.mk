
#########################################################################
#######     M E M   I N I T    M A K E F I L E   C O N T E N T     ######
#########################################################################

#########################################################################
# This file is intended to be included by public.mk
#
#
# The following variables must be defined before including this file:
# - ELF
#
# The following variables may be defined to override the default behavior:
# - HDL_SIM_DIR
# - HDL_SIM_INSTALL_DIR
# - MEM_INIT_DIR
# - MEM_INIT_INSTALL_DIR
# - QUARTUS_PROJECT_DIR
# - SOPC_NAME
# - SIM_OPTIMIZE
# - RESET_ADDRESS
#
#########################################################################

ifeq ($(MEM_INIT_FILE),)
# MEM_INIT_FILE should be set equal to the working relative path to this
# mem_init.mk makefile fragment
MEM_INIT_FILE := $(wildcard $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST)))
endif

ifeq ($(ELF2DAT),)
ELF2DAT := elf2dat
endif

ifeq ($(ELF2HEX),)
ELF2HEX := elf2hex
endif

ifeq ($(ELF2FLASH),)
ELF2FLASH := elf2flash
endif

ifeq ($(FLASH2DAT),)
FLASH2DAT := flash2dat
endif

ifeq ($(ALT_FILE_CONVERT),)
ALT_FILE_CONVERT := alt-file-convert
endif

ifeq ($(NM),)
NM := nios2-elf-nm
endif

ifeq ($(MKDIR),)
MKDIR := mkdir -p
endif

ifeq ($(RM),)
RM := rm -f
endif

ifeq ($(CP),)
CP := cp
endif

ifeq ($(ECHO),)
ECHO := echo
endif

MEM_INIT_DIR ?= mem_init
HDL_SIM_DIR ?= $(MEM_INIT_DIR)/hdl_sim

ifdef QUARTUS_PROJECT_DIR
MEM_INIT_INSTALL_DIR ?= $(patsubst %/,%,$(QUARTUS_PROJECT_DIR))
ifdef SOPC_NAME
HDL_SIM_INSTALL_DIR ?= $(patsubst %/,%,$(QUARTUS_PROJECT_DIR))/$(SOPC_NAME)_sim
endif
endif

MEM_INIT_DESCRIPTOR_FILE ?= $(MEM_INIT_DIR)/meminit.spd

MEM_INIT_QIP_FILE ?= $(MEM_INIT_DIR)/meminit.qip

#-------------------------------------
# Default Flash Boot Loaders
#-------------------------------------

BOOT_LOADER_PATH ?= $(SOPC_KIT_NIOS2)/components/altera_nios2
BOOT_LOADER_CFI ?= $(BOOT_LOADER_PATH)/boot_loader_cfi.srec
BOOT_LOADER_CFI_BE ?= $(BOOT_LOADER_PATH)/boot_loader_cfi_be.srec


#-------------------------------------
# Default Target
#-------------------------------------

.PHONY: default_mem_init
ifeq ($(QSYS),1)
default_mem_init: mem_init_generate
else
default_mem_init: mem_init_install
endif
#-------------------------------------
# Runtime Macros
#-------------------------------------

define post-process-info
	@echo Post-processing to create $@...
endef

target_stem = $(notdir $(basename $@))

mem_start_address = $($(target_stem)_START)
mem_end_address = $($(target_stem)_END)
mem_span = $($(target_stem)_SPAN)
mem_width = $($(target_stem)_WIDTH)
mem_hex_width = $($(target_stem)_HEX_DATA_WIDTH)
mem_endianness = $($(target_stem)_ENDIANNESS)
mem_create_lanes = $($(target_stem)_CREATE_LANES)

mem_pad_flag = $($(target_stem)_PAD_FLAG)
mem_reloc_input_flag = $($(target_stem)_RELOC_INPUT_FLAG)
mem_no_zero_fill_flag = $($(target_stem)_NO_ZERO_FILL_FLAG)

flash_mem_epcs_flag = $($(target_stem)_EPCS_FLAGS)
flash_mem_cfi_flag = $($(target_stem)_CFI_FLAGS)
flash_mem_boot_loader_flag = $($(target_stem)_BOOT_LOADER_FLAG)

elf2dat_extra_args = $(mem_pad_flag)
elf2hex_extra_args = $(mem_no_zero_fill_flag)
elf2flash_extra_args = $(flash_mem_cfi_flag) $(flash_mem_epcs_flag) $(flash_mem_boot_loader_flag)
flash2dat_extra_args = $(mem_pad_flag) $(mem_reloc_input_flag)

#------------------------------------------------------------------------------
#                              BSP SPECIFIC CONTENT
#
# The content below is controlled by the BSP and SOPC System
#------------------------------------------------------------------------------
#START OF BSP SPECIFIC

#-------------------------------------
# Global Settings
#-------------------------------------


# The following TYPE comment allows tools to identify the 'type' of target this 
# makefile is associated with. 
# TYPE: BSP_MEMINIT_MAKEFILE

# This following VERSION comment indicates the version of the tool used to 
# generate this makefile. A makefile variable is provided for VERSION as well. 
# ACDS_VERSION: 18.1
ACDS_VERSION := 18.1

# This following BUILD_NUMBER comment indicates the build number of the tool 
# used to generate this makefile. 
# BUILD_NUMBER: 625

# Optimize for simulation
SIM_OPTIMIZE ?= 0

# The CPU reset address as needed by elf2flash
RESET_ADDRESS ?= 0x00420000

# The specific Nios II ELF file format to use.
NIOS2_ELF_FORMAT ?= elf32-littlenios2

#-------------------------------------
# Pre-Initialized Memory Descriptions
#-------------------------------------

# Memory: audio_mem
MEM_0 := ECE385_audio_mem
$(MEM_0)_NAME := audio_mem
$(MEM_0)_MEM_INIT_FILE_PARAM_NAME := INIT_FILE
HEX_FILES += $(MEM_INIT_DIR)/$(MEM_0).hex
MEM_INIT_INSTALL_FILES += $(MEM_INIT_INSTALL_DIR)/$(MEM_0).hex
DAT_FILES += $(HDL_SIM_DIR)/$(MEM_0).dat
HDL_SIM_INSTALL_FILES += $(HDL_SIM_INSTALL_DIR)/$(MEM_0).dat
SYM_FILES += $(HDL_SIM_DIR)/$(MEM_0).sym
HDL_SIM_INSTALL_FILES += $(HDL_SIM_INSTALL_DIR)/$(MEM_0).sym
$(MEM_0)_START := 0x00410000
$(MEM_0)_END := 0x0041ffff
$(MEM_0)_SPAN := 0x00010000
$(MEM_0)_HIERARCHICAL_PATH := audio_mem
$(MEM_0)_WIDTH := 32
$(MEM_0)_HEX_DATA_WIDTH := 32
$(MEM_0)_ENDIANNESS := --little-endian-mem
$(MEM_0)_CREATE_LANES := 0

.PHONY: audio_mem
audio_mem: check_elf_exists $(MEM_INIT_DIR)/$(MEM_0).hex $(HDL_SIM_DIR)/$(MEM_0).dat $(HDL_SIM_DIR)/$(MEM_0).sym

# Memory: nios2_onchip_mem
MEM_1 := ECE385_nios2_onchip_mem
$(MEM_1)_NAME := nios2_onchip_mem
$(MEM_1)_MEM_INIT_FILE_PARAM_NAME := INIT_FILE
HEX_FILES += $(MEM_INIT_DIR)/$(MEM_1).hex
MEM_INIT_INSTALL_FILES += $(MEM_INIT_INSTALL_DIR)/$(MEM_1).hex
DAT_FILES += $(HDL_SIM_DIR)/$(MEM_1).dat
HDL_SIM_INSTALL_FILES += $(HDL_SIM_INSTALL_DIR)/$(MEM_1).dat
SYM_FILES += $(HDL_SIM_DIR)/$(MEM_1).sym
HDL_SIM_INSTALL_FILES += $(HDL_SIM_INSTALL_DIR)/$(MEM_1).sym
$(MEM_1)_START := 0x00420000
$(MEM_1)_END := 0x0042ffff
$(MEM_1)_SPAN := 0x00010000
$(MEM_1)_HIERARCHICAL_PATH := nios2_onchip_mem
$(MEM_1)_WIDTH := 32
$(MEM_1)_HEX_DATA_WIDTH := 32
$(MEM_1)_ENDIANNESS := --little-endian-mem
$(MEM_1)_CREATE_LANES := 0

.PHONY: nios2_onchip_mem
nios2_onchip_mem: check_elf_exists $(MEM_INIT_DIR)/$(MEM_1).hex $(HDL_SIM_DIR)/$(MEM_1).dat $(HDL_SIM_DIR)/$(MEM_1).sym

# Memory: sdram
MEM_2 := sdram
$(MEM_2)_NAME := sdram
DAT_FILES += $(HDL_SIM_DIR)/$(MEM_2).dat
HDL_SIM_INSTALL_FILES += $(HDL_SIM_INSTALL_DIR)/$(MEM_2).dat
SYM_FILES += $(HDL_SIM_DIR)/$(MEM_2).sym
HDL_SIM_INSTALL_FILES += $(HDL_SIM_INSTALL_DIR)/$(MEM_2).sym
$(MEM_2)_START := 0x08000000
$(MEM_2)_END := 0x0fffffff
$(MEM_2)_SPAN := 0x08000000
$(MEM_2)_HIERARCHICAL_PATH := sdram
$(MEM_2)_WIDTH := 32
$(MEM_2)_HEX_DATA_WIDTH := 32
$(MEM_2)_ENDIANNESS := --little-endian-mem
$(MEM_2)_CREATE_LANES := 0

.PHONY: sdram
sdram: check_elf_exists $(HDL_SIM_DIR)/$(MEM_2).dat $(HDL_SIM_DIR)/$(MEM_2).sym

# Memory: usb_keycode
MEM_3 := ECE385_usb_keycode
$(MEM_3)_NAME := usb_keycode
$(MEM_3)_MEM_INIT_FILE_PARAM_NAME := INIT_FILE
HEX_FILES += $(MEM_INIT_DIR)/$(MEM_3).hex
MEM_INIT_INSTALL_FILES += $(MEM_INIT_INSTALL_DIR)/$(MEM_3).hex
DAT_FILES += $(HDL_SIM_DIR)/$(MEM_3).dat
HDL_SIM_INSTALL_FILES += $(HDL_SIM_INSTALL_DIR)/$(MEM_3).dat
SYM_FILES += $(HDL_SIM_DIR)/$(MEM_3).sym
HDL_SIM_INSTALL_FILES += $(HDL_SIM_INSTALL_DIR)/$(MEM_3).sym
$(MEM_3)_START := 0x00441000
$(MEM_3)_END := 0x004413ff
$(MEM_3)_SPAN := 0x00000400
$(MEM_3)_HIERARCHICAL_PATH := usb_keycode
$(MEM_3)_WIDTH := 32
$(MEM_3)_HEX_DATA_WIDTH := 32
$(MEM_3)_ENDIANNESS := --little-endian-mem
$(MEM_3)_CREATE_LANES := 0

.PHONY: usb_keycode
usb_keycode: check_elf_exists $(MEM_INIT_DIR)/$(MEM_3).hex $(HDL_SIM_DIR)/$(MEM_3).dat $(HDL_SIM_DIR)/$(MEM_3).sym

# Memory: vga_sprite_0
MEM_4 := ECE385_vga_sprite_0
$(MEM_4)_NAME := vga_sprite_0
$(MEM_4)_MEM_INIT_FILE_PARAM_NAME := INIT_FILE
HEX_FILES += $(MEM_INIT_DIR)/$(MEM_4).hex
MEM_INIT_INSTALL_FILES += $(MEM_INIT_INSTALL_DIR)/$(MEM_4).hex
DAT_FILES += $(HDL_SIM_DIR)/$(MEM_4).dat
HDL_SIM_INSTALL_FILES += $(HDL_SIM_INSTALL_DIR)/$(MEM_4).dat
SYM_FILES += $(HDL_SIM_DIR)/$(MEM_4).sym
HDL_SIM_INSTALL_FILES += $(HDL_SIM_INSTALL_DIR)/$(MEM_4).sym
$(MEM_4)_START := 0x0043e000
$(MEM_4)_END := 0x0043ffff
$(MEM_4)_SPAN := 0x00002000
$(MEM_4)_HIERARCHICAL_PATH := vga_sprite_0
$(MEM_4)_WIDTH := 32
$(MEM_4)_HEX_DATA_WIDTH := 32
$(MEM_4)_ENDIANNESS := --little-endian-mem
$(MEM_4)_CREATE_LANES := 0

.PHONY: vga_sprite_0
vga_sprite_0: check_elf_exists $(MEM_INIT_DIR)/$(MEM_4).hex $(HDL_SIM_DIR)/$(MEM_4).dat $(HDL_SIM_DIR)/$(MEM_4).sym

# Memory: vga_sprite_1
MEM_5 := ECE385_vga_sprite_1
$(MEM_5)_NAME := vga_sprite_1
$(MEM_5)_MEM_INIT_FILE_PARAM_NAME := INIT_FILE
HEX_FILES += $(MEM_INIT_DIR)/$(MEM_5).hex
MEM_INIT_INSTALL_FILES += $(MEM_INIT_INSTALL_DIR)/$(MEM_5).hex
DAT_FILES += $(HDL_SIM_DIR)/$(MEM_5).dat
HDL_SIM_INSTALL_FILES += $(HDL_SIM_INSTALL_DIR)/$(MEM_5).dat
SYM_FILES += $(HDL_SIM_DIR)/$(MEM_5).sym
HDL_SIM_INSTALL_FILES += $(HDL_SIM_INSTALL_DIR)/$(MEM_5).sym
$(MEM_5)_START := 0x0043c000
$(MEM_5)_END := 0x0043dfff
$(MEM_5)_SPAN := 0x00002000
$(MEM_5)_HIERARCHICAL_PATH := vga_sprite_1
$(MEM_5)_WIDTH := 32
$(MEM_5)_HEX_DATA_WIDTH := 32
$(MEM_5)_ENDIANNESS := --little-endian-mem
$(MEM_5)_CREATE_LANES := 0

.PHONY: vga_sprite_1
vga_sprite_1: check_elf_exists $(MEM_INIT_DIR)/$(MEM_5).hex $(HDL_SIM_DIR)/$(MEM_5).dat $(HDL_SIM_DIR)/$(MEM_5).sym

# Memory: vga_sprite_2
MEM_6 := ECE385_vga_sprite_2
$(MEM_6)_NAME := vga_sprite_2
$(MEM_6)_MEM_INIT_FILE_PARAM_NAME := INIT_FILE
HEX_FILES += $(MEM_INIT_DIR)/$(MEM_6).hex
MEM_INIT_INSTALL_FILES += $(MEM_INIT_INSTALL_DIR)/$(MEM_6).hex
DAT_FILES += $(HDL_SIM_DIR)/$(MEM_6).dat
HDL_SIM_INSTALL_FILES += $(HDL_SIM_INSTALL_DIR)/$(MEM_6).dat
SYM_FILES += $(HDL_SIM_DIR)/$(MEM_6).sym
HDL_SIM_INSTALL_FILES += $(HDL_SIM_INSTALL_DIR)/$(MEM_6).sym
$(MEM_6)_START := 0x0043a000
$(MEM_6)_END := 0x0043bfff
$(MEM_6)_SPAN := 0x00002000
$(MEM_6)_HIERARCHICAL_PATH := vga_sprite_2
$(MEM_6)_WIDTH := 32
$(MEM_6)_HEX_DATA_WIDTH := 32
$(MEM_6)_ENDIANNESS := --little-endian-mem
$(MEM_6)_CREATE_LANES := 0

.PHONY: vga_sprite_2
vga_sprite_2: check_elf_exists $(MEM_INIT_DIR)/$(MEM_6).hex $(HDL_SIM_DIR)/$(MEM_6).dat $(HDL_SIM_DIR)/$(MEM_6).sym

# Memory: vga_sprite_3
MEM_7 := ECE385_vga_sprite_3
$(MEM_7)_NAME := vga_sprite_3
$(MEM_7)_MEM_INIT_FILE_PARAM_NAME := INIT_FILE
HEX_FILES += $(MEM_INIT_DIR)/$(MEM_7).hex
MEM_INIT_INSTALL_FILES += $(MEM_INIT_INSTALL_DIR)/$(MEM_7).hex
DAT_FILES += $(HDL_SIM_DIR)/$(MEM_7).dat
HDL_SIM_INSTALL_FILES += $(HDL_SIM_INSTALL_DIR)/$(MEM_7).dat
SYM_FILES += $(HDL_SIM_DIR)/$(MEM_7).sym
HDL_SIM_INSTALL_FILES += $(HDL_SIM_INSTALL_DIR)/$(MEM_7).sym
$(MEM_7)_START := 0x00438000
$(MEM_7)_END := 0x00439fff
$(MEM_7)_SPAN := 0x00002000
$(MEM_7)_HIERARCHICAL_PATH := vga_sprite_3
$(MEM_7)_WIDTH := 32
$(MEM_7)_HEX_DATA_WIDTH := 32
$(MEM_7)_ENDIANNESS := --little-endian-mem
$(MEM_7)_CREATE_LANES := 0

.PHONY: vga_sprite_3
vga_sprite_3: check_elf_exists $(MEM_INIT_DIR)/$(MEM_7).hex $(HDL_SIM_DIR)/$(MEM_7).dat $(HDL_SIM_DIR)/$(MEM_7).sym

# Memory: vga_sprite_4
MEM_8 := ECE385_vga_sprite_4
$(MEM_8)_NAME := vga_sprite_4
$(MEM_8)_MEM_INIT_FILE_PARAM_NAME := INIT_FILE
HEX_FILES += $(MEM_INIT_DIR)/$(MEM_8).hex
MEM_INIT_INSTALL_FILES += $(MEM_INIT_INSTALL_DIR)/$(MEM_8).hex
DAT_FILES += $(HDL_SIM_DIR)/$(MEM_8).dat
HDL_SIM_INSTALL_FILES += $(HDL_SIM_INSTALL_DIR)/$(MEM_8).dat
SYM_FILES += $(HDL_SIM_DIR)/$(MEM_8).sym
HDL_SIM_INSTALL_FILES += $(HDL_SIM_INSTALL_DIR)/$(MEM_8).sym
$(MEM_8)_START := 0x00436000
$(MEM_8)_END := 0x00437fff
$(MEM_8)_SPAN := 0x00002000
$(MEM_8)_HIERARCHICAL_PATH := vga_sprite_4
$(MEM_8)_WIDTH := 32
$(MEM_8)_HEX_DATA_WIDTH := 32
$(MEM_8)_ENDIANNESS := --little-endian-mem
$(MEM_8)_CREATE_LANES := 0

.PHONY: vga_sprite_4
vga_sprite_4: check_elf_exists $(MEM_INIT_DIR)/$(MEM_8).hex $(HDL_SIM_DIR)/$(MEM_8).dat $(HDL_SIM_DIR)/$(MEM_8).sym

# Memory: vga_sprite_5
MEM_9 := ECE385_vga_sprite_5
$(MEM_9)_NAME := vga_sprite_5
$(MEM_9)_MEM_INIT_FILE_PARAM_NAME := INIT_FILE
HEX_FILES += $(MEM_INIT_DIR)/$(MEM_9).hex
MEM_INIT_INSTALL_FILES += $(MEM_INIT_INSTALL_DIR)/$(MEM_9).hex
DAT_FILES += $(HDL_SIM_DIR)/$(MEM_9).dat
HDL_SIM_INSTALL_FILES += $(HDL_SIM_INSTALL_DIR)/$(MEM_9).dat
SYM_FILES += $(HDL_SIM_DIR)/$(MEM_9).sym
HDL_SIM_INSTALL_FILES += $(HDL_SIM_INSTALL_DIR)/$(MEM_9).sym
$(MEM_9)_START := 0x00434000
$(MEM_9)_END := 0x00435fff
$(MEM_9)_SPAN := 0x00002000
$(MEM_9)_HIERARCHICAL_PATH := vga_sprite_5
$(MEM_9)_WIDTH := 32
$(MEM_9)_HEX_DATA_WIDTH := 32
$(MEM_9)_ENDIANNESS := --little-endian-mem
$(MEM_9)_CREATE_LANES := 0

.PHONY: vga_sprite_5
vga_sprite_5: check_elf_exists $(MEM_INIT_DIR)/$(MEM_9).hex $(HDL_SIM_DIR)/$(MEM_9).dat $(HDL_SIM_DIR)/$(MEM_9).sym

# Memory: vga_sprite_6
MEM_10 := ECE385_vga_sprite_6
$(MEM_10)_NAME := vga_sprite_6
$(MEM_10)_MEM_INIT_FILE_PARAM_NAME := INIT_FILE
HEX_FILES += $(MEM_INIT_DIR)/$(MEM_10).hex
MEM_INIT_INSTALL_FILES += $(MEM_INIT_INSTALL_DIR)/$(MEM_10).hex
DAT_FILES += $(HDL_SIM_DIR)/$(MEM_10).dat
HDL_SIM_INSTALL_FILES += $(HDL_SIM_INSTALL_DIR)/$(MEM_10).dat
SYM_FILES += $(HDL_SIM_DIR)/$(MEM_10).sym
HDL_SIM_INSTALL_FILES += $(HDL_SIM_INSTALL_DIR)/$(MEM_10).sym
$(MEM_10)_START := 0x00432000
$(MEM_10)_END := 0x00433fff
$(MEM_10)_SPAN := 0x00002000
$(MEM_10)_HIERARCHICAL_PATH := vga_sprite_6
$(MEM_10)_WIDTH := 32
$(MEM_10)_HEX_DATA_WIDTH := 32
$(MEM_10)_ENDIANNESS := --little-endian-mem
$(MEM_10)_CREATE_LANES := 0

.PHONY: vga_sprite_6
vga_sprite_6: check_elf_exists $(MEM_INIT_DIR)/$(MEM_10).hex $(HDL_SIM_DIR)/$(MEM_10).dat $(HDL_SIM_DIR)/$(MEM_10).sym

# Memory: vga_sprite_7
MEM_11 := ECE385_vga_sprite_7
$(MEM_11)_NAME := vga_sprite_7
$(MEM_11)_MEM_INIT_FILE_PARAM_NAME := INIT_FILE
HEX_FILES += $(MEM_INIT_DIR)/$(MEM_11).hex
MEM_INIT_INSTALL_FILES += $(MEM_INIT_INSTALL_DIR)/$(MEM_11).hex
DAT_FILES += $(HDL_SIM_DIR)/$(MEM_11).dat
HDL_SIM_INSTALL_FILES += $(HDL_SIM_INSTALL_DIR)/$(MEM_11).dat
SYM_FILES += $(HDL_SIM_DIR)/$(MEM_11).sym
HDL_SIM_INSTALL_FILES += $(HDL_SIM_INSTALL_DIR)/$(MEM_11).sym
$(MEM_11)_START := 0x00430000
$(MEM_11)_END := 0x00431fff
$(MEM_11)_SPAN := 0x00002000
$(MEM_11)_HIERARCHICAL_PATH := vga_sprite_7
$(MEM_11)_WIDTH := 32
$(MEM_11)_HEX_DATA_WIDTH := 32
$(MEM_11)_ENDIANNESS := --little-endian-mem
$(MEM_11)_CREATE_LANES := 0

.PHONY: vga_sprite_7
vga_sprite_7: check_elf_exists $(MEM_INIT_DIR)/$(MEM_11).hex $(HDL_SIM_DIR)/$(MEM_11).dat $(HDL_SIM_DIR)/$(MEM_11).sym


#END OF BSP SPECIFIC

#-------------------------------------
# Pre-Initialized Memory Targets
#-------------------------------------

.PHONY: mem_init_install mem_init_generate mem_init_clean

ifeq ($(QSYS),1)
# Target mem_init_install is deprecated for QSys based systems
# To initialize onchip memories for Quartus II Synthesis with Qsys based systems:
#  1) Use "make mem_init_genearate"
#  2) Add the generated mem_init/meminit.qip file to your Quartus II Project
#
mem_init_install:
	$(error Deprecated Makefile Target: '$@'. Use target 'mem_init_generate' and then add $(MEM_INIT_QIP_FILE) to your Quartus II Project)

else # QSYS != 1, if SopcBuilder based system

ifneq ($(MEM_INIT_INSTALL_DIR),)
mem_init_install: $(MEM_INIT_INSTALL_FILES)
endif

ifneq ($(HDL_SIM_INSTALL_DIR),)
mem_init_install: $(HDL_SIM_INSTALL_FILES)
endif

mem_init_install: mem_init_generate
ifeq ($(MEM_INIT_INSTALL_DIR),)
	@echo "WARNING: MEM_INIT_INSTALL_DIR not set. Set your QUARTUS_PROJECT_DIR environment variable."
endif
ifeq ($(HDL_SIM_INSTALL_DIR),)
	@echo "WARNING: HDL_SIM_INSTALL_DIR not set. Set your QUARTUS_PROJECT_DIR and SOPC_NAME environment variable."
endif

$(MEM_INIT_INSTALL_FILES): $(MEM_INIT_INSTALL_DIR)/%: $(MEM_INIT_DIR)/%
	@$(MKDIR) $(@D)
	@$(CP) -v $< $@

$(HDL_SIM_INSTALL_FILES): $(HDL_SIM_INSTALL_DIR)/%: $(HDL_SIM_DIR)/%
	@$(MKDIR) $(@D)
	@$(CP) -v $< $@

endif # QSYS == 1


mem_init_generate: hex dat sym flash $(MEM_INIT_DESCRIPTOR_FILE) $(MEM_INIT_QIP_FILE)

mem_init_clean:
	@$(RM) -r $(MEM_INIT_DIR) $(HDL_SIM_DIR) $(FLASH_FILES)

.PHONY: hex dat sym flash

hex: check_elf_exists $(HEX_FILES)

dat: check_elf_exists $(DAT_FILES)

sym: check_elf_exists $(SYM_FILES)

flash: check_elf_exists $(FLASH_FILES)

#-------------------------------------
# Pre-Initialized Memory Rules
#-------------------------------------

.PHONY: check_elf_exists
check_elf_exists: $(ELF)
ifeq ($(ELF),)
	$(error ELF var not set in mem_init.mk)
endif

$(filter-out $(FLASH_DAT_FILES),$(DAT_FILES)): %.dat: $(ELF)
	$(post-process-info)
	@$(MKDIR) $(@D)
	$(ELF2DAT) --infile=$< --outfile=$@ \
		--base=$(mem_start_address) --end=$(mem_end_address) --width=$(mem_width) \
		$(mem_endianness) --create-lanes=$(mem_create_lanes) $(elf2dat_extra_args)

$(foreach i,0 1 2 3 4 5 6 7,%_lane$(i).dat): %.dat
	@true

ELF_TO_HEX_CMD_NO_BOOTLOADER = $(ELF2HEX) $< $(mem_start_address) $(mem_end_address) --width=$(mem_hex_width) \
			$(mem_endianness) --create-lanes=$(mem_create_lanes) $(elf2hex_extra_args) $@
			
ELF_TO_HEX_CMD_WITH_BOOTLOADER = $(ALT_FILE_CONVERT) -I $(NIOS2_ELF_FORMAT) -O hex --input=$< --output=$@ \
			--base=$(mem_start_address) --end=$(mem_end_address) --reset=$(RESET_ADDRESS) \
			--out-data-width=$(mem_hex_width) $(flash_mem_boot_loader_flag)

ELF_TO_HEX_CMD = $(strip $(if $(flash_mem_boot_loader_flag), \
	$(ELF_TO_HEX_CMD_WITH_BOOTLOADER), \
	$(ELF_TO_HEX_CMD_NO_BOOTLOADER) \
	))

$(HEX_FILES): %.hex: $(ELF)
	$(post-process-info)
	@$(MKDIR) $(@D)
	$(ELF_TO_HEX_CMD)

$(SYM_FILES): %.sym: $(ELF)
	$(post-process-info)
	@$(MKDIR) $(@D)
	$(NM) -n $< > $@

$(FLASH_FILES): %.flash: $(ELF)
	$(post-process-info)
	@$(MKDIR) $(@D)
	$(ELF2FLASH) --input=$< --outfile=$@ --sim_optimize=$(SIM_OPTIMIZE) $(mem_endianness) \
		$(elf2flash_extra_args)

#
# Function generate_spd_entry
# Arg1: path to the memory initialization file
# Arg2: Type HEX or DAT
# Arg3: Output spd file to append
gen_spd_entry.BASE_FILE = $(basename $(notdir $1))
gen_spd_entry.PARAM_NAME = $($(gen_spd_entry.BASE_FILE)_MEM_INIT_FILE_PARAM_NAME)
gen_spd_entry.MEM_PATH = $($(gen_spd_entry.BASE_FILE)_HIERARCHICAL_PATH)
gen_spd_entry.SETTINGS = $(strip \
	path=\"$1\" \
	type=\"$2\" \
	$(if $(gen_spd_entry.PARAM_NAME),initParamName=\"$(gen_spd_entry.PARAM_NAME)\") \
	$(if $(gen_spd_entry.MEM_PATH),memoryPath=\"$(gen_spd_entry.MEM_PATH)\") \
)
define gen_spd_entry
$(ECHO) "<file $(gen_spd_entry.SETTINGS) />" >> $3
endef

$(MEM_INIT_DESCRIPTOR_FILE).DAT_FILESET := $(patsubst $(dir $(MEM_INIT_DESCRIPTOR_FILE))%,%,$(DAT_FILES))
$(MEM_INIT_DESCRIPTOR_FILE).HEX_FILESET := $(patsubst $(dir $(MEM_INIT_DESCRIPTOR_FILE))%,%,$(HEX_FILES))

$(MEM_INIT_DESCRIPTOR_FILE): %.spd: $(MEM_INIT_FILE)
	$(post-process-info)
	@$(MKDIR) $(@D)
	@$(RM) $@
	@$(ECHO) "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" > $@
	@$(ECHO) "<simPackage>" >> $@
	@$(foreach dat_file,$($@.DAT_FILESET),$(call gen_spd_entry,$(dat_file),DAT,$@) &&)true
	@$(foreach hex_file,$($@.HEX_FILESET),$(call gen_spd_entry,$(hex_file),HEX,$@) &&)true
	@$(ECHO) "</simPackage>" >> $@

.DELETE_ON_ERROR: $(MEM_INIT_DESCRIPTOR_FILE)

$(MEM_INIT_QIP_FILE): %.qip: $(MEM_INIT_FILE)
	$(post-process-info)
	@$(MKDIR) $(@D)
	@$(RM) $@
	@$(ECHO) "set_global_assignment -name SEARCH_PATH $$::quartus(qip_path)" > $@

.DELETE_ON_ERROR: $(MEM_INIT_QIP_FILE)
