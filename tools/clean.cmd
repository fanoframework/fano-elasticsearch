REM------------------------------------------------------------
REM Fano Framework Elasticsearch Sample Application (https://fanoframework.github.io)
REM
REM @link      https://github.com/fanoframework/fano-elasticsearch
REM @copyright Copyright (c) 2019 Zamrony P. Juhara
REM @license   https://github.com/fanoframework/fano-elasticsearch/blob/master/LICENSE (GPL-3.0)
REM-------------------------------------------------------------

REM------------------------------------------------------
REM Scripts to delete all compiled unit files
REM------------------------------------------------------

FOR /R bin\unit %i IN (*) DO IF NOT %i == README.md del %i