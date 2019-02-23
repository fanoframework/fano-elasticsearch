(*!------------------------------------------------------------
 * Fano Framework Elasticsearch Sample Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-elasticsearch
 * @copyright Copyright (c) 2019 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-elasticsearch/blob/master/LICENSE (GPL-3.0)
 *------------------------------------------------------------- *)
unit ArticleParams;

interface

{$MODE OBJFPC}
{$H+}

uses

    fano;

type

    (*!-----------------------------------------------
     * article params
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TArticleParams = class(TInjectableObject, IModelParams, ISerializeable)
    private
        keyword : string;
    public
        function writeString(const key : shortstring; const value : string) : IModelParams; overload;
        function writeInteger(const key : shortstring; const value : integer) : IModelParams; overload;

        function readString(const key : shortstring) : string; overload;
        function readInteger(const key : shortstring) : integer; overload;
        function serialize() : string;
    end;

implementation

    function TArticleParams.writeString(const key : shortstring; const value : string) : IModelParams;
    begin
        if key = 'keyword' then
        begin
           keyword := value;
        end;
        result := self;
    end;

    function TArticleParams.writeInteger(const key : shortstring; const value : integer) : IModelParams;
    begin
        //intentionally do nothing
        result := self;
    end;

    function TArticleParams.readString(const key : shortstring) : string;
    begin
        result := '';
        if key = 'keyword' then
        begin
           result := keyword;
        end;
    end;

    function TArticleParams.readInteger(const key : shortstring) : integer;
    begin
        //intentionally do nothing
        result := 0;
    end;

    function TArticleParams.serialize() : string;
    begin
        result := '';
        if (length(keyword) > 0) then
        begin
            result := 'q=' + keyword;
        end;
    end;
end.
