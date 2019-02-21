(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit ArticleControllerFactory;

interface

uses
    fano;

type

    (*!-----------------------------------------------
     * Factory for controller TArticleController
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TArticleControllerFactory = class(TFactory, IDependencyFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses
    sysutils,

    {*! -------------------------------
        unit interfaces
    ----------------------------------- *}
    ArticleController;

    function TArticleControllerFactory.build(const container : IDependencyContainer) : IDependency;
    var routeMiddlewares : IMiddlewareCollectionAware;
    begin
        routeMiddlewares := container.get('routeMiddlewares') as IMiddlewareCollectionAware;
        try
            result := TArticleController.create(
                routeMiddlewares.getBefore(),
                routeMiddlewares.getAfter(),
                container.get('articleView') as IView,
                container.get('viewParams') as IViewParameters
            );
        finally
            routeMiddlewares := nil;
        end;
    end;
end.
