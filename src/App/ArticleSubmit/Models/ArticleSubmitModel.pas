(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit ArticleSubmitModel;

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
    TArticleSubmitModel = class(TInjectableObject, IModelWriter, IModelParams, ISerializeable)
    private
        createClient : IHttpPostClient;
        createHeaders : IHttpClientHeaders;
        apiBaseUrl : string;
        title, content, tags, author : string;
    public
        constructor create(
            const baseUrl : string;
            const createClientInst : IHttpPostClient;
            const createHeadersInst : IHttpClientHeaders
        );
        destructor destroy(); override;

        (*!----------------------------------------------
         * write data to storage
         *-----------------------------------------------
         * @param params parameters related to data being stored
         * @param data data being stored
         * @return current instance
         *-----------------------------------------------*)
        function write(const params : IModelParams; const data : IModelParams) : IModelWriter;

        function writeString(const key : shortstring; const value : string) : IModelParams; overload;
        function writeInteger(const key : shortstring; const value : integer) : IModelParams; overload;

        function readString(const key : shortstring) : string; overload;
        function readInteger(const key : shortstring) : integer; overload;

        function serialize() : string;
    end;

implementation

uses

    Classes,
    SysUtils;

    constructor TArticleSubmitModel.create(
        const baseUrl : string;
        const createClientInst : IHttpPostClient;
        const createHeadersInst : IHttpClientHeaders
    );
    begin
        apiBaseUrl := baseUrl;
        createClient := createClientInst;
        createHeaders := createHeadersInst;
    end;

    destructor TArticleSubmitModel.destroy();
    begin
        inherited destroy();
        createClient := nil;
        createHeaders := nil;
    end;

    (*!----------------------------------------------
     * write data to storage
     *-----------------------------------------------
     * @param params parameters related to data being stored
     * @param data data being stored
     * @return current instance
     *-----------------------------------------------*)
    function TArticleSubmitModel.write(const params : IModelParams; const data : IModelParams) : IModelWriter;
    begin
        createHeaders.add('Content-Type: application/json').apply();
        createClient.post(apiBaseUrl, self);
        result := self;
    end;

    function TArticleSubmitModel.writeString(const key : shortstring; const value : string) : IModelParams;
    begin
        case key of
            'title' : title := value;
            'content' : content := value;
            'author' : author := value;
            'tags' : tags := value;
        end;
        result := self;
    end;

    function TArticleSubmitModel.writeInteger(const key : shortstring; const value : integer) : IModelParams;
    begin
        //not implemented
        result := self;
    end;

    function TArticleSubmitModel.readString(const key : shortstring) : string;
    begin
        result := '';
        case key of
            'title' : result := title;
            'content' : result := content;
            'author' : result := author;
            'tags' : result := tags;
        end;
    end;

    function TArticleSubmitModel.readInteger(const key : shortstring) : integer;
    begin
        //not implemented
        result := 0;
    end;

    function TArticleSubmitModel.serialize() : string;
    begin
        result := format(
            '{ "title" : "%s", "content" : "%s", "tags" : [%s], "author" : "%s"}',
            [title, content, tags, author]
        );
    end;
end.
