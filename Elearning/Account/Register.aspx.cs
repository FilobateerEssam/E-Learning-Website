using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using Elearning;
using System.Web.Security;
using ELearningDataSetTableAdapters;

public partial class Account_Register : Page
{
    protected void CreateUser_Click(object sender, EventArgs e)
    {
        //var manager = new UserManager();
        //var user = new ApplicationUser() { UserName = UserName.Text };
        //IdentityResult result = manager.Create(user, Password.Text);
        //if (result.Succeeded)
        //{
        //    IdentityHelper.SignIn(manager, user, isPersistent: false);
        //    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
        //}
        //else
        //{
        //    ErrorMessage.Text = result.Errors.FirstOrDefault();
        //}

        if(RadInstructor.Checked == true)
        {
            // TableAdapter to Access in DB
            tbl_InstructorsTableAdapter instructor = new tbl_InstructorsTableAdapter();

            // create a user and save data 
            Membership.CreateUser(UserName.Text, Password.Text);

            // give him Role
            Roles.AddUserToRole(UserName.Text, "Instructors");

            //insert to database
            instructor.Insert(txtfullname.Text, UserName.Text,Password.Text);

            // Move to Home Page
            Response.Redirect("~/Default.aspx");

        }
        else if (RadStudent.Checked == true)
        {
            // TableAdapter to Access in DB
            tbl_StudentsTableAdapter student = new tbl_StudentsTableAdapter();
            
            // create a user and save data 
            Membership.CreateUser(UserName.Text, Password.Text);
           
            // give him Role
            Roles.AddUserToRole(UserName.Text, "Students");

            //insert to database
            student.Insert(txtfullname.Text, UserName.Text, Password.Text);

            // Move to Home Page
            Response.Redirect("~/Default.aspx");

        }
    }
}