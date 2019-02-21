#------------------------------------------------------------
# Fano Framework Elasticsearch Sample Application (https://fanoframework.github.io)
#
# @link      https://github.com/fanoframework/fano-elasticsearch
# @copyright Copyright (c) 2019 Zamrony P. Juhara
# @license   https://github.com/fanoframework/fano-elasticsearch/blob/master/LICENSE (GPL-3.0)
#--------------------------------------------------------------
#!/bin/bash

#------------------------------------------------------
# Scripts to setup configuration files
#------------------------------------------------------

cp config/config.json.sample config/config.json
cp build.prod.cfg.sample build.prod.cfg
cp build.dev.cfg.sample build.dev.cfg
cp build.cfg.sample build.cfg