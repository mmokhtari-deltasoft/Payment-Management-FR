tableextension 60016 "FA Ledger Entry Ext" extends "FA Ledger Entry"
{
    fields
    {
        field(10800; "Exclude Derogatory"; Boolean)
        {
            Caption = 'Exclude Derogatory';
            Editable = false;
        }
    }

}