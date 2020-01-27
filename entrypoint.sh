#!/bin/sh

function clone_plugin_repo {
    git clone --branch $GRAFANA_PLUGIN_TAG $GRAFANA_PLUGIN_REPO $GRAFANA_PLUGIN_DIR
}

function checkout_plugin_repo {
    git -C $GRAFANA_PLUGIN_DIR fetch
    git -C $GRAFANA_PLUGIN_DIR checkout $GRAFANA_PLUGIN_TAG
}

if [ ! -d $GRAFANA_PLUGIN_DIR ]; then
    clone_plugin_repo
else
    if [ ! -d $GRAFANA_PLUGIN_DIR/.git ]; then
        rm -rf $GRAFANA_PLUGIN_DIR
        clone_plugin_repo
    else
        checkout_plugin_repo
    fi
fi
