<%@ Page Title="Leave Application" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs"
    Inherits="LeaveApplication.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        body {
            background-color: #f2f2f2;
        }

        .container {
            width: 700px;
            margin: 30px auto;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px gray;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        h2 {
            margin-top: 30px;
            color: #c00000;
        }

        .label {
            display: block;
            font-weight: bold;
            margin-top: 15px;
            margin-bottom: 5px;
        }

        .textbox {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .radio {
            margin-right: 20px;
        }

        .calendar {
            margin-top: 10px;
            margin-bottom: 15px;
        }

        .button {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background-color: palevioletred;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .button:hover {
            background-color: red;
        }

        .message {
            display: block;
            margin-top: 20px;
            padding: 10px;
            text-align: center;
            font-weight: bold;
        }

        .result {
            margin-top: 20px;
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 5px;
            line-height: 1.8;
        }
    </style>

    <div class="container">

        <h1>Academic Calendar & Leave Management</h1>

        <h2>User Info</h2>

        <asp:Label ID="lblName"
            runat="server"
            Text="Student Or Faculty Name"
            CssClass="label">
        </asp:Label>

        <asp:TextBox ID="txtName"
            runat="server"
            CssClass="textbox">
        </asp:TextBox>


        <h2>Academic Calendar</h2>

        <asp:Label ID="lblCalendar"
            runat="server"
            Text="Submit your Leave Date"
            CssClass="label">
        </asp:Label>

        <asp:Calendar ID="calAcademic"
            runat="server"
            CssClass="calendar"
            OnSelectionChanged="calAcademic_SelectionChanged">
        </asp:Calendar>

        <asp:Label ID="lblSelectedDate"
            runat="server"
            Text="Selected Date: Not Selected">
        </asp:Label>


        <asp:Label ID="lblEventType"
            runat="server"
            Text="Select Type"
            CssClass="label">
        </asp:Label>

        <asp:RadioButton ID="rbAcademic"
            runat="server"
            Text="Academic Event"
            GroupName="EventType"
            CssClass="radio">
        </asp:RadioButton>

        <asp:RadioButton ID="rbLeave"
            runat="server"
            Text="Leave"
            GroupName="EventType"
            CssClass="radio">
        </asp:RadioButton>


        <asp:Label ID="lblReason"
            runat="server"
            Text="Leave Reason"
            CssClass="label">
        </asp:Label>

        <asp:TextBox ID="txtReason"
            runat="server"
            TextMode="MultiLine"
            Rows="5"
            CssClass="textbox">
        </asp:TextBox>


        <asp:Button ID="btnSubmit"
            runat="server"
            Text="Submit"
            CssClass="button"
            OnClick="btnSubmit_Click">
        </asp:Button>


        <asp:Label ID="lblMessage"
            runat="server"
            CssClass="message">
        </asp:Label>


        <div class="result">
            <asp:Label ID="lblResult"
                runat="server">
            </asp:Label>
        </div>

    </div>

</asp:Content>