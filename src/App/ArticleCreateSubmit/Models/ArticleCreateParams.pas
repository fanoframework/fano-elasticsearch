(*!------------------------------------------------------------
 * Fano Framework Elasticsearch Sample Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-elasticsearch
 * @copyright Copyright (c) 2019 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-elasticsearch/blob/master/LICENSE (GPL-3.0)
 *------------------------------------------------------------- *)
unit ArticleCreateParams;

interface

{$MODE OBJFPC}
{$H+}

uses

    fano;

type

    (*!-----------------------------------------------
     * article creation params
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TArticleCreateParams = class(TDecoratorModelParams)
    private
        function serializeTags(const tags : string) : string;
    public
        function serialize() : string; override;
    end;

implementation

uses

    sysutils;

    function TArticleCreateParams.serializeTags(const tags : string) : string;
    var tagArr : TStringArray;
        i : integer;
    begin
        tagArr := tags.split(',');
        if length(tagArr) > 0 then
        begin
            result := ', "tags" : [';
            for i:= 0 to length(tagArr) - 2 do
            begin
                result := result + '"' + tagArr[i] + '",';
            end;
            result := result + '"' + tagArr[length(tagArr) - 1] + '"]';
        end else
        begin
            result := '';
        end;
    end;

    function TArticleCreateParams.serialize() : string;
    begin
        result := '{' +
            '"name" : "' + fActualParams.readString('name') + '",' +
            '"author" : "' + fActualParams.readString('author') + '",' +
            '"content" : "' + fActualParams.readString('content') + '"' +
            serializeTags(fActualParams.readString('tags')) +
        '}';
    end;
end.
