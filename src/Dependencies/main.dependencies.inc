(*!------------------------------------------------------------
 * Fano Framework Elasticsearch Sample Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-elasticsearch
 * @copyright Copyright (c) 2019 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-elasticsearch/blob/master/LICENSE (GPL-3.0)
 *------------------------------------------------------------- *)

 {-----------------------------------------------
   register application configuration
 ------------------------------------------------}
 container.add(
     'config',
     TJsonFileConfigFactory.create(
         extractFileDir(getCurrentDir()) + '/config/config.json'
     )
 );

 {-----------------------------------------------
   register middleware list for each routes that
   does nothing,
   need to be use factory so each route will have
   different middleware list
   Replace with TMiddlewareCollectionAwareFactory to support middleware
   or replace with your own implementation if required
 ------------------------------------------------}
 container.factory('routeMiddlewares', TNullMiddlewareCollectionAwareFactory.create());

 {-----------------------------------------------
   register application simple router instance
   Replace with your own implementation if required
 ------------------------------------------------}
 container.add('router', TSimpleRouterFactory.create());

 {-----------------------------------------------
   setup application request dispatcher
   replace with TDispatcherDispatcherFactory if middleware support is requred
 ------------------------------------------------}
 container.add(
     'dispatcher',
     TSimpleDispatcherFactory.create(
         container.get('router') as IRouteMatcher
     )
 );

 {-----------------------------------------------
   register key value pair
 ------------------------------------------------}
 container.factory('keyValue', TKeyValuePairFactory.create());
