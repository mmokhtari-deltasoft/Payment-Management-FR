tableextension 60006 "Accounting Period Ext" extends "Accounting Period"
{
    fields
    {
        field(10800; "Fiscally Closed"; Boolean)
        {
            Caption = 'Fiscally Closed';
            Editable = false;
        }
        field(10801; "Fiscal Closing Date"; Date)
        {
            Caption = 'Fiscal Closing Date';
            Editable = false;
        }
        field(10802; "Period Reopened Date"; Date)
        {
            Caption = 'Period Reopened Date';
            Editable = false;
        }

    }
    [Scope('OnPrem')]
    procedure UpdateGLSetup(PeriodEndDate: Date)
    begin
        with GLSetup do begin //FIXME:
            Get;
            CalcFields("Posting Allowed From");
            if "Allow Posting From" <= PeriodEndDate then begin
                "Allow Posting From" := "Posting Allowed From";
                Modify;
            end;
            if ("Allow Posting To" <= PeriodEndDate) and ("Allow Posting To" <> 0D) then begin
                "Allow Posting To" := CalcDate('<+1M-1D>', "Posting Allowed From");
                Modify;
            end;
        end;
    end;

    [Scope('OnPrem')]
    procedure UpdateUserSetup(PeriodEndDate: Date)
    begin
        with UserSetup do begin //FIXME:
            if FindFirst then
                repeat
                    if "Allow Posting From" <= PeriodEndDate then begin
                        "Allow Posting From" := GLSetup."Posting Allowed From";
                        Modify;
                    end;
                    if ("Allow Posting To" <= PeriodEndDate) and ("Allow Posting To" <> 0D) then begin
                        "Allow Posting To" := CalcDate('<+1M-1D>', GLSetup."Posting Allowed From");
                        Modify;
                    end;
                until Next = 0;
        end
    end;

    var
        UserSetup: Record "User Setup";
        GLSetup: Record "General Ledger Setup";

}