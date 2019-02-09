(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit ArticleModelFactory;

interface

uses
    fano;

type

    (*!-----------------------------------------------
     * Factory for model TArticleModel
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TArticleModelFactory = class(TFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses

    SysUtils,

    {*! -------------------------------
        unit interfaces
    ----------------------------------- *}
    ArticleModel;

    function TArticleModelFactory.build(const container : IDependencyContainer) : IDependency;
    var db : IRdbms;
    begin
        {---initialize database here---}
        { db := container.get('db') as IRdbms;}
        result := TArticleModel.create(db);
    end;
end.