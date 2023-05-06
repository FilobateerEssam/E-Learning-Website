<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewCourses.aspx.cs" Inherits="Students_ViewCourses" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <h3>Courses</h3>
    <hr />
    <dx:ASPxCardView ID="ASPxCardView1" Width="100%" runat="server">
        <Columns>
            <dx:CardViewTextColumn FieldName="course_title"></dx:CardViewTextColumn>
            <dx:CardViewTextColumn FieldName="instructor_full_name"></dx:CardViewTextColumn>

        </Columns>
        <Templates>
            <Card>
                <div style="padding: 10px">


                    <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" CommandArgument=<%#Eval("course_id") %> Font-Bold="true" runat="server"> <%#Eval("course_title") %> </asp:LinkButton>

                    <br />
                    <br />
                    <h4>BY</h4>
                    <br />
                    <h3>

                        <%#Eval("instructor_full_name") %>

                    </h3>
                </div>
            </Card>

        </Templates>

    </dx:ASPxCardView>

</asp:Content>

