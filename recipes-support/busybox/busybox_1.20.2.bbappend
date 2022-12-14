python () {
        tcmode = d.getVar("TCMODE", True)
        arch = d.getVar("OVERRIDES", True)

        if "external-fsl" in tcmode and ("e5500-64b:" in arch or "e6500-64b:" in arch):
           d.setVar('LD_append', ' -melf64ppc')
}

do_configure_prepend () {
	if [ "${TCMODE}" = "external-fsl" ]; then
	   sed -i "s:CONFIG_INETD=y:# CONFIG_INETD is not set:g" ${WORKDIR}/defconfig
	   sed -i "s:CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO=y:# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO is not set:g" ${WORKDIR}/defconfig
	   sed -i "s:CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD=y:# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD is not set:g" ${WORKDIR}/defconfig
	   sed -i "s:CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME=y:# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME is not set:g" ${WORKDIR}/defconfig
	   sed -i "s:CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME=y:# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME is not set:g" ${WORKDIR}/defconfig
	   sed -i "s:CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN=y:# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN is not set:g" ${WORKDIR}/defconfig
	   sed -i "s:CONFIG_FEATURE_INETD_RPC=y:# CONFIG_FEATURE_INETD_RPC is not set:g" ${WORKDIR}/defconfig
	fi
}
