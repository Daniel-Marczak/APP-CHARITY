<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sprinhg" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="pl" style="scroll-behavior: smooth">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title><spring:message code="app.page-title"/></title>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/custom-styles.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/tables.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/add-edit-institution.css"/>"/>

</head>
<body class="custom-scrollbar">
<header class="header">
    <jsp:include page="../jspf/admin-header.jsp"/>
</header>

<c:if test="${requestScope.institutions.size() > 0}">
    <section id="institution-list-section" class="help institution-section-visible" style="margin-bottom: 200px">
        <h1 style="margin-bottom: 60px">
            <spring:message code="app.admin-institution-table-heading-h2"/>
        </h1>
        <c:if test="${param.addInstitution == 'success'}">
            <div style="color: #08b910; font-size: 2rem">
                <spring:message code="app.admin-institution-add-institutions-success-msg"/>
            </div>
        </c:if>
        <c:if test="${param.changeStatus == 'true'}">
            <div style="color: #08b910; font-size: 2rem">
                <spring:message code="app.admin-institution-status-change-active-msg"/>
            </div>
        </c:if>
        <c:if test="${param.changeStatus == 'false'}">
            <div style="color: #08b910; font-size: 2rem">
                <spring:message code="app.admin-institution-status-change-inactive-msg"/>
            </div>
        </c:if>

        <div data-id="1">
            <a href="<c:url value="/institution/add"/>" class="btn btn--without-border btn--highlighted add-institution-btn"
               style="height: 30px; width: 180px; padding: 5px; margin-bottom: 20px">
                <spring:message code="app.admin-institution-edit-add-institution-heading-h2"/>
            </a>

            <table style="min-width: 1000px">
                <thead>
                <tr>
                    <th style="width: 50px"><spring:message code="app.admin-institution-table-th-id"/></th>
                    <th style="width: 200px"><spring:message code="app.admin-institution-table-th-name"/></th>
                    <th style="width: 300px"><spring:message code="app.admin-institution-table-th-description"/></th>
                    <th style="width: 150px"><spring:message code="app.admin-institution-table-th-city"/></th>
                    <th style="width: 200px"><spring:message code="app.admin-institution-table-th-status"/></th>
                </tr>
                </thead>
                <tbody style="text-align: center">
                <c:forEach var="institution" items="${requestScope.institutions}">
                    <tr>
                        <td><c:out value="${institution.id}"/></td>
                        <td><c:out value="${institution.name}"/></td>
                        <td><c:out value="${institution.description}"/></td>
                        <td><c:out value="${institution.city}"/></td>
                        <td style="width: 200px">
                            <c:if test="${institution.enabled == true}">
                                <div class="dropdown">
                                    <button class="btn btn--without-border btn--highlighted status-btn">
                                        <spring:message code="app.admin-institution-status-active"/>
                                    </button>
                                    <div class="dropdown-content status-dropdown-menu btn--highlighted">
                                        <a href="/institution/set-status/${institution.id}/false" class="btn btn--without-border btn--small btn--highlighted">
                                            <spring:message code="app.admin-institution-set-status-inactive"/>
                                        </a>
                                        <a href="/institution/edit/${institution.id}" class="btn btn--without-border btn--small btn--highlighted">
                                            <spring:message code="app.admin-institution-edit-btn"/>
                                        </a>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${institution.enabled == false}">
                                <div class="dropdown">
                                    <button class="btn btn--without-border btn--highlighted status-btn">
                                        <spring:message code="app.admin-institution-status-inactive"/>
                                    </button>
                                    <div class="dropdown-content status-dropdown-menu btn--highlighted">
                                        <a href="/institution/set-status/${institution.id}/true" class="btn btn--without-border btn--small btn--highlighted">
                                            <spring:message code="app.admin-institution-set-status-active"/>
                                        </a>
                                        <a href="/institution/edit/${institution.id}" class="btn btn--without-border btn--small btn--highlighted">
                                            <spring:message code="app.admin-institution-edit-btn"/>
                                        </a>
                                    </div>
                                </div>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>
    </section>
</c:if>


<c:if test="${requestScope.institutions.size() == 0}">
    <section id="help" class="help" style="margin-bottom: 200px">
        <h2 style="margin-bottom: 60px"><spring:message code="app.admin-institution-empty-list-heading-h2"/></h2>
    </section>

    <a href="<c:url value="/institution/add"/>" class="btn btn--without-border btn--highlighted add-institution-btn" style="height: 30px; width: 180px; float: right; margin: 20px auto; padding: 5px">
        <spring:message code="app.admin-institution-edit-add-institution-heading-h2"/>
    </a>

</c:if>

</body>
</html>
