unit rs2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,
  rs2_options;

type

  { TRs2 }

  TRs2 = class
  private
    FOptions: TOptions;
  published
    property options: TOptions read FOptions write FOptions;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TRs2 }

constructor TRs2.Create;
begin
  FOptions := TOptions.Create;
end;

destructor TRs2.Destroy;
begin
  FreeAndNil(FOptions);
  inherited Destroy;
end;

end.
