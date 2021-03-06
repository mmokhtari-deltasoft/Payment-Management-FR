table 10880 "Payment Period Setup"
{
    Caption = 'Payment Period Setup';

    fields
    {
        field(1; ID; Integer)
        {
            AutoIncrement = true;
            Caption = 'ID';
            Editable = false;
        }
        field(2; "Days From"; Integer)
        {
            Caption = 'Days From';
            NotBlank = true;

            trigger OnValidate()
            begin
                CheckDatePeriodConsistency;
            end;
        }
        field(3; "Days To"; Integer)
        {
            Caption = 'Days To';
            MinValue = 0;

            trigger OnValidate()
            begin
                CheckDatePeriodConsistency;
            end;
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        DaysFromLessThanDaysToErr: Label 'Days From must not be less than Days To.';

    local procedure CheckDatePeriodConsistency()
    begin
        if ("Days From" <> 0) and ("Days To" <> 0) and ("Days From" > "Days To") then
            Error(DaysFromLessThanDaysToErr);
    end;
}

