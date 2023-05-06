using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ELearningDataSetTableAdapters;

public partial class Students_ViewCourses : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ww_CoursesTableAdapter course = new ww_CoursesTableAdapter();
            ASPxCardView1.DataSource = course.GetData();
            ASPxCardView1.DataBind();
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton lnk = (LinkButton)sender;

        Session["courseid"] = lnk.CommandArgument;
        Response.Redirect("~/Students/Course_Details.aspx"); 
    }
}