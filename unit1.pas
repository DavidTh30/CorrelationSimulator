unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls, TAGraph, TASources, TASeries;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Chart2LineSeries1: TLineSeries;
    Chart6: TChart;
    Label1: TLabel;
    Label2: TLabel;
    Label_Serquent: TLabel;
    Label_Counter: TLabel;
    Label_AvgSource1: TLabel;
    Label_AvgSource2: TLabel;
    lcsDerivative4: TListChartSource;
    PageControl1: TPageControl;
    Source1_1: TEdit;
    Source1_10: TEdit;
    Source2_1: TEdit;
    Source1_2: TEdit;
    Source1_3: TEdit;
    Source1_4: TEdit;
    Source1_5: TEdit;
    Source1_6: TEdit;
    Source1_7: TEdit;
    Source1_8: TEdit;
    Source1_9: TEdit;
    Source2_10: TEdit;
    Source2_2: TEdit;
    Source2_3: TEdit;
    Source2_4: TEdit;
    Source2_5: TEdit;
    Source2_6: TEdit;
    Source2_7: TEdit;
    Source2_8: TEdit;
    Source2_9: TEdit;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure DisplayStatus();
    procedure Source1_Up_To_TargetSource1(Loop_: integer);
    procedure Source1_Down_To_Base(Loop_: integer);
    procedure Source1_Down_To_TargetSource2(Loop_: integer);
    procedure Source1_Up_To_Base(Loop_: integer);
    procedure Source2_Down_To_TarrgetSource2(Loop_: integer);
    procedure Source2_Up_To_Base(Loop_: integer);
    procedure Source2_Up_To_TargetSource1(Loop_: integer);
    procedure Source2_Down_To_Base(Loop_: integer);
    procedure Source1_Up_To_TargetSource1_Source2_Down_To_TargetSource2(Loop_: integer);
    procedure Source1_Down_To_TargetSource2_Source2_Up_To_TargetSource1(Loop_: integer);
    procedure Source1_Up_To_Base_Source2_Down_To_Base(Loop_: integer);
  private

  public

  end;

var
  Form1: TForm1;
  Base_: array of integer;
  CurrentSource1: array of integer;
  TargetSource1: array of integer;
  CurrentSource2: array of integer;
  TargetSource2: array of integer;
  Counter_: integer;
  Serquent_:integer;
  AvgSource1_:double;
  AvgSource2_:double;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  i:integer;
  TotalBase:integer;
  //TotalTargetSource:integer;
  //Finlish_:boolean;
  Gain_:integer;

begin
  Randomize();
  Setlength(Base_,10);
  Setlength(CurrentSource1,10);
  Setlength(TargetSource1,10);
  Setlength(CurrentSource2,10);
  Setlength(TargetSource2,10);
  Counter_:=0;
  Serquent_:=0;
  AvgSource1_:=0;
  AvgSource2_:=0;

  TotalBase:=0;
  for i:=0 to 9 do
  begin
   Base_[i]:=random(50)+30;
   TotalBase:=TotalBase+Base_[i];
  end;

  Gain_:=0;
  for i:=0 to 9 do
  begin
    Gain_:=Gain_+9;
    TargetSource1[i]:=Round((((100-Base_[i])/100)*Gain_)+Base_[i]);
    TargetSource2[i]:=Round(Base_[i]-(((Base_[i]-0)/100)*Gain_));
  end;

  //Finlish_:=false;
  //while Finlish_=false do
  //begin
  //  TotalTargetSource:=0;
  //  for i:=0 to 9 do
  //  begin
  //   TargetSource1[i]:=random(101);
  //   TotalTargetSource:=TotalTargetSource+TargetSource1[i];
  //  end;
  //  if(TotalTargetSource>TotalBase+30)then Finlish_:=true;
  //end;
  //showmessage(TotalTargetSource.ToString+'>'+TotalBase.ToString);

  //Finlish_:=false;
  //while Finlish_=false do
  //begin
  //  TotalTargetSource:=0;
  //  for i:=0 to 9 do
  //  begin
  //   TargetSource2[i]:=random(101);
  //   TotalTargetSource:=TotalTargetSource+TargetSource2[i];
  //  end;
  //  if(TotalTargetSource<TotalBase-30)then Finlish_:=true;
  //end;
  //showmessage(TotalTargetSource.ToString+'<'+TotalBase.ToString);

  CurrentSource1[0]:=Base_[0];
  CurrentSource1[1]:=Base_[1];
  CurrentSource1[2]:=Base_[2];
  CurrentSource1[3]:=Base_[3];
  CurrentSource1[4]:=Base_[4];
  CurrentSource1[5]:=Base_[5];
  CurrentSource1[6]:=Base_[6];
  CurrentSource1[7]:=Base_[7];
  CurrentSource1[8]:=Base_[8];
  CurrentSource1[9]:=Base_[9];

  CurrentSource2[0]:=Base_[0];
  CurrentSource2[1]:=Base_[1];
  CurrentSource2[2]:=Base_[2];
  CurrentSource2[3]:=Base_[3];
  CurrentSource2[4]:=Base_[4];
  CurrentSource2[5]:=Base_[5];
  CurrentSource2[6]:=Base_[6];
  CurrentSource2[7]:=Base_[7];
  CurrentSource2[8]:=Base_[8];
  CurrentSource2[9]:=Base_[9];
  DisplayStatus();
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  Loop_:integer;
begin
  Loop_:=40;
  if(Serquent_=0)then   //Source 1 move up to source 1
  begin
    Source1_Up_To_TargetSource1(Loop_);
    Application.ProcessMessages;
  end;

  if(Serquent_=1)then
  begin
    Counter_:=Counter_+1;
    if Counter_>=(Loop_/4) then begin Serquent_:=Serquent_+1; Counter_:=0; end;
    Application.ProcessMessages;
  end;

  if(Serquent_=2)then   //Source 1 move down to base
  begin
    Source1_Down_To_Base(Loop_);
    Application.ProcessMessages;
  end;

  if(Serquent_=3)then
  begin
    Counter_:=Counter_+1;
    if Counter_>=(Loop_/4) then begin Serquent_:=Serquent_+1; Counter_:=0; end;
    Application.ProcessMessages;
  end;

  if(Serquent_=4)then  //Source 1 move down to source 2
  begin
    Source1_Down_To_TargetSource2(Loop_);
    Application.ProcessMessages;
  end;

  if(Serquent_=5)then
  begin
    Counter_:=Counter_+1;
    if Counter_>=(Loop_/4) then begin Serquent_:=Serquent_+1; Counter_:=0; end;
    Application.ProcessMessages;
  end;

  if(Serquent_=6)then  //Source 1 move up to base
  begin
    Source1_Up_To_Base(Loop_);
    Application.ProcessMessages;
  end;

  if(Serquent_=7)then
  begin
    Counter_:=Counter_+1;
    if Counter_>=(Loop_/4) then begin Serquent_:=Serquent_+1; Counter_:=0; end;
    Application.ProcessMessages;
  end;

  if(Serquent_=8)then  //Source 2 move down to source 2
  begin
    Source2_Down_To_TarrgetSource2(Loop_);
    Application.ProcessMessages;
  end;

  if(Serquent_=9)then
  begin
    Counter_:=Counter_+1;
    if Counter_>=(Loop_/4) then begin Serquent_:=Serquent_+1; Counter_:=0; end;
    Application.ProcessMessages;
  end;

  if(Serquent_=10)then   //Source 2 move up to Base
  begin
    Source2_Up_To_Base(Loop_);
    Application.ProcessMessages;
  end;

  if(Serquent_=11)then
  begin
    Counter_:=Counter_+1;
    if Counter_>=(Loop_/4) then begin Serquent_:=Serquent_+1; Counter_:=0; end;
    Application.ProcessMessages;
  end;

  if(Serquent_=12)then   //Source 2 move up to source 1
  begin
    Source2_Up_To_TargetSource1(Loop_);
    Application.ProcessMessages;
  end;

  if(Serquent_=13)then
  begin
    Counter_:=Counter_+1;
    if Counter_>=(Loop_/4) then begin Serquent_:=Serquent_+1; Counter_:=0; end;
    Application.ProcessMessages;
  end;

  if(Serquent_=14)then   //Source 2 move down to base
  begin
    Source2_Down_To_Base(Loop_);
    Application.ProcessMessages;
  end;

  if(Serquent_=15)then
  begin
    Counter_:=Counter_+1;
    if Counter_>=(Loop_/4) then begin Serquent_:=Serquent_+1; Counter_:=0; end;
    Application.ProcessMessages;
  end;

  if(Serquent_=16)then   //Source 1 move up to source 1 and Source 2 move down to source 2
  begin
    Source1_Up_To_TargetSource1_Source2_Down_To_TargetSource2(Loop_);
    Application.ProcessMessages;
  end;

  if(Serquent_=17)then
  begin
    Counter_:=Counter_+1;
    if Counter_>=(Loop_/4) then begin Serquent_:=Serquent_+1; Counter_:=0; end;
    Application.ProcessMessages;
  end;

  if(Serquent_=18)then   //Source 1 move down to source 2 and Source 2 move up to source 1
  begin
    Source1_Down_To_TargetSource2_Source2_Up_To_TargetSource1(Loop_*2);
    Application.ProcessMessages;
  end;

  if(Serquent_=19)then
  begin
    Counter_:=Counter_+1;
    if Counter_>=(Loop_/4) then begin Serquent_:=Serquent_+1; Counter_:=0; end;
    Application.ProcessMessages;
  end;

  if(Serquent_=20)then   //Source 1 move up to base and Source 2 move down to base
  begin
    Source1_Up_To_Base_Source2_Down_To_Base(Loop_);
    Application.ProcessMessages;
  end;

  if(Serquent_=21)then
  begin
    Counter_:=Counter_+1;
    if Counter_>=(Loop_/4) then begin Serquent_:=Serquent_+1; Counter_:=0; end;
    Application.ProcessMessages;
  end;

  if(Serquent_=22)then
  begin
    Counter_:=0;
    Serquent_:=0;
    Application.ProcessMessages;
  end;

  DisplayStatus();
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Timer1.Enabled:= not Timer1.Enabled;

  if Timer1.Enabled then Button1.Caption:='Stop';
  if Not Timer1.Enabled then Button1.Caption:='Start';
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i:integer;
begin
  //lcsDerivative5.Clear;
  //lcsDerivative5.Add(Simulate,Chart6.LeftAxis.Range.Min);
  //lcsDerivative5.Add(Simulate,Chart6.LeftAxis.Range.Max);

  //lcsDerivative5.SetyValue(0,Chart6.LeftAxis.Range.Min);
  //lcsDerivative5.SetyValue(1,Chart6.LeftAxis.Range.Max);
  //lcsDerivative5.SetxValue(0,Simulate);
  //lcsDerivative5.SetxValue(1,Simulate);

  lcsDerivative4.Clear;

  //lcsDerivative4.Add(1,10);
  //lcsDerivative4.Add(2,20);
  //lcsDerivative4.Add(3,30);
  //Chart6.LeftAxis.Range.UseMax:=True;
  //Chart6.LeftAxis.Range.UseMin:=True;

  for i:=0 to 9 do
  begin
    lcsDerivative4.Add(i,Base_[i] );
    lcsDerivative4.SetXValue(0,0);
    lcsDerivative4.SetYValue(0,0);
    //Base_
    //TargetSource1
    //TargetSource2
  end;
end;

procedure TForm1.DisplayStatus();
var
  i: integer;
begin
  Label_Serquent.Caption:='Serquent='+Serquent_.ToString;
  Label_Counter.Caption:='Counter='+Counter_.ToString;

  AvgSource1_:=0;
  for i:=0 to 9 do
  begin
    AvgSource1_:=AvgSource1_+CurrentSource1[i];
  end;
  AvgSource1_:=AvgSource1_/10;

  AvgSource2_:=0;
  for i:=0 to 9 do
  begin
    AvgSource2_:=AvgSource2_+CurrentSource2[i];
  end;
  AvgSource2_:=AvgSource2_/10;

  Label_AvgSource1.Caption:='AvgSource1='+AvgSource1_.ToString;
  Label_AvgSource2.Caption:='AvgSource2='+AvgSource2_.ToString;

  Source1_1.Caption:=CurrentSource1[0].ToString;
  Source1_2.Caption:=CurrentSource1[1].ToString;
  Source1_3.Caption:=CurrentSource1[2].ToString;
  Source1_4.Caption:=CurrentSource1[3].ToString;
  Source1_5.Caption:=CurrentSource1[4].ToString;
  Source1_6.Caption:=CurrentSource1[5].ToString;
  Source1_7.Caption:=CurrentSource1[6].ToString;
  Source1_8.Caption:=CurrentSource1[7].ToString;
  Source1_9.Caption:=CurrentSource1[8].ToString;
  Source1_10.Caption:=CurrentSource1[9].ToString;

  Source2_1.Caption:=CurrentSource2[0].ToString;
  Source2_2.Caption:=CurrentSource2[1].ToString;
  Source2_3.Caption:=CurrentSource2[2].ToString;
  Source2_4.Caption:=CurrentSource2[3].ToString;
  Source2_5.Caption:=CurrentSource2[4].ToString;
  Source2_6.Caption:=CurrentSource2[5].ToString;
  Source2_7.Caption:=CurrentSource2[6].ToString;
  Source2_8.Caption:=CurrentSource2[7].ToString;
  Source2_9.Caption:=CurrentSource2[8].ToString;
  Source2_10.Caption:=CurrentSource2[9].ToString;
end;

procedure TForm1.Source1_Up_To_TargetSource1(Loop_: integer);
var
  Tempo_:double;
  i:integer;
Begin
  for i:=0 to 9 do
  begin
    Tempo_:=((((TargetSource1[i]-Base_[i])/Loop_)*Counter_)+Base_[i]);
    CurrentSource1[i]:=Round(Tempo_);
  end;
  Counter_:=Counter_+1;
  if Counter_>=Loop_+1 then begin Serquent_:=Serquent_+1; Counter_:=0; end;
end;

procedure TForm1.Source1_Down_To_Base(Loop_: integer);
var
  Tempo_:double;
  i:integer;
Begin
  for i:=0 to 9 do
  begin
    Tempo_:=(TargetSource1[i]-(((TargetSource1[i]-Base_[i])/Loop_)*Counter_));
    CurrentSource1[i]:=Round(Tempo_);
  end;
  Counter_:=Counter_+1;
  if Counter_>=Loop_+1 then begin Serquent_:=Serquent_+1; Counter_:=0; end;
end;

procedure TForm1.Source1_Down_To_TargetSource2(Loop_: integer);
var
  Tempo_:double;
  i:integer;
begin
  for i:=0 to 9 do
  begin
    Tempo_:=(Base_[i]-(((Base_[i]-TargetSource2[i])/Loop_)*Counter_));
    CurrentSource1[i]:=Round(Tempo_);
  end;
  Counter_:=Counter_+1;
  if Counter_>=Loop_+1 then begin Serquent_:=Serquent_+1; Counter_:=0; end;
end;

procedure TForm1.Source1_Up_To_Base(Loop_: integer);
var
  Tempo_:double;
  i:integer;
begin
  for i:=0 to 9 do
  begin
    Tempo_:=((((Base_[i]-TargetSource2[i])/Loop_)*Counter_)+TargetSource2[i]);
    CurrentSource1[i]:=Round(Tempo_);
  end;
  Counter_:=Counter_+1;
  if Counter_>=Loop_+1 then begin Serquent_:=Serquent_+1; Counter_:=0; end;
end;

procedure TForm1.Source2_Down_To_TarrgetSource2(Loop_: integer);
var
  Tempo_:double;
  i:integer;
begin
  for i:=0 to 9 do
  begin
    Tempo_:=(Base_[i]-(((Base_[i]-TargetSource2[i])/Loop_)*Counter_));
    CurrentSource2[i]:=Round(Tempo_);
  end;
  Counter_:=Counter_+1;
  if Counter_>=Loop_+1 then begin Serquent_:=Serquent_+1; Counter_:=0; end;
end;

procedure TForm1.Source2_Up_To_Base(Loop_: integer);
var
  Tempo_:double;
  i:integer;
begin
  for i:=0 to 9 do
  begin
    Tempo_:=((((Base_[i]-TargetSource2[i])/Loop_)*Counter_)+TargetSource2[i]);
    CurrentSource2[i]:=Round(Tempo_);
  end;
    Counter_:=Counter_+1;
    if Counter_>=Loop_+1 then begin Serquent_:=Serquent_+1; Counter_:=0; end;
end;

procedure TForm1.Source2_Up_To_TargetSource1(Loop_: integer);
var
  Tempo_:double;
  i:integer;
begin
  for i:=0 to 9 do
  begin
    Tempo_:=((((TargetSource1[i]-Base_[i])/Loop_)*Counter_)+Base_[i]);
    CurrentSource2[i]:=Round(Tempo_);
  end;
    Counter_:=Counter_+1;
    if Counter_>=Loop_+1 then begin Serquent_:=Serquent_+1; Counter_:=0; end;
end;

procedure TForm1.Source2_Down_To_Base(Loop_: integer);
var
  Tempo_:double;
  i:integer;
begin
  for i:=0 to 9 do
  begin
    Tempo_:=(TargetSource1[i]-(((TargetSource1[i]-Base_[i])/Loop_)*Counter_));
    CurrentSource2[i]:=Round(Tempo_);
  end;
  Counter_:=Counter_+1;
  if Counter_>=Loop_+1 then begin Serquent_:=Serquent_+1; Counter_:=0; end;
end;

procedure TForm1.Source1_Up_To_TargetSource1_Source2_Down_To_TargetSource2(Loop_: integer);
var
  Tempo_:double;
  i:integer;
Begin
  for i:=0 to 9 do
  begin
    Tempo_:=((((TargetSource1[i]-Base_[i])/Loop_)*Counter_)+Base_[i]);
    CurrentSource1[i]:=Round(Tempo_);

    Tempo_:=(Base_[i]-(((Base_[i]-TargetSource2[i])/Loop_)*Counter_));
    CurrentSource2[i]:=Round(Tempo_);
  end;
  Counter_:=Counter_+1;
  if Counter_>=Loop_+1 then begin Serquent_:=Serquent_+1; Counter_:=0; end;
end;

procedure TForm1.Source1_Down_To_TargetSource2_Source2_Up_To_TargetSource1(Loop_: integer);
var
  Tempo_:double;
  i:integer;
Begin
  for i:=0 to 9 do
  begin
    Tempo_:=(TargetSource1[i]-(((TargetSource1[i]-TargetSource2[i])/Loop_)*Counter_));
    CurrentSource1[i]:=Round(Tempo_);

    Tempo_:=((((TargetSource1[i]-TargetSource2[i])/Loop_)*Counter_)+TargetSource2[i]);
    CurrentSource2[i]:=Round(Tempo_);
  end;
  Counter_:=Counter_+1;
  if Counter_>=Loop_+1 then begin Serquent_:=Serquent_+1; Counter_:=0; end;
end;

procedure TForm1.Source1_Up_To_Base_Source2_Down_To_Base(Loop_: integer);
var
  Tempo_:double;
  i:integer;
Begin
  for i:=0 to 9 do
  begin
    Tempo_:=((((Base_[i]-TargetSource2[i])/Loop_)*Counter_)+TargetSource2[i]);
    CurrentSource1[i]:=Round(Tempo_);
    Tempo_:=(TargetSource1[i]-(((TargetSource1[i]-Base_[i])/Loop_)*Counter_));
    CurrentSource2[i]:=Round(Tempo_);
  end;
  Counter_:=Counter_+1;
  if Counter_>=Loop_+1 then begin Serquent_:=Serquent_+1; Counter_:=0; end;
end;

end.

