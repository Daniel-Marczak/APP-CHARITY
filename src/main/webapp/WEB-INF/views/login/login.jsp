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
    <c:if test="${param.registration == 'success'}">
        <p style="color: #08b910; font-size: 16px"><spring:message code="app.registration-successful-text"/></p>
    </c:if>
    <c:if test="${param.passwordChange == 'success'}">
        <p style="color: #08b910; font-size: 16px"><spring:message code="app.login-reset-password-password-change-successful"/></p>
    </c:if>
    <c:if test="${param.error == 'userIsBanned'}">
        <p style="color: red; font-size: 16px"><spring:message code="app.login-banned-user-info-1"/></p>
        <p style="color: red; font-size: 16px"><spring:message code="app.login-banned-user-info-2"/></p>
    </c:if>
    <c:if test="${param.error == 'invalidUserOrPassword'}">
        <p style="color: red; font-size: 16px"><spring:message code="app.login-login-invalid-email-or-password"/></p>
    </c:if>
    <c:if test="${param.error == 'linkExpired'}">
        <p style="color: red; font-size: 16px"><spring:message code="app.login-reset-password-email-link-expired"/></p>
    </c:if>
    <p class="hidden" id="error-div-login-and-password" style="color: red; font-size: 16px">
        <spring:message code="validation.error-login-empty-email-or-password"/>
    </p>
        <div>
            <h2>
                <spring:message code="app.login-page-heading-h2"/>
            </h2>
        </div>
        <div>

        </div>
        <form id="login-form" action="<c:url value="/login"/>" method="post">
            <div class="form-group">
                <label>
                    <input type="email" name="email" placeholder="<spring:message code="app.login-email-ph"/>"/>
                </label>
            </div>
            <div class="form-group">
                <label>
                    <input type="password" name="password" placeholder="<spring:message code="app.login-password-ph"/>"/>
                </label>
                <a href="<c:url value="/forgot-password"/>" class="btn btn--small btn--without-border reset-password">
                    <spring:message code="app.login-reset-password-href"/>
                </a>
            </div>

            <div class="form-group form-group--buttons">
                <a href="<c:url value="/registration"/>" class="btn btn--without-border">
                    <spring:message code="app.login-register-href"/>
                </a>
                <button class="btn login-btn" type="button">
                    <spring:message code="app.login-login-btn"/>
                </button>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
</section>

<jsp:include page="/WEB-INF/views/jspf/user-footer.jsp"/>
<script src="<c:url value="/resources/js/login.js"/>"></script>

</body>
</html>

