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
    TArticleSubmitModel = class(TInjectableObject, IModelReader, IModelResultSet)
    private
        rdbmsInstance : IRdbms;
        resultSet : IRdbmsResultSet;
    public
        constructor create(const db : IRdbms);
        destructor destroy(); override;

        function read(const params : IModelParams = nil) : IModelResultSet;
        function data() : IModelResultSet;

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
    SysUtils;

    constructor TArticleSubmitModel.create(const db : IRdbms);
    begin
        rdbmsInstance := db;
        resultSet := nil;
    end;

    destructor TArticleSubmitModel.destroy();
    begin
        inherited destroy();
        rdbmsInstance := nil;
        resultSet := nil;
    end;

    function TArticleSubmitModel.read(
        const params : IModelParams = nil
    ) : IModelResultSet;
    begin
        {---put code to retrieve data from storage here---}
        //resultSet := rdbmsInstance.prepare('SELECT * FROM articlesubmits').execute();
        result := self;
    end;

    function TArticleSubmitModel.data() : IModelResultSet;
    begin
        result := self;
    end;

    (*!------------------------------------------------
     * get total data
     *-----------------------------------------------
     * @return total data
     *-----------------------------------------------*)
    function TArticleSubmitModel.count() : int64;
    begin
        result := resultSet.resultCount();
    end;

    (*!------------------------------------------------
     * test if in end of result set
     *-----------------------------------------------
     * @return true if no more record
     *-----------------------------------------------*)
    function TArticleSubmitModel.eof() : boolean;
    begin
        result := resultSet.eof();
    end;

    (*!------------------------------------------------
     * move data pointer to next record
     *-----------------------------------------------
     * @return true if successful, false if no more record
     *-----------------------------------------------*)
    function TArticleSubmitModel.next() : boolean;
    begin
        result := not resultSet.eof();
        resultSet.next();
    end;

    (*!------------------------------------------------
     * read data from current active record by its name
     *-----------------------------------------------
     * @return value in record
     *-----------------------------------------------*)
    function TArticleSubmitModel.readString(const key : string) : string;
    begin
        result := resultSet.fields().fieldByName(key).asString;
    end;
end.