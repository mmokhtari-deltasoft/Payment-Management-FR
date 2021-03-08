pageextension 60001 "Customer Bank Account Card Ext" extends "Customer Bank Account Card"
{
    layout
    {
        addlast(General)
        {

            field("RIB Checked"; Rec."RIB Checked")
            {
                ApplicationArea = All;
            }
            field("RIB Key"; Rec."RIB Key")
            {
                ApplicationArea = All;
            }
            field("Agency Code"; Rec."Agency Code")
            {
                ApplicationArea = All;
            }
        }

    }

    actions
    {
    }
}