(*!------------------------------------------------------------
 * Fano Framework Elasticsearch Sample Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-elasticsearch
 * @copyright Copyright (c) 2019 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-elasticsearch/blob/master/LICENSE (GPL-3.0)
 *------------------------------------------------------------- *)

{$INCLUDE main.dependencies.inc}

{---put your dependencies registration here---}
{ container.add('db', TMySqlDbFactory.create()); }
{$INCLUDE models.dependencies.inc}
{$INCLUDE views.dependencies.inc}
{$INCLUDE controllers.dependencies.inc}
