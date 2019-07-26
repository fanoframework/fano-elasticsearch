(*!------------------------------------------------------------
 * Fano Framework Elasticsearch Sample Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-elasticsearch
 * @copyright Copyright (c) 2019 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-elasticsearch/blob/master/LICENSE (GPL-3.0)
 *------------------------------------------------------------- *)

{%dependencies.inc}

{---put your dependencies registration here---}
container.add('curl', THttpCurlFactory.create());

container.add('httpGet',
    THttpGetFactory.create(
        container.get('curl') as IHttpClientHandleAware
    )
);
container.add(
    'httpPost',
    THttpPostFactory.create(
        container.get('curl') as IHttpClientHandleAware
    )
);
container.add('articleModel', TArticleModelFactory.create());
container.add('articleParams', TArticleParamsFactory.create());

container.add('articlecreateModel', TArticleCreateModelFactory.create());
