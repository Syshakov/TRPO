unit PhisicsControllerUnit;

interface

uses
  ResultTestUnit, ResultsUnit, MenuUnit, MainUnit, test1unit, testsunit,
  System.Generics.Collections {TDictionary} ,
  ControllersUnit;

type
  PhisicsController = class(TInterfacedObject, Controllers)
  private
    fio1: string;
    FileName : string;
    /// <link>aggregation</link>
    Test: Tests;
    /// <link>aggregation</link>
    Menu1: Main;
  public
    procedure FIO(fio: string);
    procedure setTest(caption: string);
    function getFIO: string;
    function start: boolean;
    function getMenu(FileName: string): TList<string>;
    function getQuestCaption: string;
    function getListAnswer: TList<string>;
  end;

implementation

{ PhisicsController }

procedure PhisicsController.FIO(FIO: string);
begin
  Menu1.FIO(FIO);
end;

function PhisicsController.getFIO: string;
begin
  result:= Menu1.getFIO;
end;

function PhisicsController.getListAnswer: TList<string>;
begin
   result:= Test.getListAnswer;
end;

function PhisicsController.getMenu(FileName: string): TList<string>;
begin
  Self.FileName:= FileName;
  result := TList<string>.create;
  Menu1 := Menu.create;
  result := Menu1.getMenu(FileName);
end;

function PhisicsController.getQuestCaption: string;
begin
  result:= Test.getQuestCaption;
end;

procedure PhisicsController.setTest(caption: string);
begin
  Test:= Test1.create(FileName);
  Test.setTest(caption);
end;

function PhisicsController.start: boolean;
begin
  result:= Test.start;
end;

end.
