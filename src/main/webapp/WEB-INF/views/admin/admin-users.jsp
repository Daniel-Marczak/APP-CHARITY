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

</head>
<body class="custom-scrollbar">
<header class="header">
    <jsp:include page="../jspf/admin-header.jsp"/>
</header>

<c:if test="${requestScope.allUsers.size() > 0}">
    <section id="admin-users-enabled-true" class="help" style="margin-bottom: 200px">
        <h1 style="margin-bottom: 60px">
            <spring:message code="app.admin-users-enabled-true-heading-h2"/>
        </h1>
        <c:if test="${param.enabled == 'false'}">
            <div style="color: #08b910; font-size: 1.8rem; margin-bottom: 25px">
                <spring:message code="app.admin-users-edit-user-enable-set-false-msg"/>
            </div>
        </c:if>

        <c:if test="${param.enabled == 'true'}">
            <div style="color: #08b910; font-size: 1.8rem; margin-bottom: 25px">
                <spring:message code="app.admin-users-edit-user-enable-set-true-msg"/>
            </div>
        </c:if>

        <c:if test="${param.adminRole == 'true'}">
            <div style="color: #08b910; font-size: 1.8rem; margin-bottom: 25px">
                <spring:message code="app.admin-users-edit-user-add-role-admin-msg"/>
            </div>
        </c:if>

        <!-- SLIDE 1 -->
        <div data-id="1">
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-users-enabled-true-btn">
                <spring:message code="app.admin-users-enabled-true-btm"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-users-enabled-false-btn">
                <spring:message code="app.admin-users-enabled-false-btn"/>
            </button>

            <table style="min-width: 1000px">
                <thead>
                <tr>
                    <th style="width: 50px"><spring:message code="app.admin-users-th-id"/></th>
                    <th style="width: 200px"><spring:message code="app.admin-users-th-name"/></th>
                    <th style="width: 200px"><spring:message code="app.admin-users-th-surname"/></th>
                    <th style="width: 300px"><spring:message code="app.admin-users-th-email"/></th>
                    <th style="width: 200px"><spring:message code="app.admin-users-th-enabled-status"/></th>
                </tr>
                </thead>
                <tbody style="text-align: center">
                <c:forEach var="regUser" items="${requestScope.allUsers}">
                    <c:if test="${regUser.enabled == true}">
                        <tr>
                            <td><c:out value="${regUser.id}"/></td>
                            <td><c:out value="${regUser.name}"/></td>
                            <td><c:out value="${regUser.surname}"/></td>
                            <td><c:out value="${regUser.email}"/></td>
                            <td>
                                <div class="dropdown">
                                    <button class="btn btn--without-border btn--highlighted status-btn">
                                        <spring:message code="app.admin-users-th-enabled-status-true"/>
                                    </button>
                                    <div class="dropdown-content status-dropdown-menu btn--highlighted">
                                        <a href="/admin/users/set-enabled/${regUser.id}" class="btn btn--without-border btn--small btn--highlighted">
                                            <spring:message code="app.admin-users-set-enabled-false-user-btn"/>
                                        </a>
                                        <a href="/admin/user/set-role-admin/${regUser.id}/true" class="btn btn--without-border btn--small btn--highlighted">
                                            <spring:message code="app.admin-users-set-role-admin-btn"/>
                                        </a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </section>
</c:if>

<c:if test="${requestScope.allUsers.size() > 0}">
    <section id="admin-users-enabled-false" class="help hidden" style="margin-bottom: 200px">
        <h1 style="margin-bottom: 60px"><spring:message code="app.admin-users-enabled-false-heading-h2"/></h1>

        <!-- SLIDE 1 -->
        <div data-id="1">
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-users-enabled-true-btn">
                <spring:message code="app.admin-users-enabled-true-btm"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-users-enabled-false-btn">
                <spring:message code="app.admin-users-enabled-false-btn"/>
            </button>

            <table style="min-width: 1000px">
                <thead>
                <tr>
                    <th style="width: 50px"><spring:message code="app.admin-users-th-id"/></th>
                    <th style="width: 200px"><spring:message code="app.admin-users-th-name"/></th>
                    <th style="width: 200px"><spring:message code="app.admin-users-th-surname"/></th>
                    <th style="width: 300px"><spring:message code="app.admin-users-th-email"/></th>
                    <th style="width: 200px"><spring:message code="app.admin-users-th-enabled-status"/></th>
                </tr>
                </thead>
                <tbody style="text-align: center">
                <c:forEach var="regUser" items="${requestScope.allUsers}">
                    <c:if test="${regUser.enabled == false}">
                        <tr>
                            <td><c:out value="${regUser.id}"/></td>
                            <td><c:out value="${regUser.name}"/></td>
                            <td><c:out value="${regUser.surname}"/></td>
                            <td><c:out value="${regUser.email}"/></td>
                            <td>
                                <div class="dropdown">
                                    <button class="btn btn--without-border btn--highlighted status-btn">
                                        <spring:message code="app.admin-users-th-enabled-status-false"/>
                                    </button>
                                    <div class="dropdown-content status-dropdown-menu btn--highlighted">
                                        <a href="/admin/users/set-enabled/${regUser.id}" class="btn btn--without-border btn--small btn--highlighted">
                                            <spring:message code="app.admin-users-set-enabled-true-user-btn"/>
                                        </a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </section>
</c:if>

<script src="<c:url value="/resources/js/admin-users.js"/>"></script>

</body>
</html>
