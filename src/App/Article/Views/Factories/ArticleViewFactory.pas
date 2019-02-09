(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit ArticleViewFactory;

interface

uses
    fano;

type

    (*!-----------------------------------------------
     * Factory for view TArticleView
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TArticleViewFactory = class(TFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses

    SysUtils,

    {*! -------------------------------
        unit interfaces
    ----------------------------------- *}
    ArticleView;

    function TArticleViewFactory.build(const container : IDependencyContainer) : IDependency;
    begin
        result := TArticleView.create();
    end;
end.