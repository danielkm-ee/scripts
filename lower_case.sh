#!/bin/bash

# Use the perl-based rename utility to:
# 1. Convert all uppercase to lowercase
# 2. Replace all spaces with underscores
rename 'y/A-Z/a-z/; s/ /_/g' ./*
