﻿<%@ Import Namespace="CloudEDUServer" %>

<body>
    <%
       if (Session["manager"] == null)
       {
           Response.Redirect("Login.aspx");
           Response.End();
       }
       MANAGER tempManager=(MANAGER)Session["manager"];
    %>
    <div class="grid_12 header-repeat">
        <div id="branding">
            <div class="floatleft">
                <img src="img/logo.png" alt="Logo" />
            </div>
            <div class="floatright">
                <div class="floatleft">
                    <span class="small grey"><%=tempManager.NAME%></span>

                </div>
                <div class="floatleft marginleft10">
                    <ul class="inline-ul floatleft">
                        <li style="margin-left: 10px"><a href="Logout.aspx">Logout</a></li>
                    </ul>
                    <br />
                </div>
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
    <div class="clear">
    </div>

    <div class="grid_10">
        <ul class="nav">
            <li class="ic-dashboard"><a href="Default.aspx"><span>Dashboard</span></a> </li>
        </ul>
    </div>
    <div class="clear">
    </div>


    <div class="grid_2">
        <div class="box sidemenu">
            <div class="block" id="section-menu">
                <ul class="section menu">
                    <li><a class="menuitem">User Management</a>
                        <ul class="submenu">
                            <li><a href="UserList.aspx">User List</a> </li>
                        </ul>
                    </li>
                    <% 
                          if (ManagerAccess.haveCourseViewPermission((MANAGER)Session["manager"]) || ManagerAccess.haveCourseCencorPermission((MANAGER)Session["manager"]))
                          {
                    %>
                    <li><a class="menuitem">Courstore Management</a>
                        <ul class="submenu">

                            <% 
                                if (ManagerAccess.haveCourseViewPermission((MANAGER)Session["manager"]))
                                {
                            %>
                            <li><a href="CourseList.aspx">Course List</a> </li>
                            <%}%>

                            <%
                                if (ManagerAccess.haveCourseStorePermission((MANAGER)Session["manager"]))
                                {
                            %>
                            <li><a href="RecommendationCourse.aspx">Recommendation</a></li>
                            <%}%>

                            <% 
                                if (ManagerAccess.haveCourseCencorPermission((MANAGER)Session["manager"]))
                                {
                            %>
                            <li><a href="CourseComment.aspx">Course Comment</a></li>
                            <li><a href="CourseCensorship.aspx">Course Censorship</a>
                                <%} %>
                        </ul>
                    </li>
                    <%}%>

                    <% 
                          if (ManagerAccess.haveManagerPermission((MANAGER)Session["manager"]))
                          {
                    %>
                    <li><a class="menuitem">Manager Management</a>
                        <ul class="submenu">
                            <li><a href="ManagerList.aspx">Manager list</a> </li>
                            <li><a href="PermissionList.aspx">Permission list</a> </li>
                        </ul>
                    </li>
                    <%}%>

                    <%
                         if (ManagerAccess.haveTransactionPermission((MANAGER)Session["manager"]))
                         {
                    %>
                    <li><a class="menuitem">Transaction Management</a>
                        <ul class="submenu">
                            <li><a href="TransactionList.aspx">Transaction List</a> </li>
                        </ul>
                    </li>
                    <%}%>


                    <%
                         if (ManagerAccess.haveDblogPermission((MANAGER)Session["manager"]))
                        {
                    %>
                    <li><a class="menuitem">Database Management</a>
                        <ul class="submenu">
                            <li><a href="DatabaseLog.aspx">Database Log</a> </li>
                        </ul>
                    </li>
                    <%} %>
                </ul>

                </ul>
            </div>
        </div>
    </div>
</body>
