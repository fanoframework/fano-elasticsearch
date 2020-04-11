(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fanoframework.github.io)
 *
 * @link      https://fanoframework.github.io
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-app/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
unit ArticleView;

interface

uses

    fano;

type

    (*!-----------------------------------------------
     * View instance for article listing page
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *------------------------------------------------*)
    TArticleView = class(TInjectableObject, IView)
    private
        articleModel : IModelReader;
    public
        constructor create(const model : IModelReader);
        destructor destroy(); override;

        (*!------------------------------------------------
         * render view
         *------------------------------------------------
         * @param viewParams view parameters
         * @param response response instance
         * @return response
         *-----------------------------------------------*)
        function render(
            const viewParams : IViewParameters;
            const response : IResponse
        ) : IResponse;
    end;

implementation

    constructor TArticleView.create(const model : IModelReader);
    begin
        articleModel := model;
    end;

    destructor TArticleView.destroy();
    begin
        articleModel := nil;
        inherited destroy();
    end;

    (*!------------------------------------------------
     * render view
     *------------------------------------------------
     * @param viewParams view parameters
     * @param response response instance
     * @return response
     *-----------------------------------------------*)
    function TArticleView.render(
        const viewParams : IViewParameters;
        const response : IResponse
    ) : IResponse;
    var articleData : IModelResultSet;
        respBody : IResponseStream;
    begin
        articleData := articleModel.data();
        respBody := response.body();
        if (articleData.count() > 0) then
        begin
            respBody.write(
                '<div class="container">' +
                '<table class="table is-fullwidth is-hoverable">' +
                '<thead>' +
                  '<tr>' +
                  '  <th>No</th>' +
                  '  <th>Title</th>' +
                  '  <th>Author</th>' +
                  '</tr>' +
                '</thead><tbody>'
            );
            while not articleData.eof() do
            begin
                respBody.write(
                    '<tr>' +
                    '<td>' + articleData.readString('_id') + '</td>' +
                    '<td>' + articleData.readString('_source.name') + '</td>' +
                    '<td>' + articleData.readString('_source.author') + '</td>' +
                    '</tr>'
                );
                articleData.next();
            end;
            respBody.write('</tbody></table></div>');
        end else
        begin
            respBody.write('<div class="container">No articles matched.</div>');
        end;
        result := response;
    end;

end.
