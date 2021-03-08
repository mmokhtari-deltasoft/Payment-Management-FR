tableextension 60010 "Detailed Vend. Ledg. Entry Ext" extends "Detailed Vendor Ledg. Entry"
{
    fields
    {
        field(10801; "Curr. Adjmt. G/L Account No."; Code[20])
        {
            Caption = 'Curr. Adjmt. G/L Account No.';
            TableRelation = "G/L Account";
        }
    }

}