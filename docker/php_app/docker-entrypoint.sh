#!/bin/sh
service supervisor restart
cron
apache2-foreground