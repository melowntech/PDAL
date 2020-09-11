#!/bin/bash
RELEASE=$(lsb_release -c | awk '{print $2}')
case "${RELEASE}" in
    jessie) DISTRIBUTION=melown-jessie-backports;;
    stretch) DISTRIBUTION=melown-stretch-backports;;
    buster) DISTRIBUTION=melown-buster-backports;;

    xenial) DISTRIBUTION=melown-xenial;;
    yakkety) DISTRIBUTION=melown-yakkety;;
    zesty) DISTRIBUTION=melown-zesty;;
    artful) DISTRIBUTION=melown-artful;;
    bionic) DISTRIBUTION=melown-bionic;;
    *)
        # default
        DISTRIBUTION=citationtech-wheezy-backports
        ;;
esac

EXTRA_OPTS=""
if test -z "${NOTPARALLEL}"; then
    EXTRA_OPTS="${EXTRA_OPTS} -j9"
fi

echo "DISTRIBUTION: ${DISTRIBUTION}"
dpkg-buildpackage --changes-option=-DDistribution="${DISTRIBUTION}"
