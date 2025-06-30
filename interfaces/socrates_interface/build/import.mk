##############################################################################
# (c) Crown copyright 2025 Met Office. All rights reserved.
# The file LICENCE, distributed with this code, contains details of the terms
# under which the code may be used.
##############################################################################
export PROJECT_SOURCE = $(APPS_ROOT_DIR)/interfaces/socrates_interface/source

.PHONY: import-socrates_interface
import-socrates_interface:
    # Get a copy of the source code from the SCORATES repository
	$Q. $(APPS_ROOT_DIR)/dependencies.sh \
	   && fcm make -C $(SCRATCH_DIR)/socrates -f $(APPS_ROOT_DIR)/interfaces/socrates_interface/build/extract.cfg
	$Qrsync -acvz $(SCRATCH_DIR)/socrates/extract/ $(WORKING_DIR)/

    # Extract the interface code
	$Q$(MAKE) $(QUIET_ARG) -f $(LFRIC_BUILD)/extract.mk \
			  SOURCE_DIR=$(PROJECT_SOURCE)
