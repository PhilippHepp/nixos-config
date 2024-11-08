#!/bin/bash

if [[ $(pamixer --get-mute) == "false" ]] 
then
    pamixer --default-source -m && pamixer -m
    exit 1
fi

if [[ $(pamixer --get-mute) == "true" ]] 
then
    pamixer --default-source -u && pamixer -u
    exit 1
fi
