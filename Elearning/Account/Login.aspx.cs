using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI;
using Elearning;
using System.Web.Security;
using ELearningDataSetTableAdapters;


public partial class Account_Login : Page
{
        protected void Page_Load(object sender, EventArgs e)
        {   
            
            
            //RegisterHyperLink.NavigateUrl = "Register";
            //OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            //var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            //if (!String.IsNullOrEmpty(returnUrl))
            //{
            //    RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            //}
        }

        protected void LogIn(object sender, EventArgs e)
        {

        if (Membership.ValidateUser(UserName.Text, Password.Text))
        {
            // Check Authentication

            if(Roles.IsUserInRole(UserName.Text, "Instructors"))
            {
                tbl_InstructorsTableAdapter instructor = new tbl_InstructorsTableAdapter();

                Session["InstructorID"] = instructor.GetInstructorID(UserName.Text);

                //Response.Write(Session["InstructorID"].ToString());

                FormsAuthentication.SetAuthCookie(UserName.Text, true);

                Response.Redirect("~/Default.aspx");
            }

            else if (Roles.IsUserInRole(UserName.Text, "Students"))
            {
                tbl_StudentsTableAdapter student = new tbl_StudentsTableAdapter();

                Session["StudentsID"] = student.GetStudentID(UserName.Text);

                FormsAuthentication.SetAuthCookie(UserName.Text, true);

                Response.Redirect("~/Default.aspx");
            }

        }


        //if (IsValid)
        //{
        //    // Validate the user password
        //    var manager = new UserManager();
        //    ApplicationUser user = manager.Find(UserName.Text, Password.Text);
        //    if (user != null)
        //    {
        //        IdentityHelper.SignIn(manager, user, RememberMe.Checked);
        //        IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
        //    }
        //    else
        //    {
        //        FailureText.Text = "Invalid username or password.";
        //        ErrorMessage.Visible = true;
        //    }
        //}
    }
}