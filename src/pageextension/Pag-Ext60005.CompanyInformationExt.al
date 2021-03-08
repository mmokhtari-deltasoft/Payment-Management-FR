pageextension 60005 "Company Information Ext" extends "Company Information"
{
    layout
    {
        addafter(Shipping)
        {
            group("Trade Register")
            {
                Caption = 'Trade Register';
                field("Registration No."; "Registration No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the company''s VAT registration number.';
                }
                field(Control1120004; "Trade Register")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the company''s RCS number.';
                }
                field("APE Code"; "APE Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the company''s APE code.';
                }
                field("Legal Form"; "Legal Form")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the company''s legal form, for example, SA or SARL.';
                }
                field("Stock Capital"; "Stock Capital")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the stock capital of the company.';
                }
                field(CISD; CISD)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the public organization in France that handles the EU Sales List and Intrastat declaration.';
                }
            }
        }
    }

    actions
    {
    }
}