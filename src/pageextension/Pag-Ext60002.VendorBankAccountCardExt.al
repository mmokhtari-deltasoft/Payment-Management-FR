pageextension 60002 "Vendor Bank Account Card Ext" extends "Vendor Bank Account Card"
{
    layout
    {
        addlast(General)
        {

            field("Agency Code"; Rec."Agency Code")
            {
                ApplicationArea = All;
            }
            field("RIB Key"; Rec."RIB Key")
            {
                ApplicationArea = All;
            }
            field("RIB Checked"; Rec."RIB Checked")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
}