unit UntSplash;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Devices,


  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Objects;

type
  TfSplash = class(TForm)
    Rectangle1: TRectangle;
    Image1: TImage;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Paint(Sender: TObject; Canvas: TCanvas;
      const ARect: TRectF);
  private
    FInitialized : Boolean;
    procedure LoadMainForm;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSplash: TfSplash;

implementation

uses
  UntMain;

{$R *.fmx}

procedure TfSplash.FormCreate(Sender: TObject);
begin
  Timer1.Enabled  := False;
  Timer1.Interval := 2000;
end;

procedure TfSplash.Image1Paint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
begin
  Timer1.Enabled := not FInitialized;
end;

procedure TfSplash.LoadMainForm;
type
  TFormClass = class of TForm;
var
  Frm     : TForm;
  FrmClass : TFormClass;
begin
  FrmClass := nil;

  case TDeviceInfo.ThisDevice.DeviceClass of
    TDeviceInfo.TDeviceClass.Desktop : FrmClass := TfMain;
    TDeviceInfo.TDeviceClass.Phone   : FrmClass := TfMain;
    TDeviceInfo.TDeviceClass.Tablet  : FrmClass := TfMain;
  end;

  if FrmClass <> nil then
  begin
    Frm := FrmClass.Create(Application);
    Frm.Show;
    Application.MainForm := Frm;
  end
  else
  begin
    ShowMessage('Formulário Inválido.');
  end;
  Close; //Fecha o form Splash
end;

procedure TfSplash.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  if not FInitialized then
  begin
    FInitialized := True;
    LoadMainForm;
  end;
end;

end.
