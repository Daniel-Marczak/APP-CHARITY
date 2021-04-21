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
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/custom-styles.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/user-profile.css"/>"/>
</head>
<body class="custom-scrollbar">
<header class="header--form-page" style="text-align: center">
    <jsp:include page="../jspf/user-header.jsp"/>

    <div class="container container--90">
        <h2><spring:message code="app.emergency-password-reset-heading-h2"/></h2>

        <form:form modelAttribute="userEmergency">
            <form:hidden path="id"/>
            <form:hidden path="roles"/>
            <form:hidden path="enabled"/>
            <form:hidden path="email"/>
            <form:hidden path="name"/>
            <form:hidden path="surname"/>

            <div class="form-group">
                <spring:message code="app.registration-password-ph" var="password_ph"/>
                <form:input path="password" type="password" class="emergency-reset-password" placeholder='${password_ph}'/>
                <p class="reg-error"><form:errors path="password"/></p>
                <div class="hidden error-div-emergency-reset-password" style="margin-top: 10px">
                    <spring:message code="validation.error-user-password-pattern"/>
                </div>
            </div>
            <div class="form-group">
                <label>
                    <input class="emergency-reset-confirm-password" type="password" name="confirmPassword"
                           placeholder='<spring:message code="app.registration-confirm-password-ph"/>'
                    />
                </label>
                <div class="hidden error-div-emergency-reset-confirm-password" style="margin-top: 10px">
                    <spring:message code="validation.error-user-passwords-are-different"/>
                </div>
            </div>
            <div class="edit-profile-btn-div">
                <button class="btn emergency-reset-check-password-btn" type="button">
                    <spring:message code="app.emergency-password-reset-test-password-btn"/>
                </button>
                <button class="btn hidden emergency-reset-change-password-btn" type="submit">
                    <spring:message code="app.emergency-password-reset-reset-password-btn"/>
                </button>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form:form>
    </div>
</header>

<jsp:include page="../jspf/user-footer.jsp"/>
<script src="<c:url value="/resources/js/login-emergency-password-reset.js"/>"></script>
</body>
</html>

