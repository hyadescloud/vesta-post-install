#!/bin/sh

update_template_dir() {
    PACKAGE=$1
    GIT_REPO=$2

    cd /usr/local/vesta/data/templates/web/
    zip -r $PACKAGE.zip $PACKAGE/
    rm -rf /usr/local/vesta/data/templates/web/$PACKAGE/*
    git clone $GIT_REPO /usr/local/vesta/data/templates/web/$PACKAGE/
    git checkout stable

}


php_fpm_install() {
    VERSION=$1

    echo "================================================= Installing php$VERSION ================================================="
    # Install php-fpm depending on the version
    apt-get install php$VERSION-apcu php$VERSION-mbstring php$VERSION-bcmath php$VERSION-cli php$VERSION-curl php$VERSION-fpm php$VERSION-gd php$VERSION-intl php$VERSION-mysql php$VERSION-soap php$VERSION-xml php$VERSION-zip php$VERSION-memcache php$VERSION-memcached php$VERSION-zip php$VERSION-gmp
    update-rc.d php$VERSION-fpm defaults
     echo "================================================= Updating apache ================================================="
    a2enconf php$VERSION-fpm
    systemctl restart apache2

    echo "============================================= php$VERSION directory cleared =============================================="
    cp -r /etc/php/$VERSION/ /root/vst_install_backups/php$VERSION/
    rm -f /etc/php/$VERSION/fpm/pool.d/*

    echo "================================================= php$VERSION installed ================================================="
}