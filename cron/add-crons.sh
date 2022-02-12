#!/bin/bash

source common/functions.sh;


add_cron "* * * * * /root/vesta-post-install/cron/vesta_service.sh" "Adding cron tab to auto restart service on crash"


