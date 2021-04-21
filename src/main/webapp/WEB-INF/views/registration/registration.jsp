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
</head>
<body class="custom-scrollbar">
<header>
    <jsp:include page="/WEB-INF/views/jspf/user-header.jsp"/>
</header>

<section class="login-page">
    <h2><spring:message code="app.registration-page-heading-h2"/></h2>
    <form:form id="registration-form"  modelAttribute="newUser">
        <div class="form-group" style="text-align: center">
            <spring:message code="app.registration-email-ph" var="name_ph"/>
            <form:input id="registration-input-email" path="email" type="email" class="form-control form-control-user" placeholder='${name_ph}'/>
            <div class="reg-error"><form:errors path="email"/></div>
            <div id="error-div-email-unavailable" class="hidden registration-error-div">
                <spring:message code="validation.error-user-email-unavailable"/>
            </div>
            <div id="error-div-email-pattern" class="hidden registration-error-div">
                <spring:message code="validation.error-user-email-pattern"/>
            </div>
        </div>
        <div class="form-group" style="text-align: center">
            <spring:message code="app.registration-name-ph" var="name_ph"/>
            <form:input id="registration-input-name" path="name" type="text" class="form-control form-control-user" placeholder='${name_ph}'/>
            <div class="reg-error"><form:errors path="name"/></div>
            <div id="error-div-name" class="hidden registration-error-div">
                <spring:message code="validation.error-user-name-pattern"/>
            </div>
        </div>
        <div class="form-group" style="text-align: center">
            <spring:message code="app.registration-surname-ph" var="surname_ph"/>
            <form:input id="registration-input-surname" path="surname" type="text" class="form-control form-control-user" placeholder='${surname_ph}'/>
            <div class="reg-error"><form:errors path="surname"/></div>
            <div id="error-div-surname" class="hidden registration-error-div">
                <spring:message code="validation.error-user-surname-pattern"/>
            </div>
        </div>
        <div class="form-group" style="text-align: center">
            <spring:message code="app.registration-password-ph" var="password_ph"/>
            <form:input id="registration-input-password" path="password" type="password"  placeholder='${password_ph}'/>
            <div class="reg-error"><form:errors path="password"/></div>
            <div id="error-div-password" class="hidden registration-error-div">
                <spring:message code="validation.error-user-password-pattern"/>
            </div>
        </div>
        <div class="form-group" style="text-align: center">
            <input type="password" id="registration-input-confirm-password" name="confirmPassword"
                   placeholder='<spring:message code="app.registration-confirm-password-ph"/>'
            />
            <c:if test="${param.registration == 'differentPasswords'}">
                <div class="reg-error"><spring:message code="app.registration-different-passwords"/></div>
            </c:if>
            <div id="error-div-confirm-password" class="hidden registration-error-div" style="margin-top: 10px">
                <spring:message code="validation.error-user-passwords-are-different"/>
            </div>
        </div>

        <div class="form-group form-group--buttons" style="margin: 0 auto">
            <button id="registration-ready-btn" class="btn " type="button" style="margin: 0 auto; margin-top: 50px">
                <spring:message code="app.registration-check-form-btn"/>
            </button>
            <button id="registration-submit-btn" class="btn hidden" type="button" style="margin: 0 auto; margin-top: 50px">
                <spring:message code="app.registration-form-submit-btn"/>
            </button>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form:form>
</section>

<jsp:include page="../jspf/user-footer.jsp"/>
<script src="<c:url value="/resources/js/registration-form.js"/>"></script>
</body>
</html>

