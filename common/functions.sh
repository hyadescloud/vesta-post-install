#!/bin/sh

update_template_dir() {
    PACKAGE=$1
    GIT_REPO=$2

    cd /usr/local/vesta/data/templates/web/
    
    # if the directory doesn't contain .git dir
    # That means you run this for the first so lets backups
    if [ ! -d "/usr/local/vesta/data/templates/web/$PACKAGE/.git" ]; then
        zip -r $PACKAGE.zip $PACKAGE/
        
    fi

    rm -rf /usr/local/vesta/data/templates/web/$PACKAGE/*
    rm -rf /usr/local/vesta/data/templates/web/$PACKAGE/.git/
    git clone $GIT_REPO -b stable /usr/local/vesta/data/templates/web/$PACKAGE/
    chmod a+x /usr/local/vesta/data/templates/web/$PACKAGE/*.sh

}


php_fpm_install() {
    VERSION=$1

    echo "================================================= Installing php$VERSION ================================================="
    # Install php-fpm depending on the version
    apt-get install -y php$VERSION php$VERSION-common php$VERSION-yaml php$VERSION-json php$VERSION-xsl libapache2-mod-php$VERSION php$VERSION-opcache php$VERSION-readline php$VERSION-bz2  php$VERSION-apcu php$VERSION-mbstring php$VERSION-bcmath php$VERSION-cli php$VERSION-curl php$VERSION-fpm php$VERSION-gd php$VERSION-intl php$VERSION-mysql php$VERSION-soap php$VERSION-xml php$VERSION-zip php$VERSION-memcache php$VERSION-memcached php$VERSION-zip php$VERSION-gmp php$VERSION-pgsql
    update-rc.d php$VERSION-fpm defaults
     echo "================================================= Updating apache ================================================="
    a2enconf php$VERSION-fpm
    systemctl restart apache2

    echo "============================================= php$VERSION directory cleared =============================================="
    cp -r /etc/php/$VERSION/ /root/vst_install_backups/php$VERSION/
    rm -f /etc/php/$VERSION/fpm/pool.d/*

    echo "================================================= php$VERSION installed ================================================="
}

restore_user() {
    f=$1
    echo "================================================= Restoring user ================================================="
    FILE=$(basename $f)
    USER=$(echo $FILE | cut -f1 -d".")
    echo "v-restore-user $USER $FILE"
    v-restore-user $USER $FILE '*' '*' '*' '*' 'no' 'no' 'no'
    echo "================================================= $USER restored ================================================="

}


check_status() {
    APP=$1
    echo "================================================= Checking status of $APP ================================================="
    service "$APP" status
    echo "=================================================================================================================="

}

check_php_status() {
    php_vers=$1

    check_status "php$php_vers-fpm"
}

add_cron() {
    CRON_DATA=$1
    DESCRIPTION=$2

    echo $2
    
    (crontab -l 2>/dev/null; echo "$CRON_DATA") | crontab -
}
