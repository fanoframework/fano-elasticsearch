(*!------------------------------------------------------------
 * Fano Framework Elasticsearch Sample Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-elasticsearch
 * @copyright Copyright (c) 2019 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-elasticsearch/blob/master/LICENSE (GPL-3.0)
 *------------------------------------------------------------- *)
{---put your routes registration here---}
{$INCLUDE Article/routes.inc}

router.get('/', container.get('articleController') as IRequestHandler);
{$INCLUDE ArticleCreate/routes.inc}
