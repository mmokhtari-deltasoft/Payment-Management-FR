tableextension 60020 "Fixed Asset Ext" extends "Fixed Asset"
{
    fields
    {
        field(10810; "Professional Tax"; Option)
        {
            Caption = 'Professional Tax';
            OptionCaption = 'No Tax,Fixed Asset for more than 30 years 1,Fixed Asset for more than 30 years 2,Fixed Asset less than 30 years';
            OptionMembers = "No Tax","Fixed Asset for more than 30 years 1","Fixed Asset for more than 30 years 2","Fixed Asset less than 30 years";
        }

    }

}