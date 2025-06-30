##############################################################################
# (c) Crown copyright 2025 Met Office. All rights reserved.
# The file LICENCE, distributed with this code, contains details of the terms
# under which the code may be used.
##############################################################################
export PROJECT_SOURCE = $(APPS_ROOT_DIR)/interfaces/jules_interface/source

.PHONY: import-jules_interface
import-jules_interface:
    # Get a copy of the source code from the JULES repository
	$Q. $(APPS_ROOT_DIR)/dependencies.sh \
	   && fcm make -C $(SCRATCH_DIR)/jules -f $(APPS_ROOT_DIR)/interfaces/jules_interface/build/extract.cfg
	$Qrsync -acvz $(SCRATCH_DIR)/jules/extract/ $(WORKING_DIR)/

    # Extract the interface code
	$Q$(MAKE) $(QUIET_ARG) -f $(LFRIC_BUILD)/extract.mk \
			  SOURCE_DIR=$(PROJECT_SOURCE)
