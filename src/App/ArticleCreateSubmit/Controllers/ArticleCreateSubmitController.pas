(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit ArticleCreateSubmitController;

interface

uses

    fano;

type

    (*!-----------------------------------------------
     * controller that handle route :
     * /article/create POST
     *
     * See Routes/ArticleCreate/routes.inc
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TArticleCreateSubmitController = class(TAbstractController)
    private
        fArticleCreate : IModelWriter;
        fParams : IModelParams;
    public
        constructor create(
            const articleCreateModel : IModelWriter;
            const modelParams : IModelParams
        );
        destructor destroy(); override;

        (*!-------------------------------------------
         * handle request
         *--------------------------------------------
         * @param request object represent current request
         * @param response object represent current response
         * @param args object represent current route arguments
         * @return new response
         *--------------------------------------------*)
        function handleRequest(
            const request : IRequest;
            const response : IResponse;
            const args : IRouteArgsReader
        ) : IResponse; override;

    end;

implementation

    constructor TArticleCreateSubmitController.create(
        const articleCreateModel : IModelWriter;
        const modelParams : IModelParams
    );
    begin
        fArticleCreate := articleCreateModel;
        fParams := modelParams;
    end;

    destructor TArticleCreateSubmitController.destroy();
    begin
        fArticleCreate := nil;
        fParams := nil;
        inherited destroy();
    end;

    (*!-------------------------------------------
     * handle request
     *--------------------------------------------
     * @param request object represent current request
     * @param response object represent current response
     * @param args object represent current route arguments
     * @return new response
     *--------------------------------------------*)
    function TArticleCreateSubmitController.handleRequest(
        const request : IRequest;
        const response : IResponse;
        const args : IRouteArgsReader
    ) : IResponse;
    begin
        fParams.writeString('name', request.getParam('title'));
        fParams.writeString('author', request.getParam('author'));
        fParams.writeString('content', request.getParam('content'));
        fParams.writeString('tags', request.getParam('tags'));
        fArticleCreate.write(fParams);
        result := TRedirectResponse.create(response.headers, '/');
    end;

end.
