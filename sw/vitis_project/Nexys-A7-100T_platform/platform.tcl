# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct Z:\git_wa\vivado\Nexys-A7-100T\sw\vitis_project\Nexys-A7-100T_platform\platform.tcl
# 
# OR launch xsct and run below command.
# source Z:\git_wa\vivado\Nexys-A7-100T\sw\vitis_project\Nexys-A7-100T_platform\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {Nexys-A7-100T_platform}\
-hw {Z:\git_wa\vivado\Nexys-A7-100T\vivado_project\top.xsa}\
-proc {microblaze_0} -os {standalone} -out {Z:/git_wa/vivado/Nexys-A7-100T/sw/vitis_project}

platform write
platform generate -domains 
platform active {Nexys-A7-100T_platform}
bsp reload
platform generate
platform clean
platform generate
bsp reload
