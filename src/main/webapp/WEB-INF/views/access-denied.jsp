<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html lang="pl" style="scroll-behavior: smooth">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title><spring:message code="app.page-title"/></title>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/custom-styles.css"/>"/>
</head>
<body class="custom-scrollbar">
<header class="header--main-page">
    <jsp:include page="/WEB-INF/views/jspf/user-header.jsp"/>


    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                <spring:message code="app.access-denied-heading-1"/> <br>
                <spring:message code="app.access-denied-heading-2"/>
            </h1>
        </div>
    </div>

</header>

<jsp:include page="jspf/user-footer.jsp"/>
</body>
</html>
