tableextension 60014 "Intrastat Jnl. Line Ext" extends "Intrastat Jnl. Line"
{
    fields
    {
        field(10800; "Shipment Method Code"; Code[10])
        {
            Caption = 'Shipment Method Code';
            ObsoleteReason = 'Merge to W1';
            ObsoleteState = Pending;
            TableRelation = "Shipment Method";
            ObsoleteTag = '15.0';
        }
        field(10801; "Cust. VAT Registration No."; Text[20])
        {
            Caption = 'Cust. VAT Registration No.';
        }
    }

}