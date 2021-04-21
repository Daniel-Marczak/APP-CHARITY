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
    <link rel="stylesheet" href="<c:url value="/resources/css/add-edit-institution.css"/>"/>
</head>
<body class="custom-scrollbar">
<header class="header" style="text-align: center">
    <jsp:include page="../jspf/admin-header.jsp"/>

    <div id="edit-institution-section" class="container container--90">
        <h1 style="margin-top: 72px; margin-bottom: 60px"><spring:message code="app.admin-institution-edit-heading-h2"/></h1>

        <form:form modelAttribute="editInstitution">
            <form:hidden path="id"/>
            <form:hidden path="enabled"/>
            <input type="hidden" class="edit-institution-name" name="editInstitutionName" value='${requestScope.editInstitution.name}'>
            <span type="hidden" ></span>
            <div style="display: block; width: 100%; text-align: center">
                <spring:message code="app.admin-institution-edit-name-ph" var="name_ph"/>
                <form:input path="name" type="text" class="institution-name-input" cssStyle="margin-top: 0" placeholder='${name_ph}'/>
                <div class="error-div-institution"><form:errors path="name"/></div>
                <div class="error-div-institution-name hidden" style="margin-top: 10px; margin-bottom: 10px">
                    <spring:message code="validation.error-institution-name"/>
                </div>
                <div class="error-div-institution-name-unavailable hidden" style="margin-top: 10px; margin-bottom: 10px">
                    <spring:message code="validation.error-institution-name-unavailable"/>
                </div>
            </div>
            <div style="display: block; width: 100%; text-align: center">
                <spring:message code="app.admin-institution-edit-city-ph" var="city_ph"/>
                <form:input path="city" type="text" class="institution-city-input" placeholder='${city_ph}'/>
                <div class="error-div-institution"><form:errors path="city"/></div>
                <div class="error-div-institution-city hidden" style="margin-top: 10px; margin-bottom: 10px">
                    <spring:message code="validation.error-institution-city"/>
                </div>
            </div>
            <div style="display: block; width: 100%; text-align: center">
                <spring:message code="app.admin-institution-edit-description-ph" var="description_ph"/>
                <form:input path="description" type="text" class="institution-description-input" placeholder='${description_ph}'/>
                <div class="error-div-institution"><form:errors path="description"/></div>
                <div class="error-div-institution-description hidden" style="margin-top: 10px; margin-bottom: 10px">
                    <spring:message code="validation.error-institution-description"/>
                </div>
                <div class="error-div-institution-description-dot hidden" style="margin-top: 10px; margin-bottom: 10px">
                    <spring:message code="validation.error-institution-description-dot"/>
                </div>
            </div>
            <div class="edit-institution-btn-div">
                <a href="<c:url value="/institution/institutions"/>" style="float: left; width: 160px" class="btn show-institution-list-btn" type="button">
                    <spring:message code="app.admin-institution-edit-institutions-go-back-btn"/>
                </a>
                <button style="float: right" class="btn check-institution-form-btn" type="button">
                    <spring:message code="app.admin-institution-add-check-form-btn"/>
                </button>
                <button style="float: right" class="btn save-institution-btn hidden" type="submit">
                    <spring:message code="app.admin-institution-edit-save-institution-btn"/>
                </button>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form:form>
    </div>
    <c:if test="${param.edit == 'success'}">
        <div style="font-size:2rem; color: #08b910; margin-top: 50px">
            <spring:message code="app.admin-institution-edit-success-msg"/>
        </div>
    </c:if>
</header>

<script src="<c:url value="/resources/js/institution-add-and-edit.js"/>"></script>
</body>
</html>

