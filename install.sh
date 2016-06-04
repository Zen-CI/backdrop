#!/bin/sh

# Go to domain directory.
cd $DOCROOT

# Link Backdrop files
ln -s $ZENCI_DEPLOY_DIR/* ./
ln -s $ZENCI_DEPLOY_DIR/.htaccess ./

# Unlink settings.php and copy instead.
rm -f settings.php
cp $ZENCI_DEPLOY_DIR/settings.php ./

# Unlink files and copy instead.
rm -f files
cp -r $ZENCI_DEPLOY_DIR/files ./

# Unlink sites and copy instead.
rm -f sites
cp -r $ZENCI_DEPLOY_DIR/sites ./



# Install Backdrop.
php $DOCROOT/core/scripts/install.sh --account-mail=$ACCOUNT_MAIL --account-name=$ACCOUNT_USER --account-pass="$ACCOUNT_PASS" --site-mail=$SITE_MAIL --site-name="$SITE_NAME" --db-url=mysql://$DATABASE_USER:$DATABASE_PASS@localhost/$DATABASE_NAME --root=$DOCROOT

echo "user: $ACCOUNT_USER pass: $ACCOUNT_PASS"
