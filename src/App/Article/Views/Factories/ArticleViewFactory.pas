(*!------------------------------------------------------------
 * Fano Framework Elasticsearch Sample Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-elasticsearch
 * @copyright Copyright (c) 2019 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-elasticsearch/blob/master/LICENSE (GPL-3.0)
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
    var headerAndContentView, contentView : IView;
    begin
        contentView := TCompositeView.create(
            container.get('searchForm') as IView,
            TArticleView.create(container.get('articleModel') as IModelReader)
        );
        //TCompositeView can only compose from two views
        //We need to display three views: header part, main content, and footer
        //so we need to daisy-chained two composite view
        headerAndContentView := TCompositeView.create(
            container.get('headerView') as IView,
            contentView
        );
        result := TCompositeView.create(
            headerAndContentView,
            container.get('footerView') as IView
        );
    end;
end.
