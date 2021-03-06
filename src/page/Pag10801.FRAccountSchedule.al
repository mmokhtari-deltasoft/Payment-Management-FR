page 10801 "FR Account Schedule"
{
    AutoSplitKey = true;
    Caption = 'FR Account Schedule';
    DataCaptionFields = "Schedule Name";
    MultipleNewLines = true;
    PageType = Worksheet;
    SaveValues = true;
    SourceTable = "FR Acc. Schedule Line";

    layout
    {
        area(content)
        {
            field(CurrentSchedName; CurrentSchedName)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Name';
                Lookup = true;
                ToolTip = 'Specifies the name of the account schedule.';

                trigger OnLookup(var Text: Text): Boolean
                begin
                    exit(AccSchedManagement.LookupName(CurrentSchedName, Text));
                end;

                trigger OnValidate()
                begin
                    AccSchedManagement.CheckName(CurrentSchedName);
                    CurrentSchedNameOnAfterValidat;
                end;
            }
            repeater(Control1)
            {
                ShowCaption = false;
                field("Row No."; "Row No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number for the account schedule line.';
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the description of the account schedule line.';
                }
                field("Totaling Type"; "Totaling Type")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the totaling type for the account schedule line.';
                }
                field(Totaling; Totaling)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies which accounts will be totaled on this account schedule line.';
                }
                field("Totaling Debtor"; "Totaling Debtor")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies which accounts, with a debit balance, will be totaled on this line.';
                }
                field("Totaling Creditor"; "Totaling Creditor")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies which accounts, with a credit balance, will be totaled on this line.';
                }
                field("Totaling 2"; "Totaling 2")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies which accounts will be totaled on this line, in addition to the Totaling field.';
                }
                field("Calculate with"; "Calculate with")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies how the amounts in reports will be displayed.';
                }
                field("New Page"; "New Page")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies if there will be a page break after the current account, when the account schedule is printed.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';

                trigger OnAction()
                begin
                    AccSchedName.SetFilter(Name, "Schedule Name");
                    REPORT.Run(REPORT::"FR Account Schedule", true, false, AccSchedName);
                end;
            }
        }
        area(reporting)
        {
            action("FR Account Schedule")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'FR Account Schedule';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "FR Account Schedule";
                ToolTip = 'Analyze figures in general ledger accounts or compare general ledger entries with general ledger budget entries.';
            }
        }
    }

    trigger OnOpenPage()
    begin
        AccSchedManagement.OpenSchedule(CurrentSchedName, Rec);
    end;

    var
        AccSchedName: Record "FR Acc. Schedule Name";
        AccSchedManagement: Codeunit "FR AccSchedManagement";
        CurrentSchedName: Code[10];

    [Scope('OnPrem')]
    procedure SetAccSchedName(NewAccSchedName: Code[10])
    begin
        CurrentSchedName := NewAccSchedName;
    end;

    local procedure CurrentSchedNameOnAfterValidat()
    begin
        CurrPage.SaveRecord;
        AccSchedManagement.SetName(CurrentSchedName, Rec);
        CurrPage.Update(false);
    end;
}

