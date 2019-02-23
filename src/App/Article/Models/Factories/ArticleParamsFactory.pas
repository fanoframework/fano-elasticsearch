(*!------------------------------------------------------------
 * Fano Framework Elasticsearch Sample Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-elasticsearch
 * @copyright Copyright (c) 2019 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-elasticsearch/blob/master/LICENSE (GPL-3.0)
 *------------------------------------------------------------- *)
unit ArticleParamsFactory;

interface

uses
    fano;

type

    (*!-----------------------------------------------
     * Factory for model TArticleParams
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TArticleParamsFactory = class(TFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses
    {*! -------------------------------
        unit interfaces
    ----------------------------------- *}
    ArticleParams;

    function TArticleParamsFactory.build(const container : IDependencyContainer) : IDependency;
    begin
        result := TArticleParams.create();
    end;
end.
