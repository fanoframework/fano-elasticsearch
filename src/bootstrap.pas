(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit bootstrap;

interface

uses

    fano;

type

    TAppServiceProvider = class(TDaemonAppServiceProvider)
    protected
        function buildAppConfig(const container : IDependencyContainer) : IAppConfiguration; override;

    public
        procedure register(const container : IDependencyContainer); override;
    end;

    TAppRoutes = class(TRouteBuilder)
    public
        procedure buildRoutes(
            const container : IDependencyContainer;
            const router : IRouter
        ); override;
    end;

implementation

uses
    sysutils,

    HeaderViewFactory,
    FooterViewFactory,
    ArticleControllerFactory,
    SearchFormViewFactory,
    ArticleViewFactory,
    ArticleModelFactory,
    ArticleParamsFactory,
    ArticleCreateControllerFactory,
    ArticleCreateViewFactory,
    ArticleCreateModelFactory,
    ArticleCreateParamsFactory,
    ArticleCreateSubmitControllerFactory;


    function TAppServiceProvider.buildAppConfig(const container : IDependencyContainer) : IAppConfiguration;
    begin
        container.add(
            'config',
            TJsonFileConfigFactory.create(
                extractFileDir(getCurrentDir()) + '/config/config.json'
            )
        );
        result := container['config'] as IAppConfiguration;

    end;

    procedure TAppServiceProvider.register(const container : IDependencyContainer);
    begin
        {$INCLUDE Dependencies/dependencies.inc}
    end;

    procedure TAppRoutes.buildRoutes(
        const container : IDependencyContainer;
        const router : IRouter
    );
    begin
        {$INCLUDE Routes/routes.inc}
    end;
end.
