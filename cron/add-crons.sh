#!/bin/bash

source common/functions.sh;

echo "Adding cron tab to auto restart service on crash"

add_cron "* * * * * ~/vesta-post-install/cron/vesta_service.sh"


