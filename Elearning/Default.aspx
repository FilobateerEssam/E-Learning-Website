<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>E-Learning</h1>
        <p class="lead">An Offical Learning Website & Gain Knowledge , Find Your Path.</p>
        <p><a href="https://www.udemy.com/home/my-courses/learning/?sort=-last_accessed" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                 Make an Account , to be access our LMS Website and See Your Grades.
            </p>
            <p>
                <a class="btn btn-default" href="http://localhost:8080/Elearning/Account/Register">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Increae your Knowledge </h2>
            <p>
                Knowledge itself is not power but true power lies in the application of Knowledge.
            </p>
            <p>
                <a class="btn btn-default" href="https://www.udemy.com/home/my-courses/learning/?sort=-last_accessed">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Many Exercises</h2>
            <p>
                 by Training Every Thing Will be Okay.
            </p>
            <p>
                <a class="btn btn-default" href="https://www.tutorialspoint.com/index.htm">Learn more &raquo;</a>
            </p>
        </div>
    </div>
</asp:Content>
