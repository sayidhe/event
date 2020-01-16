#!/bin/bash

jekyll build --config _config.yml
htmlproofer ./_site --url-ignore "https://www.amazon.com/Permanent-Record-Edward-Snowden/dp/1250237238"
