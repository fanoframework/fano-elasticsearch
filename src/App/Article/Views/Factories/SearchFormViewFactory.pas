(*!------------------------------------------------------------
 * Fano MVC Sample Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-mvc.git
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-mvc/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
unit SearchFormViewFactory;

interface

uses
    fano;

type

    (*!-----------------------------------------------
     * Factory for search form
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *------------------------------------------------*)
    TSearchFormViewFactory = class(TFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses

    SysUtils;

    function TSearchFormViewFactory.build(const container : IDependencyContainer) : IDependency;
    var fileReader : IFileReader;
    begin
        fileReader := container.get('fileReader') as IFileReader;
        result := TView.create(
            container.get('templateParser') as ITemplateParser,
            fileReader.readFile(
                extractFileDir(getCurrentDir()) + '/resources/Templates/searchform.html'
            )
        );
    end;
end.
