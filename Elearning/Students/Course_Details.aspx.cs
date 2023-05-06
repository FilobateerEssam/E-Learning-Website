using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ELearningDataSetTableAdapters;
using DevExpress.Web;

public partial class Students_Course_Details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            tbl_CoursesTableAdapter course = new tbl_CoursesTableAdapter();
            ASPxGridView1.DataSource = course.GetBycourseID(Convert.ToInt32( Session["courseid"]));
            ASPxGridView1.DataBind();

            tbl_QuestionsTableAdapter question = new tbl_QuestionsTableAdapter();
            ASPxGridView2.DataSource = question.GetByCourseID(Convert.ToInt32(Session["courseid"]));
            ASPxGridView2.DataBind();

        }
        
    }

    protected void AnswersGrid_BeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["questionid"] = (sender as ASPxGridView).GetMasterRowKeyValue();

    }
}