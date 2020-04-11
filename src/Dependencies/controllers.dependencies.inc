(*!------------------------------------------------------------
 * Fano Framework Elasticsearch Sample Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-elasticsearch
 * @copyright Copyright (c) 2019 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-elasticsearch/blob/master/LICENSE (GPL-3.0)
 *------------------------------------------------------------- *)

{%dependencies.inc}

{---put your dependencies registration here---}

container.add('articleController', TArticleControllerFactory.create());
container.add('articlecreateController', TArticleCreateControllerFactory.create());
container.add('articlecreateSubmitController', TArticleCreateSubmitControllerFactory.create());
