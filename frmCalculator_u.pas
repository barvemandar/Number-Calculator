unit frmCalculator_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    txtInput: TEdit;
    txtResult: TEdit;
    btnCE: TButton;
    btnClr: TButton;
    btnBck: TButton;
    btnDiv: TButton;
    btn7: TButton;
    btn8: TButton;
    btn9: TButton;
    btnMulti: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    btnMinus: TButton;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btnPlus: TButton;
    btnplusminus: TButton;
    btn0: TButton;
    btnDec: TButton;
    btnEql: TButton;
    Label1: TLabel;
    procedure btn0Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btnBckClick(Sender: TObject);
    procedure btnCEClick(Sender: TObject);
    procedure btnClrClick(Sender: TObject);
    procedure btnDecClick(Sender: TObject);
    procedure btnDivClick(Sender: TObject);
    procedure btnEqlClick(Sender: TObject);
    procedure btnMinusClick(Sender: TObject);
    procedure btnMultiClick(Sender: TObject);
    procedure btnPlusClick(Sender: TObject);
    procedure btnplusminusClick(Sender: TObject);
    procedure txtInputKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);




  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  gresult: String;
  gtempRltString: String;
  gtempResult1: String;
  gtempResult2: String;
  gfinalResult: Currency;
  gplus: Boolean;
  gminus: Boolean;
  gmulti: Boolean;
  gdiv:Boolean;
  gdec:Boolean;
  goptr:String;
  gplusminus: Boolean;

implementation

{$R *.dfm}


procedure TForm1.btn0Click(Sender: TObject);
begin
   gplus :=False;
   gminus :=False;
   gmulti :=False;
   gdiv :=False;
   if gresult='' then
   begin
    txtInput.Text:= btn0.Caption;
   end
   else
   begin
    txtInput.Text := txtInput.Text + btn0.Caption;
   end;
   txtInput.SetFocus;
   txtInput.AutoSelect:=False;
end;

procedure TForm1.btn1Click(Sender: TObject);

begin
  gplus :=False;
  gminus :=False;
  gmulti :=False;
  gdiv :=False;
  //if txtResult.Text='' then
  begin
      if gresult='' then
      begin
        txtInput.Text := Tbutton(Sender).Caption;
        gresult:=Tbutton(Sender).Caption;
      end
      else
      begin
        if txtInput.Text ='0' then
        begin
          gresult:=Tbutton(Sender).Caption;
          txtInput.Text :=Tbutton(Sender).Caption;
        end
        else
        begin
          gresult:=gresult + txtInput.Text ;
          txtInput.Text := txtInput.Text + Tbutton(Sender).Caption;
        end;
      end;
        txtInput.SetFocus;
        txtInput.AutoSelect:=false;
  end;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
//Button 2
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
//Button 3
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
//Button 4
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
//Button 5
end;

procedure TForm1.btn6Click(Sender: TObject);
begin
//Button 6
end;

procedure TForm1.btn7Click(Sender: TObject);
begin
//Button 7
end;

procedure TForm1.btn8Click(Sender: TObject);
begin
//Button 8
end;

procedure TForm1.btn9Click(Sender: TObject);
begin
//Button 9
end;

procedure TForm1.btnBckClick(Sender: TObject);
begin
  gdec :=true;
  if (txtInput.Text<>'') or (txtInput.Text<>'0') or (txtInput.Text<>'-') then
  begin
    txtInput.Text:=Copy (txtInput.Text,0,(length(txtInput.text)-1));
    if txtInput.Text = '' then
     txtInput.Text:='0';
     gresult:='';
  end
  else
  begin
     txtInput.Text:='0';
     gresult:='';
  end;
  txtInput.SetFocus;
  txtInput.AutoSelect:=false;
  gplusminus:=true;
end;

procedure TForm1.btnCEClick(Sender: TObject);
begin
    gresult:='' ;
    txtInput.Text:='0';
    gdec :=true;
    txtInput.SetFocus;
    txtInput.AutoSelect:=true;
    gplusminus := true;
end;

procedure TForm1.btnClrClick(Sender: TObject);
begin
    gresult:='' ;
    txtInput.Text:='0';
    txtResult.Text:='' ;
    gtempRltString:='';
    gfinalResult:=0;
    gtempResult1:='';
    gtempResult2:='';
    gdec :=true;
    txtInput.SetFocus;
    txtInput.AutoSelect:=true;
    gplusminus := true;
end;

procedure TForm1.btnDecClick(Sender: TObject);
  begin
  if gdec=true then
  begin
    if gresult='' then
    begin
      txtInput.Text:='0' + btnDec.Caption;
      gresult:=btnDec.Caption;
      gdec := false;
    end
    else
    begin
      gresult:=gresult + txtInput.Text ;
      txtInput.Text := txtInput.Text + btnDec.Caption;
      gdec := false;
    end;
  end;
  txtInput.SetFocus;
  gplusminus:=true;
end;

procedure TForm1.btnDivClick(Sender: TObject);
begin
  gdec :=true;
  if gdiv=False then
  begin
    if txtInput.Text<>'0' then
    begin
     if gtempResult1='' then
        begin
            gtempRltString := txtInput.Text+'/';
            txtResult.Text := gtempRltString;
            gresult:='';
            gtempResult1 := txtInput.Text;
            gdiv:=True;
            goptr := '/';
        end
     else
     begin
      if goptr = '+' then
         begin
          gtempRltString := gtempRltString + txtInput.Text+'/';
          txtResult.Text := gtempRltString;
          gresult :='';
          gtempResult2 := txtInput.Text;
          gfinalResult := StrToFloat(gtempResult1) + StrToFloat(gtempResult2);
          txtInput.Text := FloatToStr(gfinalResult);
          gtempResult1 := txtInput.Text;
          txtResult.Text :=  FloatToStr(gfinalResult) + '/';
          gdiv:=True;
         end

      else if goptr = '-' then
      begin
          gtempRltString := gtempRltString + txtInput.Text+'/';
          txtResult.Text := gtempRltString;
          gresult :='';
          gtempResult2 := txtInput.Text;
          gfinalResult := StrToFloat(gtempResult1) - StrToFloat(gtempResult2);
          txtInput.Text := FloatToStr(gfinalResult);
          gtempResult1 := txtInput.Text;
          txtResult.Text :=  FloatToStr(gfinalResult) + '/';
          gdiv:=True;
      end

      else if goptr = '*' then
      begin
          gtempRltString := gtempRltString + txtInput.Text+'/';
          txtResult.Text := gtempRltString;
          gresult :='';
          gtempResult2 := txtInput.Text;
          gfinalResult := StrToFloat(gtempResult1) * StrToFloat(gtempResult2);
          txtInput.Text := FloatToStr(gfinalResult);
          gtempResult1 := txtInput.Text;
          txtResult.Text :=  FloatToStr(gfinalResult) + '/';
          gdiv:=True;
      end

      else
      begin
          gtempRltString := gtempRltString + txtInput.Text+'/';
          txtResult.Text := gtempRltString;
          gresult :='';
          gtempResult2 := txtInput.Text;
          gfinalResult := StrToInt(gtempResult1) div StrToInt(gtempResult2);
          txtInput.Text := FloatToStr(gfinalResult);
          gtempResult1 := txtInput.Text;
          gmulti:=True;
      end;
      goptr := '/';
     end;
    end
    else
       ShowMessage('Cannot Divide By Zero');
 end;
  txtInput.SetFocus;
  txtInput.AutoSelect:=True;
end;

procedure TForm1.btnEqlClick(Sender: TObject);
begin
  if txtInput.Text<>'0' then
  begin
    if goptr='+' then
    begin
        gresult :='';
        gtempResult2 :=  txtInput.Text;
        gfinalResult :=  StrToFloat(gtempResult1)+ StrToFloat(gtempResult2);
        txtInput.Text := FloatToStr(gfinalResult);

    end

    else if goptr='-' then
    begin
        gresult :='';
        gtempResult2 := txtInput.Text;
        gfinalResult := StrToFloat(gtempResult1) - StrToFloat(gtempResult2);
        txtInput.Text := FloatToStr(gfinalResult);

    end

    else if goptr='*' then
    begin
        gresult :='';
        gtempResult2 := txtInput.Text;
        gfinalResult := StrToFloat(gtempResult1) * StrToFloat(gtempResult2);
        txtInput.Text := FloatToStr(gfinalResult);

    end

    else if goptr='/' then
    begin
        gresult :='';
        gtempResult2 := txtInput.Text;
        gfinalResult := StrToFloat(gtempResult1) / StrToFloat(gtempResult2);
        txtInput.Text := FloatToStr(gfinalResult);

    end
    else
      //Do Nothing;

    gresult:='' ;
    txtResult.Text:='' ;
    gtempRltString:='';
    gfinalResult:=0;
    gtempResult1:='0';
    gtempResult2:='0';
    gdec:=true;
    goptr:='';
    txtInput.SetFocus;
    txtInput.AutoSelect:=False;
    gplusminus := true;
  end
  else
  begin
    if (goptr='-') or (goptr ='+') then
    begin
      gfinalResult := StrToFloat(gtempResult1);
      txtInput.Text := FloatToStr(gfinalResult);
      gresult := '' ;
      txtResult.Text := '' ;
      gtempRltString := '';
      gfinalResult := 0;
      gtempResult1 := '';
      gtempResult2 := '';
      goptr := '';
    end
    else if goptr='/' then
      ShowMessage('Cannot Divide By Zero')
    else
    begin
      gresult:='' ;
      txtInput.Text:='0';
      txtResult.Text:='' ;
      gtempRltString:='';
      gfinalResult:=0;
      gtempResult1:='';
      gtempResult2:='';
      goptr :='';
    end;
  end;
end;

procedure TForm1.btnMinusClick(Sender: TObject);
begin
  gdec :=true;
  if gminus=False then
  begin
    if txtInput.Text<>'0' then
    begin
      if gtempResult1='' then
      begin
          gtempRltString := txtInput.Text+'-';
          txtResult.Text := gtempRltString;
          gresult:='';
          gtempResult1 := txtInput.Text;
          gminus:=True;
          goptr := '-';
      end
      else
       begin
       if goptr = '+' then
       begin
        gtempRltString := gtempRltString + txtInput.Text + '-' ;
        txtResult.Text := gtempRltString;
        gresult :='';
        gtempResult2 := txtInput.Text;
        gfinalResult := StrToFloat(gtempResult1) + StrToFloat(gtempResult2);
        txtInput.Text := FloatToStr(gfinalResult);
        gtempResult1 := txtInput.Text;
        txtResult.Text :=  FloatToStr(gfinalResult) + '-';
        gminus:=True;
       end

       else if goptr = '/' then
       begin
        gtempRltString := gtempRltString + txtInput.Text+'-';
        txtResult.Text := gtempRltString;
        gresult :='';
        gtempResult2 := txtInput.Text;
        gfinalResult := StrToFloat(gtempResult1) / StrToFloat(gtempResult2);
        txtInput.Text := FloatToStr(gfinalResult);
        gtempResult1 := txtInput.Text;
        txtResult.Text :=  FloatToStr(gfinalResult) + '-';
        gminus:=True;
       end

       else if goptr = '*' then
       begin
        gtempRltString := gtempRltString + txtInput.Text+'-';
        txtResult.Text := gtempRltString;
        gresult :='';
        gtempResult2 := txtInput.Text;
        gfinalResult := StrToFloat(gtempResult1) * StrToFloat(gtempResult2);
        txtInput.Text := FloatToStr(gfinalResult);
        gtempResult1 := txtInput.Text;
        txtResult.Text :=  FloatToStr(gfinalResult) + '-';
        gminus:=True;
       end

       else
       begin
        gtempRltString := gtempRltString + txtInput.Text+'-';
        txtResult.Text := gtempRltString;
        gresult :='';
        gtempResult2 := txtInput.Text;
        gfinalResult := StrToFloat(gtempResult1) - StrToFloat(gtempResult2);
        txtInput.Text := FloatToStr(gfinalResult);
        gtempResult1 := txtInput.Text;
        gminus:=True;
       end;
       goptr := '-';
      end;
    end;
    if goptr='/' then
       ShowMessage('Cannot Divide By Zero');
  end;
  txtInput.SetFocus;
  txtInput.AutoSelect:=True;
end;

procedure TForm1.btnMultiClick(Sender: TObject);
begin
   gdec :=true;
   if gmulti=False then
   begin
    if txtInput.Text<>'0' then
    begin
      if gtempResult1='' then
        begin
          gtempRltString := txtInput.Text+'*';
          txtResult.Text := gtempRltString;
          gresult:='';
          gtempResult1 := txtInput.Text;
          gmulti:=True;
          goptr := '*';
        end
      else
      begin
       if goptr = '+' then
       begin
        gtempRltString := gtempRltString + txtInput.Text+'*';
        txtResult.Text := gtempRltString;
        gresult :='';
        gtempResult2 := txtInput.Text;
        gfinalResult := StrToFloat(gtempResult1) + StrToFloat(gtempResult2);
        txtInput.Text := FloatToStr(gfinalResult);
        gtempResult1 := txtInput.Text;
        txtResult.Text :=  FloatToStr(gfinalResult) + '*';
        gmulti:=True;
       end

       else if goptr = '/' then
       begin
        gtempRltString := gtempRltString + txtInput.Text+'*';
        txtResult.Text := gtempRltString;
        gresult :='';
        gtempResult2 := txtInput.Text;
        gfinalResult := StrToFloat(gtempResult1) / StrToFloat(gtempResult2);
        txtInput.Text := FloatToStr(gfinalResult);
        gtempResult1 := txtInput.Text;
        txtResult.Text :=  FloatToStr(gfinalResult) + '*';
        gmulti:=True;
       end

       else if goptr = '-' then
       begin
        gtempRltString := gtempRltString + txtInput.Text+'*';
        txtResult.Text := gtempRltString;
        gresult :='';
        gtempResult2 := txtInput.Text;
        gfinalResult := StrToFloat(gtempResult1) - StrToFloat(gtempResult2);
        txtInput.Text := FloatToStr(gfinalResult);
        gtempResult1 := txtInput.Text;
        txtResult.Text :=  FloatToStr(gfinalResult) + '*';
        gmulti:=True;
       end

       else
       begin
        gtempRltString := gtempRltString + txtInput.Text+'*';
        txtResult.Text := gtempRltString;
        gresult :='';
        gtempResult2 := txtInput.Text;
        gfinalResult := StrToFloat(gtempResult1) * StrToFloat(gtempResult2);
        txtInput.Text := FloatToStr(gfinalResult);
        gtempResult1 := txtInput.Text;
        gmulti:=True;
       end;
       goptr := '*';
      end;
    end;
    if goptr='/' then
       ShowMessage('Cannot Divide By Zero');
  end;
  txtInput.SetFocus;
  txtInput.AutoSelect:=True;
end;

procedure TForm1.btnPlusClick(Sender: TObject);
begin
  gdec :=true;
  if gplus=False then
  begin
      if txtInput.Text<>'0' then
      begin
        if gtempResult1='' then
          begin
            gtempRltString := txtInput.Text+'+';
            txtResult.Text := gtempRltString;
            gresult:='';
            gtempResult1 := txtInput.Text;
            gplus:=True;
            goptr := '+';
          end
        else
         begin
          if goptr = '-' then
          begin
              gtempRltString := gtempRltString + txtInput.Text+'+';
              txtResult.Text := gtempRltString;
              gresult :='';
              gtempResult2 := txtInput.Text;
              gfinalResult := StrToFloat(gtempResult1) - StrToFloat(gtempResult2);
              txtInput.Text := FloatToStr(gfinalResult);
              gtempResult1 := txtInput.Text;
              txtResult.Text :=  FloatToStr(gfinalResult) + '+';
              gplus:=True;
          end

          else if goptr = '/' then
          begin
            gtempRltString := gtempRltString + txtInput.Text+'+';
            txtResult.Text := gtempRltString;
            gresult :='';
            gtempResult2 := txtInput.Text;
            gfinalResult := StrToFloat(gtempResult1) / StrToFloat(gtempResult2);
            txtInput.Text := FloatToStr(gfinalResult);
            gtempResult1 := txtInput.Text;
            txtResult.Text :=  FloatToStr(gfinalResult) + '+';
            gplus:=True;
          end

          else if goptr = '*' then
          begin
            gtempRltString := gtempRltString + txtInput.Text+'+';
            txtResult.Text := gtempRltString;
            gresult :='';
            gtempResult2 := txtInput.Text;
            gfinalResult := StrToFloat(gtempResult1) * StrToFloat(gtempResult2);
            txtInput.Text := FloatToStr(gfinalResult);
            gtempResult1 := txtInput.Text;
            txtResult.Text :=  FloatToStr(gfinalResult) + '+';
            gplus:=True;
          end

          else
          begin
            gtempRltString := gtempRltString + txtInput.Text+'+';
            txtResult.Text := gtempRltString;
            gresult :='';
            gtempResult2 := txtInput.Text;
            gfinalResult := StrToFloat(gtempResult1) + StrToFloat(gtempResult2);
            txtInput.Text := FloatToStr(gfinalResult);
            gtempResult1 := txtInput.Text;
            gplus:=True;
          end;
       goptr := '+';
       end;
      end;
      if goptr='/' then
       ShowMessage('Cannot Divide By Zero');
    end;
   txtInput.SetFocus;
   txtInput.AutoSelect:=True;
end;

procedure TForm1.btnplusminusClick(Sender: TObject);
begin
  gplus :=False;
  gminus :=False;
  gmulti :=False;
  gdiv :=False;
  if gresult<>'' then
  begin
    if txtInput.Text ='0' then
        begin
          if gplusminus= true then
          begin
            //txtInput.Text:='';
            txtInput.Text :='-' + txtInput.Text;
            gresult:=txtInput.Text;
            gplusminus := false;
          end
          else
          begin
            //txtInput.Text:='';
            txtInput.Text :='' +txtInput.Text;
            gresult:=txtInput.Text;
            gplusminus := true;
          end;
        end
        else
        begin
          if gplusminus= true then
          begin
            txtInput.Text := '-' + txtInput.Text;
            gplusminus := false;
          end
          else
          begin
            txtInput.Text :='' + Copy (txtInput.Text,2,(length(txtInput.text)));
            gplusminus := true;
          end;
        end;

  end;
  txtInput.SetFocus;
  txtInput.AutoSelect:=False;
end;





procedure TForm1.FormCreate(Sender: TObject);
begin
  gdec :=True;
end;
procedure TForm1.txtInputKeyPress(Sender: TObject; var Key: Char);
begin
    if Key='0' then
    begin
      Key:=#0;
      btn0.click;
      gresult := Key;
      //txtInput.SetFocus;
      //txtInput.AutoSelect:=False;
    end
    else if Key='1' then
    begin
      Key:=#0;
      btn1.Click;
      gresult := Key;
      //txtInput.SetFocus;
      //txtInput.AutoSelect:=False
    end
    else if Key='2' then
    begin
      Key:=#0;
      btn2.click;
      gresult := Key;
      //txtInput.SetFocus;
      //txtInput.AutoSelect:=False;

    end
    else if Key='3' then
    begin
      Key:=#0;
      btn3.click;
      gresult := Key;
     // txtInput.SetFocus;
      //txtInput.AutoSelect:=False
    end
    else if Key='4' then
    begin
      Key:=#0;
      btn4.click;
      gresult := Key;
      //txtInput.SetFocus;
      //txtInput.AutoSelect:=False
    end
    else if Key='5' then
    begin
      Key:=#0;
      btn5.click;
      gresult := Key;
      //txtInput.SetFocus;
      //txtInput.AutoSelect:=False
    end
    else if Key='6' then
    begin
      Key:=#0;
      btn6.click;
      gresult := Key;
      //txtInput.SetFocus;
      //txtInput.AutoSelect:=False
    end
    else if Key='7' then
    begin
      Key:=#0;
      btn7.click;
      gresult := Key;
      //txtInput.SetFocus;
      //txtInput.AutoSelect:=False
    end
    else if Key='8' then
    begin
      Key:=#0;
      btn8.click;
      gresult := Key;
      //txtInput.SetFocus;
      //txtInput.AutoSelect:=False
    end
    else if Key='9' then
    begin
      Key:=#0;
      btn9.click;
      gresult := Key;
      //txtInput.SetFocus;
      //txtInput.AutoSelect:=False
    end
    else if Key='+' then
    begin

      btnPlus.Click
    end
    else if Key='*' then
    begin

      btnMulti.Click
    end
    else if Key='-' then
    begin

      btnMinus.Click
    end
    else if Key='/' then
    begin
      //Form1.SetFocus;
      btnDiv.Click;
    end
    else if Key='.' then
    begin
      //Form1.SetFocus;
      //gdec:=true;
      btnDec.Click;
    end
    else if Key=#13 then
    begin
      //Form1.SetFocus;
      btnEql.Click;
    end
    else if Key=#8 then
    begin
      //Form1.SetFocus;
      btnBck.Click;
    end;
end;

end.
