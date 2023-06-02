#!/bin/bash
set -euo pipefail

systemctl start --user gpd.service
/opt/paloaltonetworks/globalprotect/PanGPUI start &
systemctl start --user gpa.service
globalprotect launch-ui
