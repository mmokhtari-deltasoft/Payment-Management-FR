pageextension 60000 "Bank Account Card Ext" extends "Bank Account Card"
{
    layout
    {
        addafter(Transfer)
        {
            group(" R.I.B")
            {
                Caption = ' R.I.B';
                field("Bank Branch No.3"; "Bank Branch No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the branch number of your bank.';
                }
                field("Agency Code"; "Agency Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the five-number code of the agency of the bank, for example, 00300.';
                }
                field("Bank Account No.3"; "Bank Account No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the bank account number.';
                }
                field("RIB Key"; "RIB Key")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the two-digit RIB key associated with the Bank Account No.';
                }
                field("RIB Checked"; "RIB Checked")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the Bank Account No. has been verified against the RIB Key.';
                }

            }

        }
    }

    actions
    {
    }
}