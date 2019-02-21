(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit ArticleModel;

interface

{$MODE OBJFPC}
{$H+}

uses

    fpjson,
    fano;

type

    (*!-----------------------------------------------
     * model instance
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TArticleModel = class(TInjectableObject, IModelReader, IModelReadOnlyData)
    private
        apiBaseUrl  : string;
        httpClient : IHttpGetClient;
        jsonData : TJSONData;
        indx : integer;
    public
        constructor create(const baseUrl : string; const http : IHttpGetClient);
        destructor destroy(); override;

        function read(const params : IModelWriteOnlyData = nil) : IModelReadOnlyData;
        function data() : IModelReadOnlyData;

        (*!------------------------------------------------
         * get total data
         *-----------------------------------------------
         * @return total data
         *-----------------------------------------------*)
        function count() : int64;

        (*!------------------------------------------------
         * test if in end of result set
         *-----------------------------------------------
         * @return true if no more record
         *-----------------------------------------------*)
        function eof() : boolean;

        (*!------------------------------------------------
         * move data pointer to next record
         *-----------------------------------------------
         * @return true if successful, false if no more record
         *-----------------------------------------------*)
        function next() : boolean;

        (*!------------------------------------------------
         * read data from current active record by its name
         *-----------------------------------------------
         * @return value in record
         *-----------------------------------------------*)
        function readString(const key : string) : string;
    end;

implementation

uses

    Classes,
    SysUtils,
    jsonparser;

    constructor TArticleModel.create(const baseUrl : string; const http : IHttpGetClient);
    begin
        apiBaseUrl := baseUrl;
        httpClient := http;
        jsonData := nil;
        indx := 0;
    end;

    destructor TArticleModel.destroy();
    begin
        inherited destroy();
        httpClient := nil;
        freeAndNil(jsonData);
    end;

    function TArticleModel.read(
        const params : IModelWriteOnlyData = nil
    ) : IModelReadOnlyData;
    var response : IResponseStream;
    begin
        if (assigned(jsonData)) then
        begin
            freeAndNil(jsonData);
        end;

        response := httpClient.get(apiBaseUrl + '/books/elasticsearch/1');
        jsonData := getJSON(response.read());

        result := self;
    end;

    function TArticleModel.data() : IModelReadOnlyData;
    begin
        result := self;
    end;

    (*!------------------------------------------------
     * get total data
     *-----------------------------------------------
     * @return total data
     *-----------------------------------------------*)
    function TArticleModel.count() : int64;
    begin
        result := 1;
    end;

    (*!------------------------------------------------
     * test if in end of result set
     *-----------------------------------------------
     * @return true if no more record
     *-----------------------------------------------*)
    function TArticleModel.eof() : boolean;
    begin
        result := (indx = count());
    end;

    (*!------------------------------------------------
     * move data pointer to next record
     *-----------------------------------------------
     * @return true if successful, false if no more record
     *-----------------------------------------------*)
    function TArticleModel.next() : boolean;
    begin
        result := not eof();
        inc(indx);
    end;

    (*!------------------------------------------------
     * read data from current active record by its name
     *-----------------------------------------------
     * @return value in record
     *-----------------------------------------------*)
    function TArticleModel.readString(const key : string) : string;
    begin
        result := jsonData.getPath(key).asString;
    end;
end.
