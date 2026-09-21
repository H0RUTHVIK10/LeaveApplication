using System;
using System.Web;

namespace LeaveApplication
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMessage.Text = "";
                lblResult.Text = "";

                // Read name from Cookie
                HttpCookie cookie = Request.Cookies["UserName"];

                if (cookie != null)
                {
                    txtName.Text = cookie.Value;
                }
            }
        }

        // Calendar event
        protected void calAcademic_SelectionChanged(object sender, EventArgs e)
        {
            DateTime selectedDate = calAcademic.SelectedDate;

            lblSelectedDate.Text =
                "Selected Date: " + selectedDate.ToShortDateString();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string description = txtReason.Text;

            DateTime selectedDate = calAcademic.SelectedDate;

            string eventType = "";

            if (rbAcademic.Checked)
            {
                eventType = "Academic Event";
            }
            else if (rbLeave.Checked)
            {
                eventType = "Leave";
            }

            // Validation

            if (string.IsNullOrWhiteSpace(name))
            {
                lblMessage.Text = "Please enter your name.";
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;
                return;
            }

            if (selectedDate == DateTime.MinValue)
            {
                lblMessage.Text = "Please select a date.";
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;
                return;
            }

            if (eventType == "")
            {
                lblMessage.Text =
                    "Please select Academic Event or Leave.";
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;
                return;
            }

            if (string.IsNullOrWhiteSpace(description))
            {
                lblMessage.Text =
                    "Please enter description.";
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;
                return;
            }

            // Store details in Session
            Session["UserName"] = name;
            Session["SelectedDate"] =
                selectedDate.ToShortDateString();
            Session["EventType"] = eventType;
            Session["Description"] = description;

            // Store name in Cookie
            HttpCookie userCookie =
                new HttpCookie("UserName");

            userCookie.Value = name;
            userCookie.Expires =
                DateTime.Now.AddDays(7);

            Response.Cookies.Add(userCookie);

            // Success message
            lblMessage.Text =
                "Details Saved Successfully!";

            lblMessage.ForeColor =
                System.Drawing.Color.Green;

            // Display result
            lblResult.Text =
                "<b>Name:</b> " + name + "<br/>" +
                "<b>Date:</b> " +
                selectedDate.ToShortDateString() +
                "<br/>" +
                "<b>Type:</b> " +
                eventType +
                "<br/>" +
                "<b>Description:</b> " +
                description;
        }
    }
}