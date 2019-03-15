(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit ArticleSubmitModelFactory;

interface

uses
    fano;

type

    (*!-----------------------------------------------
     * Factory for model TArticleSubmitModel
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TArticleSubmitModelFactory = class(TFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses

    SysUtils,

    {*! -------------------------------
        unit interfaces
    ----------------------------------- *}
    ArticleSubmitModel;

    function TArticleSubmitModelFactory.build(const container : IDependencyContainer) : IDependency;
    var config : IAppConfiguration;
    begin
        config := container.get('config') as IAppConfiguration;
        result := TArticleSubmitModel.create(
            config.getString('elasticsearch.url') + config.getString('elasticsearch.index'),
            container.get('httpPost') as IHttpPostClient,
            container.get('httpPost') as IHttpClientHeaders
        );
    end;
end.
