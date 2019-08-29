(*!------------------------------------------------------------
 * Fano Framework Elasticsearch Sample Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-elasticsearch
 * @copyright Copyright (c) 2019 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-elasticsearch/blob/master/LICENSE (GPL-3.0)
 *------------------------------------------------------------- *)
unit bootstrap;

interface

uses

    fano;

type

    TBootstrapApp = class(TSimpleWebApplication)
    protected
        procedure buildDependencies(const container : IDependencyContainer); override;
        procedure buildRoutes(const container : IDependencyContainer); override;
    end;

implementation

uses
    sysutils

    (*! -------------------------------
     *   controllers factory
     *----------------------------------- *)
    {---- put your controller factory here ---},
    HeaderViewFactory,
    FooterViewFactory,
    ArticleControllerFactory,
    SearchFormViewFactory,
    ArticleViewFactory,
    ArticleModelFactory,
    ArticleParamsFactory,
    ArticleCreateControllerFactory,
    ArticleCreateViewFactory,
    ArticleCreateModelFactory;


    procedure TBootstrapApp.buildDependencies(const container : IDependencyContainer);
    begin
        {$INCLUDE Dependencies/dependencies.inc}
    end;

    procedure TBootstrapApp.buildRoutes(const container : IDependencyContainer);
    var router : IRouter;
    begin
        router := container.get('router') as IRouter;
        try
            {$INCLUDE Routes/routes.inc}
        finally
            router := nil;
        end;
    end;
end.
