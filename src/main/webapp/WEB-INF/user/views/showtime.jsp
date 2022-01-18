<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="xemphim.model.*" %>
<%@ page import="java.util.*" %>

<% 
	if (request.getAttribute("data") == null) { 
%>
	<div style="width:90%; margin:0 auto; padding:50px; ">
      <h2 style="text-align: center; color:red">Chưa có lịch chiếu. Vui lòng chọn ngày khác</h2>
    </div>
<%
	}else{
%>

	<style>
            .site.sitecgv {
                display: inline-block;
                width: 100%;
                border-bottom: 1px solid #222;
                margin: 0 auto;
                padding-top: 20px;
                padding-bottom: 10px;
                margin-bottom: 20px;
            }
        </style>
        <%
        	Map<String, List<Suatchieu>> map = (Map<String, List<Suatchieu>>)request.getAttribute("data");
        	
        	for(Map.Entry<String, List<Suatchieu>> list : map.entrySet()){
        		%>
        		<div class="site sitecgv">
            		<div><h3 style="color:red"><%= list.getKey() %></h3></div>
            	<ul>
        		
        		<%
        			for(Suatchieu sc : list.getValue()){
        		%>
        			<li>
                    	<a style="font-size:20;border:2px double #b1154a;margin-right:12px;margin-bottom:12px;" href="<c:url value="/datve/" /><%= sc.getId() %>">
                        	<span><fmt:formatDate value="<%= sc.getThoidiembatdau() %>" pattern="HH:mm"/><i class="ion-ios-arrow-right"></i></span>
                    	</a>
                	</li>
        		
        		<%
        			}
        		%>
        			</ul>
        		</div>
        		
        		<%
        	}
	}
%>