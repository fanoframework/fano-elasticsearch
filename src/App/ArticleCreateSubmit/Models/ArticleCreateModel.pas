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
        fHttpClient : IHttpPostClient;
        fHttpHeaders : IHttpClientHeaders;
    public
        constructor create(
            const baseUrl : string;
            const httpPost : IHttpPostClient;
            const headers : IHttpClientHeaders
        );
        destructor destroy(); override;

        function write(
            const data : IModelParams;
            const params : IModelParams = nil
        ) : IModelWriter;
    end;

implementation

uses

    Classes,
    SysUtils;

    constructor TArticleCreateModel.create(
        const baseUrl : string;
        const httpPost : IHttpPostClient;
        const headers : IHttpClientHeaders
    );
    begin
        apiBaseUrl := baseUrl;
        fHttpClient := httpPost;
        fHttpHeaders := headers;
    end;

    destructor TArticleCreateModel.destroy();
    begin
        fHttpClient := nil;
        fHttpHeaders := nil;
        inherited destroy();
    end;

    function TArticleCreateModel.write(
        const data : IModelParams;
        const params : IModelParams = nil
    ) : IModelWriter;
    //var response : IResponseStream;
    begin
        fHttpHeaders.add('Content-Type', 'application/json');
        fHttpClient.post(apiBaseUrl + '/_doc', data);
        result := self;
    end;

end.
