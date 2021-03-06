report 10800 "G/L Journal"
{
    DefaultLayout = RDLC;
    RDLCLayout = './src/report/RDLC/GLJournal.rdlc';
    ApplicationArea = Basic, Suite;
    Caption = 'G/L Journal';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(Date; Date)
        {
            DataItemTableView = SORTING("Period Type", "Period Start") WHERE("Period Type" = CONST(Month));
            PrintOnlyIfDetail = true;
            RequestFilterFields = "Period Start";
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYPROPERTY.DisplayName)
            {
            }
            column(STRSUBSTNO_Text003_USERID_; StrSubstNo(Text003, UserId))
            {
            }
            column(PageCaption; StrSubstNo(Text004, ' '))
            {
            }
            column(UserCaption; StrSubstNo(Text003, ''))
            {
            }
            column(G_L_Entry__TABLECAPTION__________Filter; "G/L Entry".TableCaption + ': ' + Filter)
            {
            }
            column("Filter"; Filter)
            {
            }
            column(Hidden; Hidden)
            {
            }
            column(FiscalYearStatusText; FiscalYearStatusText)
            {
            }
            column(DebitTotal; DebitTotal)
            {
            }
            column(CreditTotal; CreditTotal)
            {
            }
            column(Date_Period_Type; "Period Type")
            {
            }
            column(Date_Period_Start; "Period Start")
            {
            }
            column(G_L_JournalCaption; G_L_JournalCaptionLbl)
            {
            }
            column(CodeCaption; CodeCaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(DebitCaption; DebitCaptionLbl)
            {
            }
            column(CreditCaption; CreditCaptionLbl)
            {
            }
            column(Grand_Total__Caption; Grand_Total__CaptionLbl)
            {
            }
            dataitem(SourceCode; "Source Code")
            {
                DataItemTableView = SORTING(Code);
                PrintOnlyIfDetail = true;
                RequestFilterFields = "Code";
                column(Date__Period_Type_; Date."Period Type")
                {
                }
                column(Date__Period_Name__________FORMAT_Year_; Date."Period Name" + ' ' + Format(Year))
                {
                }
                column(SourceCode_Code; Code)
                {
                }
                dataitem("G/L Entry"; "G/L Entry")
                {
                    DataItemLink = "Source Code" = FIELD(Code);
                    DataItemTableView = SORTING("Source Code", "Posting Date");
                    column(SourceCode_Code_Control1120032; SourceCode.Code)
                    {
                    }
                    column(SourceCode_Description; SourceCode.Description)
                    {
                    }
                    column(G_L_Entry__Debit_Amount_; "Debit Amount")
                    {
                    }
                    column(G_L_Entry__Credit_Amount_; "Credit Amount")
                    {
                    }
                    column(G_L_Entry_Entry_No_; "Entry No.")
                    {
                    }
                    column(G_L_Entry_Document_No_; "Document No.")
                    {
                    }
                    column(G_L_Entry_Source_Code; "Source Code")
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        DebitTotal := DebitTotal + "Debit Amount";
                        CreditTotal := CreditTotal + "Credit Amount";
                    end;

                    trigger OnPreDataItem()
                    begin
                        SetRange("Posting Date", Date."Period Start", Date."Period End");
                    end;
                }
            }

            trigger OnAfterGetRecord()
            begin
                Year := Date2DMY("Period End", 3);
            end;

            trigger OnPreDataItem()
            begin
                Hidden := false;
                if GetFilter("Period Start") = '' then
                    Error(Text001, FieldCaption("Period Start"));
                if CopyStr(GetFilter("Period Start"), 1, 1) = '.' then
                    Error(Text002);
                StartDate := GetRangeMin("Period Start");
                DateFilterCalc.VerifMonthPeriod(GetFilter("Period Start"));
                DateFilterCalc.CreateFiscalYearFilter(TextDate, TextDate, StartDate, 0);
                TextDate := ConvertStr(TextDate, '.', ',');
                DateFilterCalc.VerifiyDateFilter(TextDate);
                TextDate := CopyStr(TextDate, 1, 8);
                Evaluate(PreviousStartDate, TextDate);
                if CopyStr(GetFilter("Period Start"), StrLen(GetFilter("Period Start")), 1) = '.' then
                    EndDate := 0D
                else
                    EndDate := GetRangeMax("Period Start");
                if EndDate = StartDate then
                    EndDate := DateFilterCalc.ReturnEndingPeriod(StartDate, Date."Period Type"::Month);
                FiscalYearStatusText := StrSubstNo(Text005, FiscalYearFiscalClose.CheckFiscalYearStatus(GetFilter("Period Start")));
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        Filter := Date.GetFilters;
    end;

    // [Scope('OnPrem')]
    // procedure VerifMonthPeriod("Filter": Text[30])
    // var
    //     Date: Record Date;
    //     FilterDate: Date;
    //     FilterPos: Integer;
    // begin
    //     if CopyStr(Filter, StrLen(Filter) - 1, 2) = '..' then
    //         exit;
    //     // Begin Check
    //     FilterPos := StrPos(Filter, '..');

    //     if FilterPos = 0 then
    //         Error(DateInsteadOfPeriodErr);

    //     Evaluate(FilterDate, CopyStr(Filter, 1, FilterPos - 1));
    //     Date.SetRange("Period Type", Date."Period Type"::Month);
    //     Date.SetRange(Date."Period Start", FilterDate);
    //     if not Date.Find('-') then
    //         Error(Text10801);

    //     Date.Reset();
    //     // Ending check
    //     if FilterPos <> 0 then begin
    //         Evaluate(FilterDate, CopyStr(Filter, FilterPos + 2, 8));
    //         Date.SetRange("Period Type", Date."Period Type"::Month);
    //         Date.SetRange(Date."Period End", ClosingDate(FilterDate));
    //         if not Date.Find('-') then
    //             Error(Text10802);
    //     end;
    // end;

    var
        Text001: Label 'You must fill in the %1 field.';
        Text002: Label 'You must specify a Starting Date.';
        Text003: Label 'Printed by %1';
        Text004: Label 'Page %1';
        // DateFilterCalc: Codeunit "DateFilter-Calc";
        DateFilterCalc: Codeunit "DateFilter-Calc Delta";

        FiscalYearFiscalClose: Codeunit "Fiscal Year-FiscalClose";
        StartDate: Date;
        EndDate: Date;
        PreviousStartDate: Date;
        TextDate: Text[30];
        DebitTotal: Decimal;
        CreditTotal: Decimal;
        "Filter": Text;
        Year: Integer;
        Text005: Label 'Fiscal-Year Status: %1';
        Hidden: Boolean;
        G_L_JournalCaptionLbl: Label 'G/L Journal';
        CodeCaptionLbl: Label 'Code';
        DescriptionCaptionLbl: Label 'Description';
        DebitCaptionLbl: Label 'Debit';
        CreditCaptionLbl: Label 'Credit';
        Grand_Total__CaptionLbl: Label 'Grand Total :';
        FiscalYearStatusText: Text;
        Text10801: Label 'The starting date must be the first day of a month.';
        Text10802: Label 'The ending date must be the last day of a month.';
        DateInsteadOfPeriodErr: Label 'You must enter a date interval, such as 01.01.17..31.01.17.';

}

