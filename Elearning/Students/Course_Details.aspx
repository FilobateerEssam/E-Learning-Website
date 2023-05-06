<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Course_Details.aspx.cs" Inherits="Students_Course_Details" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <h3>Courses</h3>
    <hr />

    <dx:ASPxGridView ID="ASPxGridView1" Settings-ShowColumnHeaders="false" Width="100%" runat="server">
        
        <Templates>
            <DataRow>

                <div style="padding:15px">
                    <h2>

                        <%#Eval("course_title") %>
                    </h2>
                    <br />

                    <div>

                        <%#Eval("course_content") %>

                    </div>

                </div>

            </DataRow>
        </Templates>

    </dx:ASPxGridView>
    

    <br />
    <h3> Attempt Quiz Questions </h3>

    <hr />

                <dx:ASPxGridView ID="ASPxGridView2" Settings-ShowColumnHeaders="false"  Width="100%" runat="server" AutoGenerateColumns="False" KeyFieldName="question_id">
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
                                        <dx:ASPxGridView ID="AnswersGrid" Settings-ShowColumnHeaders="false" runat="server" DataSourceID="ObjectDataSource3"
                                            KeyFieldName="answer_id" Width="100%"  OnBeforePerformDataSelect="AnswersGrid_BeforePerformDataSelect"  >
                                             
                                            <Templates>

                                                <DataRow>

                                                    <table style="width:100% ;  Padding:10px">

                                                        <tr>

                                                            <td>
                                                                <asp:CheckBox ID="CheckBox1" runat="server" Text='<%#Eval("correct_answer") %>' />

                                                            </td>

                                                        </tr>



                                                        <tr>

                                                            <td>
                                                                <asp:CheckBox ID="CheckBox2" runat="server" Text='<%#Eval("option_a") %>' />

                                                            </td>

                                                        </tr>


                                                        <tr>

                                                            <td>
                                                                <asp:CheckBox ID="CheckBox3" runat="server" Text='<%#Eval("option_b") %>' />

                                                            </td>

                                                        </tr>


                                                        <tr>

                                                            <td>
                                                                <asp:CheckBox ID="CheckBox4" runat="server" Text='<%#Eval("option_c") %>' />

                                                            </td>

                                                        </tr>

                                                    </table>

                                                </DataRow>
                                            </Templates>
                                          
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
    


    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server"   OldValuesParameterFormatString="original_{0}" SelectMethod="GetByQuestionID" TypeName="ELearningDataSetTableAdapters.tbl_AnswersTableAdapter" >
       
        <SelectParameters>
            <asp:SessionParameter Name="questionid" SessionField="questionid" Type="Int32" />
        </SelectParameters>
        
    </asp:ObjectDataSource>



</asp:Content>

