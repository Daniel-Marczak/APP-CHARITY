<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sprinhg" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="pl" style="scroll-behavior: smooth">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title><spring:message code="app.page-title"/></title>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" />
    <link rel="stylesheet" href="<c:url value="/resources/css/custom-styles.css"/>"/>

</head>
<body class="custom-scrollbar">
<header class="header--form-page">
    <jsp:include page="../jspf/user-header.jsp"/>

    <<div class="slogan container container--90">
    <h2>
        <spring:message code="app.donation-form-confirmation-h2-1"/><br>
        <c:if test="${empty param.info}">
            <spring:message code="app.donation-form-confirmation-h2-2"/>
        </c:if>
        <c:if test="${!empty param.info && param.info == 'emailNotSent'}">
            <spring:message code="app.donation-form-confirmation-h2-3"/>
        </c:if>
    </h2>

</div>
</header>


<jsp:include page="../jspf/user-footer.jsp"/>
</body>
</html>
