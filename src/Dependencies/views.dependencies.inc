(*!------------------------------------------------------------
 * Fano Framework Elasticsearch Sample Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-elasticsearch
 * @copyright Copyright (c) 2019 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-elasticsearch/blob/master/LICENSE (GPL-3.0)
 *------------------------------------------------------------- *)

{%dependencies.inc}

{---put your dependencies registration here---}

{-----------------------------------------------
  file reader utility
------------------------------------------------}
container.add('fileReader', TStringFileReaderFactory.create());

{-----------------------------------------------
  view parameters
------------------------------------------------}
container.factory('viewParams', TViewParametersFactory.create());

{-----------------------------------------------
  setup html template parser
------------------------------------------------}
container.add('templateParser', TSimpleTemplateParserFactory.create());

{-----------------------------------------------
  header view
------------------------------------------------}
container.add('headerView', THeaderViewFactory.create());

{-----------------------------------------------
  footer view
------------------------------------------------}
container.add('footerView', TFooterViewFactory.create());

container.add('searchForm', TSearchFormViewFactory.create());
container.add('articleView', TArticleViewFactory.create());

container.add('articlecreateView', TArticleCreateViewFactory.create());