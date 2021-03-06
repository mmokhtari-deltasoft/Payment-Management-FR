page 10876 "Payment Bank"
{
    Caption = 'Bank Account Card';
    PageType = Card;
    SourceTable = "Payment Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Bank Name"; "Bank Name")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ToolTip = 'Specifies the name of the bank selected in the Account No. field, if Account Type is Bank.';
                }
                field("Bank Address"; "Bank Address")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the address of the bank.';
                }
                field("Bank Address 2"; "Bank Address 2")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies an additional part of the address of the bank.';
                }
                field("Bank Post Code"; "Bank Post Code")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Post Code/City';
                    ToolTip = 'Specifies the postal code of the bank.';
                }
                field("Bank City"; "Bank City")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the city of the bank.';
                }
                field("Bank Country/Region Code"; "Bank Country/Region Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the country/region code of the bank.';
                }
                field("Bank Contact"; "Bank Contact")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the contact at the bank.';
                }
                field("Bank Branch No."; "Bank Branch No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the branch number of the bank.';
                }
                field("Bank Account No."; "Bank Account No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the company''s account at the bank.';
                }
                field(IBAN; IBAN)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the international bank account number associated with the payment header.';
                }
                field("SWIFT Code"; "SWIFT Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the international bank identification code for the payment slip.';
                }
            }
            group("R.I.B.")
            {
                Caption = 'R.I.B.';
                field("Bank Branch No.2"; "Bank Branch No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the branch number of the bank.';
                }
                field("Agency Code"; "Agency Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the agency code of the bank.';
                }
                field("Bank Account No.2"; "Bank Account No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the company''s account at the bank.';
                }
                field("RIB Key"; "RIB Key")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the two digit RIB key associated with the Bank Account No.';
                }
                field("RIB Checked"; "RIB Checked")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies that the key entered in the RIB Key field is correct.';
                }
                field("National Issuer No."; "National Issuer No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the payment authorization number.';
                }
            }
        }
    }

    actions
    {
    }
}

