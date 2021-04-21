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

<c:if test="${requestScope.contactFormMessages.size() > 0}">
    <section id="unread-contact-form-messages" class="help" style="margin-bottom: 200px">
        <h1 style="margin-bottom: 60px">
            <spring:message code="app.admin-contact-form-messages-unread"/>
        </h1>
        <c:if test="${param.edit == 'successful'}">
            <div style="color: #08b910; font-size: 1.8rem; margin-bottom: 25px">
                <spring:message code="app.admin-donations-edit-success-msg"/>
            </div>
        </c:if>

        <!-- UNREAD -->
        <div data-id="1">
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted admin-messages-unread-btn">
                <spring:message code="app.admin-contact-form-messages-unread"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted admin-messages-read-btn">
                <spring:message code="app.admin-contact-form-messages-read"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted admin-messages-archived-btn">
                <spring:message code="app.admin-contact-form-messages-archived"/>
            </button>

            <table style="min-width: 1000px">
                <thead>
                <tr>
                    <th style="width: 50px"><spring:message code="app.admin-contact-form-messages-th-id"/></th>
                    <th style="width: 100px"><spring:message code="app.admin-contact-form-messages-th-user"/></th>
                    <th style="width: 150px"><spring:message code="app.admin-contact-form-messages-th-name"/></th>
                    <th style="width: 100px"><spring:message code="app.admin-contact-form-messages-th-surname"/></th>
                    <th style="width: 300px"><spring:message code="app.admin-contact-form-messages-th-created"/></th>
                    <th style="width: 300px"><spring:message code="app.admin-contact-form-messages-th-message"/></th>
                    <th style="width: 150px"><spring:message code="app.admin-contact-form-messages-th-status"/></th>
                </tr>
                </thead>
                <tbody style="text-align: center">
                <c:forEach var="message" items="${requestScope.contactFormMessages}">
                    <c:if test="${message.isArchived == false && message.isRead == false}">
                        <tr>
                            <td><c:out value="${message.id}"/></td>
                            <td>
                                <div class="dropdown">
                                    <c:if test="${message.user == null}">
                                        <button style="width: 85px; align-content: center" class="btn btn--without-border btn--highlighted">
                                            <spring:message code="app.admin-contact-form-messages-td-guest-btn"/>
                                        </button>
                                    </c:if>
                                    <c:if test="${message.user != null}">
                                        <button style="width: 85px" class="btn btn--without-border btn--highlighted">
                                            <c:out value="${message.user.id}"/>
                                        </button>
                                        <div class="dropdown-content" style="width: 370px">
                                            <table class="address-dropdown-table btn--highlighted">
                                                <tr>
                                                    <th><spring:message code="app.admin-donations-user-th-name"/></th>
                                                    <td><c:out value="${message.user.name}"/></td>
                                                </tr>
                                                <tr>
                                                    <th><spring:message code="app.admin-donations-user-th-surname"/> </th>
                                                    <td><c:out value="${message.user.surname}"/></td>
                                                </tr>
                                                <tr>
                                                    <th><spring:message code="app.admin-donations-user-th-email"/></th>
                                                    <td><c:out value="${message.user.email}"/></td>
                                                </tr>
                                                <tr>
                                                    <th><spring:message code="app.admin-donations-user-th-enabled"/></th>
                                                    <td>
                                                        <c:if test="${message.user.enabled == true}">
                                                            <spring:message code="app.admin-donations-user-td-enabled-true"/>
                                                        </c:if>
                                                        <c:if test="${message.user.enabled == false}">
                                                            <spring:message code="app.admin-donations-user-td-enabled-false"/>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><spring:message code="app.admin-donations-user-th-roles"/></th>
                                                    <td>
                                                        <c:forEach var="role" items="${message.user.roles}">
                                                            <c:if test="${role.name == 'ROLE_ADMIN' || role.name == 'ROLE_SUPER_ADMIN'}">
                                                                <spring:message code="app.admin-donations-user-td-roles-admin"/>
                                                            </c:if>
                                                            <c:if test="${role.name == 'ROLE_USER'}">
                                                                <spring:message code="app.admin-donations-user-td-roles-user"/>
                                                            </c:if>
                                                        </c:forEach>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </c:if>
                                </div>
                            </td>
                            <td><c:out value="${message.name}"/></td>
                            <td><c:out value="${message.surname}"/></td>
                            <td><c:out value="${message.sent}"/></td>
                            <td>
                                <div class="dropdown">
                                    <button class="btn btn--without-border btn--highlighted status-btn">
                                        <spring:message code="app.admin-contact-form-messages-th-message-content"/>
                                    </button>
                                    <div class="dropdown-content status-dropdown-menu btn--highlighted">
                                        <c:out value="${message.message}"/>
                                    </div>
                                </div>
                            </td>
                            <td style="width: 200px">
                                <div class="dropdown">
                                    <button class="btn btn--without-border btn--highlighted status-btn">
                                        <spring:message code="app.admin-contact-form-messages-status-unread"/>
                                    </button>
                                    <div class="dropdown-content status-dropdown-menu btn--highlighted">
                                        <a href="/admin/contact-form-messages/${message.id}/read" class="btn btn--without-border btn--small btn--highlighted">
                                            <spring:message code="app.admin-contact-form-messages-change-status-to-read"/>
                                        </a>
                                        <a href="/admin/contact-form-messages/${message.id}/archive" class="btn btn--without-border btn--small btn--highlighted">
                                            <spring:message code="app.admin-contact-form-messages-add-to-archived"/>
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

<c:if test="${requestScope.contactFormMessages.size() > 0}">
    <section id="read-contact-form-messages" class="help hidden" style="margin-bottom: 200px">
        <h1 style="margin-bottom: 60px"><spring:message code="app.admin-contact-form-messages-read"/></h1>
        <c:if test="${param.edit == 'successful'}">
            <div style="color: #08b910; font-size: 1.8rem; margin-bottom: 25px">
                <spring:message code="app.admin-donations-edit-success-msg"/>
            </div>
        </c:if>

        <!-- READ -->
        <div data-id="1">
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-messages-unread-btn">
                <spring:message code="app.admin-contact-form-messages-unread"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-messages-read-btn">
                <spring:message code="app.admin-contact-form-messages-read"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-messages-archived-btn">
                <spring:message code="app.admin-contact-form-messages-archived"/>
            </button>

            <table style="min-width: 1000px">
                <thead>
                <tr>
                    <th style="width: 50px"><spring:message code="app.admin-contact-form-messages-th-id"/></th>
                    <th style="width: 100px"><spring:message code="app.admin-contact-form-messages-th-user"/></th>
                    <th style="width: 100px"><spring:message code="app.admin-contact-form-messages-th-name"/></th>
                    <th style="width: 100px"><spring:message code="app.admin-contact-form-messages-th-surname"/></th>
                    <th style="width: 300px"><spring:message code="app.admin-contact-form-messages-th-created"/></th>
                    <th style="width: 300px"><spring:message code="app.admin-contact-form-messages-th-message"/></th>
                    <th style="width: 150px"><spring:message code="app.admin-contact-form-messages-th-status"/></th>
                </tr>
                </thead>
                <tbody style="text-align: center">
                <c:forEach var="message" items="${requestScope.contactFormMessages}">
                    <c:if test="${message.isArchived == false && message.isRead == true}">
                        <tr>
                            <td><c:out value="${message.id}"/></td>
                            <td>
                                <div class="dropdown">
                                    <c:if test="${message.user == null}">
                                        <button style="width: 85px; align-content: center" class="btn btn--without-border btn--highlighted">
                                            <spring:message code="app.admin-contact-form-messages-td-guest-btn"/>
                                        </button>
                                    </c:if>
                                    <c:if test="${message.user != null}">
                                        <button style="width: 85px" class="btn btn--without-border btn--highlighted">
                                            <c:out value="${message.user.id}"/>
                                        </button>
                                        <div class="dropdown-content" style="width: 370px">
                                            <table class="address-dropdown-table btn--highlighted">
                                                <tr>
                                                    <th><spring:message code="app.admin-donations-user-th-name"/></th>
                                                    <td><c:out value="${message.user.name}"/></td>
                                                </tr>
                                                <tr>
                                                    <th><spring:message code="app.admin-donations-user-th-surname"/> </th>
                                                    <td><c:out value="${message.user.surname}"/></td>
                                                </tr>
                                                <tr>
                                                    <th><spring:message code="app.admin-donations-user-th-email"/></th>
                                                    <td><c:out value="${message.user.email}"/></td>
                                                </tr>
                                                <tr>
                                                    <th><spring:message code="app.admin-donations-user-th-enabled"/></th>
                                                    <td>
                                                        <c:if test="${message.user.enabled == true}">
                                                            <spring:message code="app.admin-donations-user-td-enabled-true"/>
                                                        </c:if>
                                                        <c:if test="${message.user.enabled == false}">
                                                            <spring:message code="app.admin-donations-user-td-enabled-false"/>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><spring:message code="app.admin-donations-user-th-roles"/></th>
                                                    <td>
                                                        <c:forEach var="role" items="${message.user.roles}">
                                                            <c:if test="${role.name == 'ROLE_ADMIN' || role.name == 'ROLE_SUPER_ADMIN'}">
                                                                <spring:message code="app.admin-donations-user-td-roles-admin"/>
                                                            </c:if>
                                                            <c:if test="${role.name == 'ROLE_USER'}">
                                                                <spring:message code="app.admin-donations-user-td-roles-user"/>
                                                            </c:if>
                                                        </c:forEach>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </c:if>
                                </div>
                            </td>
                            <td><c:out value="${message.name}"/></td>
                            <td><c:out value="${message.surname}"/></td>
                            <td><c:out value="${message.sent}"/></td>
                            <td>
                                <div class="dropdown">
                                    <button class="btn btn--without-border btn--highlighted status-btn">
                                        <spring:message code="app.admin-contact-form-messages-th-message-content"/>
                                    </button>
                                    <div class="dropdown-content status-dropdown-menu btn--highlighted">
                                        <c:out value="${message.message}"/>
                                    </div>
                                </div>
                            </td>
                            <td style="width: 200px">
                                <div class="dropdown">
                                    <button class="btn btn--without-border btn--highlighted status-btn">
                                        <spring:message code="app.admin-contact-form-messages-status-read"/>
                                    </button>
                                    <div class="dropdown-content status-dropdown-menu btn--highlighted">
                                        <a href="/admin/contact-form-messages/${message.id}/archive" class="btn btn--without-border btn--small btn--highlighted">
                                            <spring:message code="app.admin-contact-form-messages-add-to-archived"/>
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

<c:if test="${requestScope.contactFormMessages.size() > 0}">
    <section id="archived-contact-form-messages" class="help hidden" style="margin-bottom: 200px">
        <h1 style="margin-bottom: 60px"><spring:message code="app.admin-contact-form-messages-archived"/></h1>
        <c:if test="${param.edit == 'successful'}">
            <div style="color: #08b910; font-size: 1.8rem; margin-bottom: 25px">
                <spring:message code="app.admin-donations-edit-success-msg"/>
            </div>
        </c:if>

        <!-- ARCHIVED -->
        <div data-id="1">
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-messages-unread-btn">
                <spring:message code="app.admin-contact-form-messages-unread"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-messages-read-btn">
                <spring:message code="app.admin-contact-form-messages-read"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-messages-archived-btn">
                <spring:message code="app.admin-contact-form-messages-archived"/>
            </button>

            <table style="min-width: 1000px">
                <thead>
                <tr>
                    <th style="width: 50px"><spring:message code="app.admin-contact-form-messages-th-id"/></th>
                    <th style="width: 100px"><spring:message code="app.admin-contact-form-messages-th-user"/></th>
                    <th style="width: 100px"><spring:message code="app.admin-contact-form-messages-th-name"/></th>
                    <th style="width: 100px"><spring:message code="app.admin-contact-form-messages-th-surname"/></th>
                    <th style="width: 300px"><spring:message code="app.admin-contact-form-messages-th-created"/></th>
                    <th style="width: 300px"><spring:message code="app.admin-contact-form-messages-th-message"/></th>
                    <th style="width: 150px"><spring:message code="app.admin-contact-form-messages-th-status"/></th>
                </tr>
                </thead>
                <tbody style="text-align: center">
                <c:forEach var="message" items="${requestScope.contactFormMessages}">
                    <c:if test="${message.isArchived == true}">
                        <tr>
                            <td><c:out value="${message.id}"/></td>
                            <td>
                                <div class="dropdown">
                                    <c:if test="${message.user == null}">
                                        <button style="width: 85px; align-content: center" class="btn btn--without-border btn--highlighted">
                                            <spring:message code="app.admin-contact-form-messages-td-guest-btn"/>
                                        </button>
                                    </c:if>
                                    <c:if test="${message.user != null}">
                                        <button style="width: 85px" class="btn btn--without-border btn--highlighted">
                                            <c:out value="${message.user.id}"/>
                                        </button>
                                        <div class="dropdown-content" style="width: 370px">
                                            <table class="address-dropdown-table btn--highlighted">
                                                <tr>
                                                    <th><spring:message code="app.admin-donations-user-th-name"/></th>
                                                    <td><c:out value="${message.user.name}"/></td>
                                                </tr>
                                                <tr>
                                                    <th><spring:message code="app.admin-donations-user-th-surname"/> </th>
                                                    <td><c:out value="${message.user.surname}"/></td>
                                                </tr>
                                                <tr>
                                                    <th><spring:message code="app.admin-donations-user-th-email"/></th>
                                                    <td><c:out value="${message.user.email}"/></td>
                                                </tr>
                                                <tr>
                                                    <th><spring:message code="app.admin-donations-user-th-enabled"/></th>
                                                    <td>
                                                        <c:if test="${message.user.enabled == true}">
                                                            <spring:message code="app.admin-donations-user-td-enabled-true"/>
                                                        </c:if>
                                                        <c:if test="${message.user.enabled == false}">
                                                            <spring:message code="app.admin-donations-user-td-enabled-false"/>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><spring:message code="app.admin-donations-user-th-roles"/></th>
                                                    <td>
                                                        <c:forEach var="role" items="${message.user.roles}">
                                                            <c:if test="${role.name == 'ROLE_ADMIN' || role.name == 'ROLE_SUPER_ADMIN'}">
                                                                <spring:message code="app.admin-donations-user-td-roles-admin"/>
                                                            </c:if>
                                                            <c:if test="${role.name == 'ROLE_USER'}">
                                                                <spring:message code="app.admin-donations-user-td-roles-user"/>
                                                            </c:if>
                                                        </c:forEach>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </c:if>
                                </div>
                            </td>
                            <td><c:out value="${message.name}"/></td>
                            <td><c:out value="${message.surname}"/></td>
                            <td><c:out value="${message.sent}"/></td>
                            <td>
                                <div class="dropdown">
                                    <button class="btn btn--without-border btn--highlighted status-btn">
                                        <spring:message code="app.admin-contact-form-messages-th-message-content"/>
                                    </button>
                                    <div class="dropdown-content status-dropdown-menu btn--highlighted">
                                        <c:out value="${message.message}"/>
                                    </div>
                                </div>
                            </td>
                            <td style="width: 200px">
                                <div class="dropdown">
                                    <button class="btn btn--without-border btn--highlighted status-btn">
                                        <spring:message code="app.admin-contact-form-messages-status-archived"/>
                                    </button>
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

<script src="<c:url value="/resources/js/admin-contact-form-messages.js"/>"></script>

</body>
</html>
