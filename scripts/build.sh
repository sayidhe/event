#!/bin/bash

jekyll build --config _config.yml
# htmlproofer ./_site --url-ignore www.amazon.com 
HTML::Proofer.new("./_site", ssl_verifypeer: false).run
