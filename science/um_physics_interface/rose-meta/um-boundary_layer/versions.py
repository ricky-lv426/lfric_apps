import re
import sys

from metomi.rose.upgrade import MacroUpgrade


class UpgradeError(Exception):
    """Exception created when an upgrade fails."""

    def __init__(self, msg):
        self.msg = msg

    def __repr__(self):
        sys.tracebacklimit = 0
        return self.msg

    __str__ = __repr__


class vn20_t334(MacroUpgrade):
    """Upgrade macro for ticket #334 by Ian Boutle."""

    BEFORE_TAG = "vn2.0"
    AFTER_TAG = "vn2.0_t334"

    def upgrade(self, config, meta_config=None):
        # Commands From: science/um_physics_interface/rose-meta/um-boundary_layer
        self.add_setting(config, ["namelist:blayer", "dec_thres_cu"], "0.05")
        return config, self.reports


class vn20_t562(MacroUpgrade):
    """Upgrade macro for ticket #562 by Paul Burns."""

    BEFORE_TAG = "vn2.0_t334"
    AFTER_TAG = "vn2.0_t562"

    def upgrade(self, config, meta_config=None):
        # Commands From: rose-meta/um-boundary_layer
        """Add ng_stress to namelist blayer"""
        self.add_setting(
            config, ["namelist:blayer", "ng_stress"], "'BG97_limited'"
        )

        return config, self.reports
