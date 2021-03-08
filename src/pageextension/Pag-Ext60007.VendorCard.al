pageextension 60007 "Vendor Card" extends "Vendor Card"
{
    layout
    {
        addlast(Payments)
        {

            field("Exclude from Payment Reporting"; Rec."Exclude from Payment Reporting")
            {
                ApplicationArea = All;
            }
            field("Payment in progress (LCY)"; Rec."Payment in progress (LCY)")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
}


