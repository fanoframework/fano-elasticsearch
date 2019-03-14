(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit ArticleSubmitController;

interface

uses

    fano;

type

    (*!-----------------------------------------------
     * controller that handle route :
     * /articlesubmit
     *
     * See Routes/ArticleSubmit/routes.inc
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TArticleSubmitController = class(TRouteHandler, IDependency)
    private
        model : IModelWriter;
        params : IModelParams;
    public
        constructor create(
            const beforeMiddlewares : IMiddlewareCollection;
            const afterMiddlewares : IMiddlewareCollection;
            const modelInst : IModelWriter;
            const modelParamInst : IModelParams
        );
        destructor destroy(); override;
        function handleRequest(
            const request : IRequest;
            const response : IResponse
        ) : IResponse; override;
    end;

implementation

    constructor TArticleSubmitController.create(
        const beforeMiddlewares : IMiddlewareCollection;
        const afterMiddlewares : IMiddlewareCollection;
        const modelInst : IModelWriter;
        const modelParamInst : IModelParams
    );
    begin
        inherited create(beforeMiddlewares, afterMiddlewares);
        model := modelInst;
        params := modelParamInst;
    end;

    destructor TArticleSubmitController.destroy();
    begin
        inherited destroy();
        model := nil;
        params := nil;
    end;

    function TArticleSubmitController.handleRequest(
          const request : IRequest;
          const response : IResponse
    ) : IResponse;
    begin
        params.writeString('title', request.getParsedBodyParam('title'));
        params.writeString('content', request.getParsedBodyParam('content'));
        params.writeString('author', request.getParsedBodyParam('author'));
        params.writeString('tags', request.getParsedBodyParam('tags'));
        model.write(params, params);
        result := response;
    end;

end.
