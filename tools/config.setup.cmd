REM------------------------------------------------------------
REM Fano Framework Elasticsearch Sample Application (https://fanoframework.github.io)
REM
REM @link      https://github.com/fanoframework/fano-elasticsearch
REM @copyright Copyright (c) 2019 Zamrony P. Juhara
REM @license   https://github.com/fanoframework/fano-elasticsearch/blob/master/LICENSE (GPL-3.0)
REM-------------------------------------------------------------

REM------------------------------------------------------
REM Scripts to setup configuration files
REM------------------------------------------------------

copy config\config.json.sample config\config.json
copy build.prod.cfg.sample build.prod.cfg
copy build.dev.cfg.sample build.dev.cfg
copy build.cfg.sample build.cfg