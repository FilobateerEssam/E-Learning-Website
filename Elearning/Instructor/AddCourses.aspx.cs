using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ELearningDataSetTableAdapters;
using DevExpress.Web;

public partial class Instructor_AddCourses : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            tbl_CoursesTableAdapter course = new tbl_CoursesTableAdapter();
            ASPxGridView1.DataSource = course.GetByInstructorID((int)Session["InstructorID"]);
            ASPxGridView1.DataBind();
        }
    }

    protected void btnAddNewCourse_Click(object sender, EventArgs e)
    {
        Multiview1.SetActiveView(View2);
    }

    protected void btnsave1_Click(object sender, EventArgs e)
    {
        try
        {
            tbl_CoursesTableAdapter Course = new tbl_CoursesTableAdapter();

            Course.Insert(Convert.ToInt32(Session["InstructorID"]), txt_title.Text, html_content.Html);

            Response.Redirect("~/Instructor/AddCourses.aspx");

        } catch(Exception ex)
        {
            lblerror.Text = ex.ToString();
        }
    }

    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
    {
        if(e.CommandArgs.CommandName == "question")
        {
            Session["CourseID"] = e.CommandArgs.CommandArgument;

            LblQuestionA.Text = ASPxGridView1.GetRowValues(e.VisibleIndex, "course_title").ToString();

            Multiview1.SetActiveView(View3);
        }

        //else if (e.CommandArgs.CommandName == "answer")
        //{
        //    Session["CourseID"] = e.CommandArgs.CommandArgument;

        //    LblQuestionB.Text = ASPxGridView1.GetRowValues(e.VisibleIndex, "course_title").ToString();

        //    Multiview1.SetActiveView(View4);
        //}
    }

    protected void AnswersGrid_BeforePerformDataSelect(object sender, EventArgs e)
    {
        // when you put it past that code using DevExpress.Web;

        Session["questionid"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }
}