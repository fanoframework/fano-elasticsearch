(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit ArticleCreateControllerFactory;

interface

uses
    fano;

type

    (*!-----------------------------------------------
     * Factory for controller TArticleCreateController
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TArticleCreateControllerFactory = class(TFactory, IDependencyFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses
    sysutils,

    {*! -------------------------------
        unit interfaces
    ----------------------------------- *}
    ArticleCreateController;

    function TArticleCreateControllerFactory.build(const container : IDependencyContainer) : IDependency;
    var routeMiddlewares : IMiddlewareCollectionAware;
        viewParams : IViewParameters;
        config : IAppConfiguration;
    begin
        routeMiddlewares := container.get('routeMiddlewares') as IMiddlewareCollectionAware;
        try
            viewParams := container.get('viewParams') as IViewParameters;
            config := container.get('config') as IAppConfiguration;
            viewParams.setVar('baseUrl', config.getString('baseUrl'));
            viewParams.setVar('appName', config.getString('appName'));
            result := TArticleCreateController.create(
                routeMiddlewares.getBefore(),
                routeMiddlewares.getAfter(),
                container.get('articlecreateView') as IView,
                viewParams
            );
        finally
            routeMiddlewares := nil;
        end;
    end;
end.
