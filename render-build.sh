#!/usr/bin/env bash
# Install PHP dependencies
composer install
# Install Node dependencies for API
npm install --prefix api socket.io
