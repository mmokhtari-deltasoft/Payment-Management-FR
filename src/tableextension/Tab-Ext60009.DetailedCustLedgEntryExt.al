tableextension 60009 "Detailed Cust. Ledg. Entry Ext" extends "Detailed Cust. Ledg. Entry"
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