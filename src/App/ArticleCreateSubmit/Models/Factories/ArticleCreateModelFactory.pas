(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit ArticleCreateModelFactory;

interface

uses
    fano;

type

    (*!-----------------------------------------------
     * Factory for model TArticleCreateModel
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TArticleCreateModelFactory = class(TFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses

    SysUtils,

    {*! -------------------------------
        unit interfaces
    ----------------------------------- *}
    ArticleCreateModel;
    function TArticleCreateModelFactory.build(const container : IDependencyContainer) : IDependency;
    var config : IAppConfiguration;
    begin
        config := container.get('config') as IAppConfiguration;
        result := TArticleCreateModel.create(
            config.getString('elasticsearch.url') + config.getString('elasticsearch.index'),
            container.get('httpPost') as IHttpPostClient,
            container.get('httpPost') as IHttpClientHeaders
        );
    end;
end.
