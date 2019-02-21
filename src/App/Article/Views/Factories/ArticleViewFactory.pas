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
    var headerAndContentView : IView;
    begin
        //TCompositeView can only compose from two views
        //We need to display three views: header part, main content, and footer
        //so we need to daisy-chained two composite view
        headerAndContentView := TCompositeView.create(
            container.get('headerView') as IView,
            TArticleView.create(container.get('articleModel') as IModelReader)
        );
        result := TCompositeView.create(
            headerAndContentView,
            container.get('footerView') as IView
        );
    end;
end.
