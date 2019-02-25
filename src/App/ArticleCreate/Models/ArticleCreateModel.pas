(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit ArticleCreateModel;

interface

{$MODE OBJFPC}
{$H+}

uses

    fano;

type

    (*!-----------------------------------------------
     * model instance
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TArticleCreateModel = class(TInjectableObject, IModelWriter)
    private
        apiBaseUrl : string;
        httpClient : IHttpPostClient;
    public
        constructor create(const baseUrl : string; const httpPost : IHttpPostClient);
        destructor destroy(); override;

        function write(
            const params : IModelParams = nil;
            const data : IModelParams = nil
        ) : IModelWriter;
    end;

implementation

uses

    Classes,
    SysUtils;

    constructor TArticleCreateModel.create(const baseUrl : string; const httpPost : IHttpPostClient);
    begin
        apiBaseUrl := baseUrl;
        httpClient := httpPost;
    end;

    destructor TArticleCreateModel.destroy();
    begin
        inherited destroy();
        httpClient := nil;
    end;

    function TArticleCreateModel.write(
        const params : IModelParams = nil;
        const data : IModelParams = nil
    ) : IModelWriter;
    //var response : IResponseStream;
    begin
        httpClient.post(apiBaseUrl, data as ISerializeable);
        result := self;
    end;

end.
