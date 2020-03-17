(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit ArticlePostController;

interface

{$MODE OBJFPC}
{$H+}

uses

    fano;

type

    (*!-----------------------------------------------
     * controller that handle route :
     * /articlepost
     *
     * See Routes/ArticlePost/routes.inc
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TArticlePostController = class(TAbstractController)
    private
        fPostCreator : IModelWriter;
    public
        constructor create(const postCreator : IModelWriter);
        destructor destroy(); override;

        function handleRequest(
            const request : IRequest;
            const response : IResponse;
            const args : IRouteArgsReader
        ) : IResponse; override;
    end;

implementation

    constructor TArticlePostController.create(const postCreator : IModelWriter);
    begin
        fPostCreator := postCreator;
    end;

    destructor TArticlePostController.destroy();
    begin
        fPostCreator := nil;
        inherited destroy();
    end;

    function TArticlePostController.handleRequest(
        const request : IRequest;
        const response : IResponse;
        const args : IRouteArgsReader
    ) : IResponse;
    // var
    //     data : IModelParams;
    begin
        //data := TModelParam.create();
        // data.writeString('username', 'zzz@sas');
        // fPostCreator.write(
        //     TModelParam.create(),
        //     data
        // );
        result := TRedirectResponse.create(response.headers, '/articles');
    end;

end.
