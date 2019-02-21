(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit ArticleController;

interface

uses

    fano;

type

    (*!-----------------------------------------------
     * controller that handle route :
     * /article
     *
     * See Routes/Article/routes.inc
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TArticleController = class(TController, IDependency)
    private
        articleModel : IModelReader;
    public
        constructor create(
            const beforeMiddlewares : IMiddlewareCollection;
            const afterMiddlewares : IMiddlewareCollection;
            const viewInst : IView;
            const viewParamsInst : IViewParameters;
            const model : IModelReader
        );
        destructor destroy(); override;
        function handleRequest(
            const request : IRequest;
            const response : IResponse
        ) : IResponse; override;
    end;

implementation
    constructor TArticleController.create(
        const beforeMiddlewares : IMiddlewareCollection;
        const afterMiddlewares : IMiddlewareCollection;
        const viewInst : IView;
        const viewParamsInst : IViewParameters;
        const model : IModelReader
    );
    begin
        inherited create(beforeMiddlewares, afterMiddlewares, viewInst, viewParamsInst);
        articleModel := model;
    end;

    destructor TArticleController.destroy();
    begin
        inherited destroy();
        articleModel := nil;
    end;

    function TArticleController.handleRequest(
          const request : IRequest;
          const response : IResponse
    ) : IResponse;
    begin
        articleModel.read();
        result := inherited handleRequest(request, response);
    end;

end.
