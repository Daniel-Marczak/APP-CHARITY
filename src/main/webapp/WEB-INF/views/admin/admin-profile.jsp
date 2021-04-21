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
<header class="header" style="text-align: center">
    <jsp:include page="../jspf/admin-header.jsp"/>

    <div class="container container--90 user-info-d-visible" style="padding-top: 60px">
        <h1 style="margin-bottom: 60px">
            <spring:message code="app.user-profile-info-h2"/>
        </h1>
        <div class="form-group">
            <c:if test="${param.userUpdate == 'success'}">
                <p style="color: #08b910; font-size: 16px"><spring:message code="app.user-profile-edit-success-msg"/></p>
            </c:if>
        </div>
        <div class="form-group">
            <label>
                <input class="user-info-input" type="text" readonly value="${sessionScope.user.email}">
            </label>
            <label>
                <input class="user-info-input" type="text" readonly value="${sessionScope.user.name}">
            </label>
            <label>
                <input class="user-info-input" type="text" readonly value="${sessionScope.user.surname}">
            </label>
        </div>
        <div class="form-group form-group--buttons" style="margin-top: 50px; margin-bottom: 50px">
            <button class="btn edit-profile-btn" type="submit"><spring:message code="app.user-profile-edit-profile-btn"/></button>
        </div>
    </div>

    <div class="container container--90 user-info-d-none" style="padding-top: 60px">
        <h1 style="margin-bottom: 60px"><spring:message code="app.user-profile-edit-h2"/></h1>
        <form:form modelAttribute="updateAdmin" action="/admin/profile" method="post">
            <form:hidden path="id"/>
            <form:hidden path="roles"/>
            <form:hidden path="enabled"/>
            <div class="form-group">
                <spring:message code="app.registration-email-ph" var="name_ph"/>
                <form:input path="email" type="email" cssClass="update-user-email form-control form-control-user" placeholder='${name_ph}'/>
                <p class="reg-error"><form:errors path="email"/></p>
                <div class="hidden error-div-user-edit-email-pattern" style="margin-top: 10px">
                    <spring:message code="validation.error-user-email-pattern"/>
                </div>
                <div class="hidden error-div-user-edit-mail-unavailable" style="margin-top: 10px">
                    <spring:message code="validation.error-user-email-unavailable"/>
                </div>
            </div>
            <div class="form-group">
                <spring:message code="app.registration-name-ph" var="name_ph"/>
                <form:input path="name" type="text" cssClass="update-user-name form-control form-control-user"  placeholder='${name_ph}'/>
                <p class="reg-error"><form:errors path="name"/></p>
                <div class="hidden error-div-user-edit-name" style="margin-top: 10px">
                    <spring:message code="validation.error-user-name-pattern"/>
                </div>
            </div>
            <div class="form-group">
                <spring:message code="app.registration-surname-ph" var="surname_ph"/>
                <form:input path="surname" type="text" cssClass="update-user-surname form-control form-control-user" placeholder='${surname_ph}'/>
                <p class="reg-error"><form:errors path="surname"/></p>
                <div class="hidden error-div-user-edit-surname" style="margin-top: 10px">
                    <spring:message code="validation.error-user-surname-pattern"/>
                </div>
            </div>
            <div class="form-group">
                <spring:message code="app.registration-password-ph" var="password_ph"/>
                <form:input path="password" type="password" cssClass="update-user-password"  placeholder='${password_ph}'/>
                <p class="reg-error"><form:errors path="password"/></p>
                <div class="hidden error-div-user-edit-password" style="margin-top: 10px">
                    <spring:message code="validation.error-user-password-pattern"/>
                </div>
            </div>
            <div class="form-group">
                <label>
                    <input  class="update-user-confirm-password" type="password" name="confirmPassword" placeholder='<spring:message code="app.registration-confirm-password-ph"/>'/>
                </label>
                <div class="hidden error-div-user-edit-confirm-password" style="margin-top: 10px">
                    <spring:message code="validation.error-user-passwords-are-different"/>
                </div>
            </div>
            <div class="edit-profile-btn-div" >
                <button style="float: left; width: 160px" class="btn show-profile-btn" type="button">
                    <spring:message code="app.user-profile-show-profile-btn"/>
                </button>
                <button class="btn update-user-check-form-btn" type="button" style="float: right">
                    <spring:message code="app.registration-check-form-btn"/>
                </button>
                <button style="float: right" class="btn save-profile-changes-btn hidden" type="submit">
                    <spring:message code="app.user-profile-update-profile-btn"/>
                </button>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form:form>
    </div>
</header>

<script src="<c:url value="/resources/js/user-profile.js"/>"></script>
</body>
</html>

