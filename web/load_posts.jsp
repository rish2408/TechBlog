<%-- 
    Document   : load_posts
    Created on : 28-Dec-2020, 8:30:25 pm
    Author     : Rishabh Srivastava
--%>

<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>

<div class="row">
    <%
        PostDao dao = new PostDao(ConnectionProvider.getConnection());

    //    Get post using id
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> list = null;
        if (cid == 0) {
            list = dao.getAllPosts();
        } else {
            list = dao.getPostByCatId(cid);
        }
        if (list.size()==0) {
                out.println("<h3 class='display-2 text-center'>No Posts in this Category....</h3>");
            }
        for (Post post : list) {
    %>

    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top" src="blog_pics/<%=post.getpPic()%>" alt="Card image cap">
            <div class="card-body">
                <b><%=post.getpTitle()%></b>
                <p><%=post.getpContent()%></p>
                <!--<pre><%=post.getpCode()%></pre>-->
            </div>
            <div class="card-footer primary-background text-center">
                <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span> 10</span></a>
                <a href="show_blog_page.jsp?post_id=<%= post.getPid()%>" class="btn btn-outline-light btn-sm">Read More...</a>
                <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span> 20</span></a>
            </div>
        </div>
    </div>

    <%
        }
    %>
</div>