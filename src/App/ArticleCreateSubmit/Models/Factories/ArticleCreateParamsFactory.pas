(*!------------------------------------------------------------
 * Fano Framework Elasticsearch Sample Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-elasticsearch
 * @copyright Copyright (c) 2019 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-elasticsearch/blob/master/LICENSE (GPL-3.0)
 *------------------------------------------------------------- *)
unit ArticleCreateParamsFactory;

interface

uses
    fano;

type

    (*!-----------------------------------------------
     * Factory for model TArticleParams
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TArticleCreateParamsFactory = class(TFactory)
    private
        fActualFactory : IDependencyFactory;
    public
        constructor create(const factory : IDependencyFactory);
        destructor destroy(); override;
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses
    {*! -------------------------------
        unit interfaces
    ----------------------------------- *}
    ArticleCreateParams;

    constructor TArticleCreateParamsFactory.create(const factory : IDependencyFactory);
    begin
        fActualFactory := factory;
    end;

    destructor TArticleCreateParamsFactory.destroy();
    begin
        fActualFactory := nil;
        inherited destroy();
    end;

    function TArticleCreateParamsFactory.build(const container : IDependencyContainer) : IDependency;
    var
        actualParams : IModelParams;
    begin
        actualParams := container['param'] as IModelParams;
        result := TArticleCreateParams.create(actualParams);
    end;
end.
