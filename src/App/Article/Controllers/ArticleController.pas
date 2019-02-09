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
    TArticleController = class(TRouteHandler, IDependency)
    public
        function handleRequest(
            const request : IRequest;
            const response : IResponse
        ) : IResponse; override;
    end;

implementation

    function TArticleController.handleRequest(
          const request : IRequest;
          const response : IResponse
    ) : IResponse;
    begin
        {---put your code here---}
        //response.body().write('nice');
        result := response;
    end;

end.
