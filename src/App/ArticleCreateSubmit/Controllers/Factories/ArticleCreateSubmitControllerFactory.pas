(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit ArticleCreateSubmitControllerFactory;

interface

uses
    fano;

type

    (*!-----------------------------------------------
     * Factory for controller TArticleCreateController
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TArticleCreateSubmitControllerFactory = class(TFactory, IDependencyFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses
    sysutils,

    {*! -------------------------------
        unit interfaces
    ----------------------------------- *}
    ArticleCreateSubmitController;

    function TArticleCreateSubmitControllerFactory.build(const container : IDependencyContainer) : IDependency;
    begin
        result := TArticleCreateSubmitController.create(
            container['articleCreateModel'] as IModelWriter,
            container['articleCreateParams'] as IModelParams
        );
    end;
end.
