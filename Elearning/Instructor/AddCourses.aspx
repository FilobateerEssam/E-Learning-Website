<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddCourses.aspx.cs" Inherits="Instructor_AddCourses" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <h3>Courses</h3>
    <hr />
    <asp:Label ID="lblerror" runat="server" Font-Bold="true" ForeColor="Maroon" ></asp:Label>
    <asp:MultiView ID="Multiview1" runat="server" ActiveViewIndex="0">

        <asp:View ID="View1" runat="server">

            <h5> List of Courses</h5>

            <div style="float:right">
                <asp:Button ID="btnAddNewCourse" OnClick="btnAddNewCourse_Click" CssClass="btn btn-outline-primary" runat="server" Text="Add New Course" />
            </div>
            <br /> <br />


            <dx:ASPxGridView ID="ASPxGridView1" OnRowCommand="ASPxGridView1_RowCommand" Width="100%" runat="server">

                <Columns>

                    <dx:GridViewDataTextColumn FieldName="course_title" Caption="courses"></dx:GridViewDataTextColumn>

                    <dx:GridViewDataColumn>

                        <DataItemTemplate>

                            <asp:Button ID="Button1" CssClass="btn btn-outline-dark" BorderColor="Red" ForeColor="Red" CommandName="question" CommandArgument= '<%#Eval("course_id") %>' runat="server" Text="Add Quiz Questions" />

                        </DataItemTemplate>

                    </dx:GridViewDataColumn>


                </Columns>


            </dx:ASPxGridView>

        </asp:View>

        <asp:View ID="View2" runat="server">

            <h5> Add a New Courses</h5>      
            <br />

            <div class="row">

                <div class="col-md-2" style="padding:5px">
                    Course Title
                </div>

                <div class="col-md-10" style="padding:5px">
                    <asp:TextBox ID="txt_title" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="col-md-2" style="padding:5px">
                    Course Content
                </div>

                 <div class="col-md-10" style="padding:5px">

                     <dx:ASPxHtmlEditor ID="html_content" runat="server"></dx:ASPxHtmlEditor>
                 </div>

                
               
                <div class="col-md-2" style="padding:5px"></div>
                <div class="col-md-10" style="padding:5px">

                    <asp:Button ID="btnsave1" OnClick="btnsave1_Click" CssClass="btn btn-outline-primary" runat="server" Text="Save and Continue " />
                </div>

            </div>

        </asp:View>

        <asp:View ID="View3" runat="server">

            <h5> Add Quiz Questions to 

                <asp:Label ID="LblQuestionA" Font-Bold="true" runat="server" ></asp:Label>
            </h5>
            <br />

            <dx:ASPxGridView ID="ASPxGridView2" DataSourceID="ObjectDataSource2" Width="100%" runat="server" AutoGenerateColumns="False" KeyFieldName="question_id">
                <SettingsAdaptivity>
                    <AdaptiveDetailLayoutProperties ColCount="1">
                    </AdaptiveDetailLayoutProperties>
                </SettingsAdaptivity>
                <EditFormLayoutProperties ColCount="1">
                </EditFormLayoutProperties>
                <Columns>
                    <dx:GridViewCommandColumn ShowNewButtonInHeader ="true" ShowEditButton="true" ></dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="question_id"  Visible="false" ReadOnly="True" VisibleIndex="0">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn FieldName="course_id" Visible="false" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="question" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                </Columns>

                <Templates>

                    <DetailRow>
                <div style="padding: 3px 3px 2px 3px">
                    <dx:ASPxPageControl runat="server" ID="pageControl" Width="100%" EnableCallBacks="true">
                        <TabPages>
                            <dx:TabPage Text="Answers" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView ID="AnswersGrid" runat="server" DataSourceID="ObjectDataSource3"
                                            KeyFieldName="answer_id" Width="100%" OnBeforePerformDataSelect="AnswersGrid_BeforePerformDataSelect" >
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowNewButtonInHeader="true" ShowEditButton="true"></dx:GridViewCommandColumn>
                                                <dx:GridViewDataColumn FieldName="correct_answer" />
                                                <dx:GridViewDataColumn FieldName="option_a" />
                                                <dx:GridViewDataColumn FieldName="option_b" />
                                                <dx:GridViewDataTextColumn FieldName="option_c">

                                                </dx:GridViewDataTextColumn>
                                            
                                            </Columns>
                                          
                                        </dx:ASPxGridView>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            
                        </TabPages>
                    </dx:ASPxPageControl>
                </div>
            </DetailRow>

                </Templates>
                
                 <SettingsDetail ShowDetailRow="true" AllowOnlyOneMasterRowExpanded="true" />
                                            <Settings ShowFooter="true" />
                                            <SettingsPager EnableAdaptivity="true" />
                                            <Styles Header-Wrap="True"/>

            </dx:ASPxGridView>
            
            <br />


        </asp:View>



       
    </asp:MultiView>

     <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetByCourseID" TypeName="ELearningDataSetTableAdapters.tbl_QuestionsTableAdapter" UpdateMethod="Update">
         <DeleteParameters>
             <asp:Parameter Name="Original_question_id" Type="Int32" />
         </DeleteParameters>
         <InsertParameters>
             <asp:SessionParameter Name="course_id" SessionField="courseid" Type="Int32" />
             <asp:Parameter Name="question" Type="String" />
         </InsertParameters>
         <SelectParameters>
             <asp:SessionParameter Name="courseid" SessionField="courseid" Type="Int32" />
         </SelectParameters>
         <UpdateParameters>
             <asp:SessionParameter Name="course_id" SessionField="courseid" Type="Int32" />
             <asp:Parameter Name="question" Type="String" />
             <asp:Parameter Name="Original_question_id" Type="Int32" />
         </UpdateParameters>
    </asp:ObjectDataSource>
    
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetByQuestionID" TypeName="ELearningDataSetTableAdapters.tbl_AnswersTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_answer_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:SessionParameter Name="question_id" SessionField="questionid" Type="Int32" />
            <asp:Parameter Name="correct_answer" Type="String" />
            <asp:Parameter Name="option_a" Type="String" />
            <asp:Parameter Name="option_b" Type="String" />
            <asp:Parameter Name="option_c" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="questionid" SessionField="questionid" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:SessionParameter Name="question_id" SessionField="questionid" Type="Int32" />
            <asp:Parameter Name="correct_answer" Type="String" />
            <asp:Parameter Name="option_a" Type="String" />
            <asp:Parameter Name="option_b" Type="String" />
            <asp:Parameter Name="option_c" Type="String" />
            <asp:Parameter Name="Original_answer_id" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>

