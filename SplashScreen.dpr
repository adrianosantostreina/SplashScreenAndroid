program SplashScreen;

uses
  System.StartUpCopy,
  FMX.Forms,
  UntMain in 'UntMain.pas' {fMain},
  UntSplash in 'UntSplash.pas' {fSplash};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfSplash, fSplash);
  Application.Run;
end.
