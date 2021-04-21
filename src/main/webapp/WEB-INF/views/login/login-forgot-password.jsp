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
    <link rel="stylesheet" href="<c:url value="/resources/css/reset-password.css"/>"/>
</head>
<body class="custom-scrollbar">
<header>
    <jsp:include page="/WEB-INF/views/jspf/user-header.jsp"/>
</header>

<section class="login-page">
    <c:if test="${param.reset == 'emailSent'}">
        <p style="color: #08b910; font-size: 16px">
            <spring:message code="app.login-reset-password-success-email-sent"/>
        </p>
    </c:if>
    <c:if test="${param.reset == 'invalidEmail'}">
        <p style="color: red; font-size: 16px">
            <spring:message code="app.login-reset-password-error-invalid-email"/>
        </p>
    </c:if>
    <c:if test="${param.reset == 'invalidResult'}">
        <p style="color: red; font-size: 16px">
            <spring:message code="app.login-reset-password-error-invalid-result"/>
        </p>
    </c:if>

    <h2>
        <spring:message code="app.login-reset-password-heading-h2"/>
    </h2>
    <h3 style="font-size: 16px">
        <spring:message code="app.login-reset-password-info-text"/>
    </h3>

    <form id="forgot-password-form" action="<c:url value="/forgot-password"/>" method="post">
        <div style="display: block; font-size: 1.8rem; width: 250px; height: 30px; padding-left: 175px">
            <div>
                <label>
                    <input type="email" id="reset-password-email" name="email" style="text-align: center"
                           placeholder="<spring:message code="app.login-reset-password-email-ph"/>"
                    />
                </label>
            </div>
            <div style="width: 250px" id="not-robot-checkbox-div" class="hidden">
                <label>
                    <input type="checkbox" id="not-robot-checkbox" name="notRobot" class="not-robot-checkbox" value="1">
                    <label for="not-robot-checkbox" class="not-robot-text">
                        <spring:message code="app.login-reset-password-not-a-robot-checkbox"/>
                    </label>
                    <span ></span>
                </label>
            </div>
            <div class="hidden enter-result-container" id="enter-result-div">
                <div class="enter-result-text-div" style="">
                    <spring:message code="app.login-reset-password-result-input-ph"/>
                    <br><br>
                    <span class="number-a"></span>
                    <span class="operation" style="padding-left: 2px"></span>
                    <span class="number-b" style="padding-left: 2px"></span>
                </div>
                <div class="result-input-div">
                    <label>
                        <input class="parameter-a" type="hidden" name="a" value="0">
                        <input class="parameter-b" type="hidden" name="b" value="0">
                        <input class="operator" type="hidden" name="operator" >
                    </label>
                    <label>
                        <input type="number" id="result-input" class="result-input" name="result" placeholder=""/>
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group form-group--buttons" style="margin-top: 200px; margin-bottom: 50px; padding-left: 25px">
            <button class="btn hidden" id="reset-password-btn" type="button" style="margin: 0 auto; margin-top: 20px">
                <spring:message code="app.login-reset-password-btn"/>
            </button>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</section>

<jsp:include page="/WEB-INF/views/jspf/user-footer.jsp"/>
<script src="<c:url value="/resources/js/reset-password.js"/>"></script>
</body>
</html>

