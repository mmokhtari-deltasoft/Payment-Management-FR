tableextension 60017 "Depreciation Book Ext" extends "Depreciation Book"
{
    fields
    {
        field(10800; "Derogatory Calculation"; Code[10])
        {
            Caption = 'Derogatory Calculation';
            TableRelation = "Depreciation Book";

            trigger OnValidate()
            var
                DeprBook: Record "Depreciation Book";
                FADeprBook: Record "FA Depreciation Book";
            begin
                if ("Derogatory Calculation" <> xRec."Derogatory Calculation") then begin
                    if xRec."Derogatory Calculation" <> '' then begin
                        FADeprBook.SetRange("Depreciation Book Code", xRec."Derogatory Calculation");
                        if FADeprBook.Find('-') then
                            repeat
                                FADeprBook.CalcFields(Derogatory);
                                FADeprBook.TestField(Derogatory, 0);
                            until FADeprBook.Next = 0;
                    end else begin
                        DeprBook.SetRange("Derogatory Calculation", "Derogatory Calculation");
                        if DeprBook.Find('-') then
                            if DeprBook.Code <> Code then
                                Error(Text10802, "Derogatory Calculation", DeprBook.Code);
                        DeprBook.SetRange("Derogatory Calculation");
                        DeprBook.SetRange(Code, "Derogatory Calculation");
                        if DeprBook.Find('-') then
                            if (DeprBook."Derogatory Calculation" <> '') then
                                Error(Text10804, "Derogatory Calculation");
                    end;
                    if ("Derogatory Calculation" <> xRec."Derogatory Calculation") then
                        if "Used with Derogatory Book" <> '' then
                            Error(Text10800, Code);

                end;


                if "Derogatory Calculation" = Code then
                    Error(Text10801, "Derogatory Calculation", Code);

                // CheckIntegrationFields; //FIXME:
            end;
        }
        field(10801; "Used with Derogatory Book"; Code[10])
        {
            CalcFormula = Lookup("Depreciation Book".Code WHERE("Derogatory Calculation" = FIELD(Code)));
            Caption = 'Used with Derogatory Book';
            Editable = false;
            FieldClass = FlowField;
        }
        field(10802; "G/L Integration - Derogatory"; Boolean)
        {
            Caption = 'G/L Integration - Derogatory';

            trigger OnValidate()
            begin
                // CheckIntegrationFields; FIXME:
            end;
        }
    }

    var
        Text10800: Label 'The depreciation book %1 is an accounting book and cannot be set up as a derogatory depreciation book.';
        Text10801: Label 'The depreciation book %1 cannot be set up as derogatory for depreciation book %2.';
        Text10802: Label 'The depreciation book %1 is already set up in combination with derogatory depreciation book %2.';
        Text10803: Label 'Derogatory depreciation books cannot be integrated with the general ledger. Please make sure that none of the fields on the Integration tab are checked.';
        Text10804: Label 'The depreciation book %1 is a derogatory depreciation book.';

}