(*!------------------------------------------------------------
 * Fano Framework Elasticsearch Sample Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-elasticsearch
 * @copyright Copyright (c) 2019 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-elasticsearch/blob/master/LICENSE (GPL-3.0)
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
        articleParams : IModelParams;
    public
        constructor create(
            const aMiddlewares : IMiddlewareCollectionAware;
            const viewInst : IView;
            const viewParamsInst : IViewParameters;
            const model : IModelReader;
            const modelParams : IModelParams
        );
        destructor destroy(); override;
        function handleRequest(
            const request : IRequest;
            const response : IResponse
        ) : IResponse; override;
    end;

implementation
    constructor TArticleController.create(
        const aMiddlewares : IMiddlewareCollectionAware;
        const viewInst : IView;
        const viewParamsInst : IViewParameters;
        const model : IModelReader;
        const modelParams : IModelParams
    );
    begin
        inherited create(aMiddlewares, viewInst, viewParamsInst);
        articleModel := model;
        articleParams := modelParams;
    end;

    destructor TArticleController.destroy();
    begin
        inherited destroy();
        articleModel := nil;
        articleParams := nil;
    end;

    function TArticleController.handleRequest(
          const request : IRequest;
          const response : IResponse
    ) : IResponse;
    var keyword : string;
    begin
        keyword := request.getQueryParam('keyword');
        articleParams.writeString('keyword', keyword);
        articleModel.read(articleParams);
        result := inherited handleRequest(request, response);
    end;

end.
