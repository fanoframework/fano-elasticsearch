(*!------------------------------------------------------------
 * Fano Framework Elasticsearch Sample Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-elasticsearch
 * @copyright Copyright (c) 2019 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-elasticsearch/blob/master/LICENSE (GPL-3.0)
 *------------------------------------------------------------- *)
unit ArticleControllerFactory;

interface

uses
    fano;

type

    (*!-----------------------------------------------
     * Factory for controller TArticleController
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TArticleControllerFactory = class(TFactory, IDependencyFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses
    sysutils,

    {*! -------------------------------
        unit interfaces
    ----------------------------------- *}
    ArticleController;

    function TArticleControllerFactory.build(const container : IDependencyContainer) : IDependency;
    var viewParams : IViewParameters;
        config : IAppConfiguration;
    begin
        viewParams := container.get('viewParams') as IViewParameters;
        config := container.get('config') as IAppConfiguration;
        viewParams.setVar('baseUrl', config.getString('baseUrl'));
        viewParams.setVar('appName', config.getString('appName'));
        result := TArticleController.create(
            container.get('articleView') as IView,
            viewParams,
            container.get('articleModel') as IModelReader,
            container.get('articleParams') as IModelParams
        );
    end;
end.
