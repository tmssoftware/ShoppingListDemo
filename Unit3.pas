unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TMSFNCTypes, FMX.TMSFNCUtils, FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes,
  System.Rtti, FMX.TMSFNCDataGridCell, FMX.TMSFNCDataGridData,
  FMX.TMSFNCDataGridBase, FMX.TMSFNCDataGridCore, FMX.TMSFNCDataGridRenderer,
  Data.DB, FMX.TMSFNCCloudStellarDataStoreDataSet, FMX.TMSFNCCustomComponent,
  FMX.TMSFNCDataGridDatabaseAdapter, FMX.TMSFNCCustomControl, FMX.TMSFNCDataGrid,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.TMSFNCStyles, FMX.TMSFNCToolBar, IOUtils,
  FMX.Edit, FMX.TMSFNCEdit;

type
  TForm3 = class(TForm)
    TMSFNCDataGridDatabaseAdapter1: TTMSFNCDataGridDatabaseAdapter;
    DataSource1: TDataSource;
    TMSFNCCloudStellarDataStoreDataSetFMX1: TTMSFNCCloudStellarDataStoreDataSetFMX;
    TMSFNCCloudStellarDataStoreDataSetFMX1id: TIntegerField;
    TMSFNCCloudStellarDataStoreDataSetFMX1Item: TStringField;
    TMSFNCCloudStellarDataStoreDataSetFMX1Quantity: TIntegerField;
    TMSFNCCloudStellarDataStoreDataSetFMX1DateAdded: TDateTimeField;
    TMSFNCCloudStellarDataStoreDataSetFMX1User: TStringField;
    TMSFNCCloudStellarDataStoreDataSetFMX1Priority: TIntegerField;
    TMSFNCCloudStellarDataStoreDataSetFMX1Finished: TBooleanField;
    TMSFNCToolBarButton1: TTMSFNCToolBarButton;
    TMSFNCStylesManager1: TTMSFNCStylesManager;
    TMSFNCDataGrid1: TTMSFNCDataGrid;

    procedure TMSFNCToolBarButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FUsername: string;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}
{$R *.XLgXhdpiTb.fmx ANDROID}
{$R *.LgXhdpiTb.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TForm3.FormCreate(Sender: TObject);
begin
  TMSFNCCloudStellarDataStoreDataSetFMX1.PersistTokens.Key := TPath.GetDocumentsPath + PathDelim + 'StellarDSGridDemo.ini';
   TMSFNCCloudStellarDataStoreDataSetFMX1.Active := True;
end;

procedure TForm3.TMSFNCToolBarButton1Click(Sender: TObject);
begin
  TMSFNCCloudStellarDataStoreDataSetFMX1.Append;
  TMSFNCCloudStellarDataStoreDataSetFMX1DateAdded.Value := Now;
  TMSFNCCloudStellarDataStoreDataSetFMX1User.Value := FUserName;
  TMSFNCCloudStellarDataStoreDataSetFMX1.Post;
  TMSFNCDataGrid1.FocusedCell := MakeCell(TMSFNCDatagrid1.FocusedCell.Column + 1, TMSFNCDatagrid1.FocusedCell.Row);
  TMSFNCDataGrid1.EditCell(TMSFNCDataGrid1.FocusedCell)
end;

end.
