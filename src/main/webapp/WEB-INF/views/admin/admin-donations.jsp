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

<c:if test="${requestScope.allDonations.size() > 0}">
    <section id="awaiting-pickup-donations" class="help" style="margin-bottom: 200px">
        <h1 style="margin-bottom: 60px">
            <spring:message code="app.admin-donations-awaiting-pickup-heading-h2"/>
        </h1>
        <c:if test="${param.edit == 'successful'}">
            <div style="color: #08b910; font-size: 1.8rem; margin-bottom: 25px">
                <spring:message code="app.admin-donations-edit-success-msg"/>
            </div>
        </c:if>
        <c:if test="${param.updateStatus == 2}">
            <div style="color: #08b910; font-size: 1.8rem; margin-bottom: 25px">
                <spring:message code="app.user-main-status-updated-to-collected-message"/>
            </div>
        </c:if>
        <c:if test="${param.updateStatus == 3}">
            <div style="color: #08b910; font-size: 1.8rem; margin-bottom: 25px">
                <spring:message code="app.user-main-status-updated-to-cancelled-message"/>
            </div>
        </c:if>
        <c:if test="${param.updateStatus == 4}">
            <div style="color: #08b910; font-size: 1.8rem; margin-bottom: 25px">
                <spring:message code="app.user-main-status-updated-to-archived-message"/>
            </div>
        </c:if>

        <!-- SLIDE 1 -->
        <div data-id="1">
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
               class="btn btn--without-border btn--highlighted add-institution-btn admin-donations-awaiting-pickup-btn">
                <spring:message code="app.admin-donations-awaiting-pickup-btn"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
               class="btn btn--without-border btn--highlighted add-institution-btn admin-donations-collected-btn">
                <spring:message code="app.admin-donations-collected-btn"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
               class="btn btn--without-border btn--highlighted add-institution-btn admin-donations-cancelled-btn">
                <spring:message code="app.admin-donations-cancelled-btn"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
               class="btn btn--without-border btn--highlighted add-institution-btn admin-donations-non-archived-btn">
                <spring:message code="app.admin-donations-non-archived-btn"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px"
               class="btn btn--without-border btn--highlighted add-institution-btn admin-donations-archived-btn">
                <spring:message code="app.admin-donations-archived-btn"/>
            </button>

            <table style="min-width: 1000px">
                <thead>
                <tr>
                    <th style="width: 50px"><spring:message code="app.user-main-th-donation-id"/></th>
                    <th style="width: 100px"><spring:message code="app.user-main-th-donation-created"/></th>
                    <th style="width: 100px"><spring:message code="app.user-main-th-donation-user-id"/></th>
                    <th style="width: 300px"><spring:message code="app.user-main-th-donation-beneficiary"/></th>
                    <th style="width: 150px"><spring:message code="app.user-main-th-donation-bags"/></th>
                    <th style="width: 150px"><spring:message code="app.user-main-th-donation-categories"/></th>
                    <th style="width: 160px"><spring:message code="app.user-main-th-donation-pickup-address"/></th>
                    <th style="width: 200px"><spring:message code="app.user-main-th-donation-status"/></th>
                </tr>
                </thead>
                <tbody style="text-align: center">
                <c:forEach var="donation" items="${requestScope.allDonations}">
                    <c:if test="${donation.archived == false && donation.status.id == 1}">
                        <tr>
                            <td><c:out value="${donation.id}"/></td>
                            <td><c:out value="${donation.created}"/></td>
                            <td>
                                <div class="dropdown">
                                    <button class="btn btn--without-border btn--highlighted"><c:out value="${donation.user.id}"/></button>
                                    <div class="dropdown-content" style="width: 370px">
                                        <table class="address-dropdown-table btn--highlighted">
                                            <tr>
                                                <th><spring:message code="app.admin-donations-user-th-name"/></th>
                                                <td><c:out value="${donation.user.name}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.admin-donations-user-th-surname"/> </th>
                                                <td><c:out value="${donation.user.surname}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.admin-donations-user-th-email"/></th>
                                                <td><c:out value="${donation.user.email}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.admin-donations-user-th-enabled"/></th>
                                                <td>
                                                    <c:if test="${donation.user.enabled == true}">
                                                        <spring:message code="app.admin-donations-user-td-enabled-true"/>
                                                    </c:if>
                                                    <c:if test="${donation.user.enabled == false}">
                                                        <spring:message code="app.admin-donations-user-td-enabled-false"/>
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.admin-donations-user-th-roles"/></th>
                                                <td>
                                                    <c:forEach var="role" items="${donation.user.roles}">
                                                        <c:if test="${role.name == 'ROLE_ADMIN'}">
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
                                </div>
                            </td>
                            <td style="width: 300px"><c:out value="${donation.institution.name}"/></td>
                            <td><c:out value="${donation.quantity}"/></td>
                            <td style="width: 150px">
                                <div class="dropdown">
                                    <button class="btn btn--without-border btn--highlighted"><spring:message code="app.user-main-td-donation-categories-li-dropdown"/></button>
                                    <div class="dropdown-content btn--highlighted" style="min-width: max-content; padding-right: 20px;">
                                        <ol type="1">
                                            <c:forEach var="category" items="${donation.categories}">
                                                <li style="text-align: left"><c:out value="${category.name}"/></li>
                                            </c:forEach>
                                        </ol>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="dropdown">
                                    <button class="btn btn--without-border btn--highlighted"><spring:message code="app.user-main-td-donation-pickup-address-details-dropdown"/></button>
                                    <div class="dropdown-content" style="width: 370px">
                                        <table class="address-dropdown-table btn--highlighted">
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-street"/></th>
                                                <td><c:out value="${donation.street}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-city"/></th>
                                                <td><c:out value="${donation.city}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-zip-code"/></th>
                                                <td><c:out value="${donation.zipCode}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-pickup-date"/></th>
                                                <td><c:out value="${donation.pickUpDate}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-pickup-time"/></th>
                                                <td><c:out value="${donation.pickUpTime}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-user-phone"/></th>
                                                <td><c:out value="${donation.phone}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-notes"/></th>
                                                <td><c:out value="${donation.pickUpComment}"/></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </td>
                            <td style="width: 200px">
                                <c:if test="${donation.status.id == 1}">
                                    <div class="dropdown">
                                        <button class="btn btn--without-border btn--highlighted status-btn">
                                            <spring:message code="app.user-main-td-donation-status-awaiting-pickup"/>
                                        </button>
                                        <div class="dropdown-content status-dropdown-menu btn--highlighted">
                                            <a href="/donation/update-status/${sessionScope.user.id}/${donation.id}/2?admin=121101115" class="btn btn--without-border btn--small btn--highlighted">
                                                <spring:message code="app.user-main-change-donation-status-to-collected"/>
                                            </a>
                                            <a href="/donation/update-status/${sessionScope.user.id}/${donation.id}/3?admin=121101115" class="btn btn--without-border btn--small btn--highlighted">
                                                <spring:message code="app.user-main-change-donation-status-to-canceled"/>
                                            </a>
                                            <a href="/donation/edit/${sessionScope.user.id}/${donation.id}?admin=121101115" class="btn btn--without-border btn--small btn--highlighted">
                                                <spring:message code="app.user-main-edit-donation"/>
                                            </a>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${donation.status.id == 2}">
                                    <div class="dropdown">
                                        <button class="btn btn--without-border btn--highlighted status-btn">
                                            <spring:message code="app.user-main-donation-status-collected"/>
                                        </button>
                                        <div class="dropdown-content status-dropdown-menu btn--highlighted">
                                            <div style="padding-top: 15px; padding-bottom: 15px">
                                                <spring:message code="app.user-main-donation-status-collected-date"/>&nbsp;
                                                <c:out value="${donation.collected}"/>
                                            </div>
                                            <a href="/donation/archive/${sessionScope.user.id}/${donation.id}?admin=121101115" class="btn btn--without-border btn--small btn--highlighted">
                                                <spring:message code="app.user-main-archive-donation"/>
                                            </a>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${donation.status.id == 3}">
                                    <div class="dropdown">
                                        <button class="btn btn--without-border btn--highlighted status-btn">
                                            <spring:message code="app.user-main-donation-status-canceled"/>
                                        </button>
                                        <div class="dropdown-content status-dropdown-menu btn--highlighted">
                                            <div style="padding-top: 15px; padding-bottom: 15px">
                                                <spring:message code="app.user-main-donation-status-cancelled-date"/>&nbsp;
                                                <c:out value="${donation.cancelled}"/>
                                            </div>
                                            <a href="/donation/archive/${sessionScope.user.id}/${donation.id}?admin=121101115" class="btn btn--without-border btn--small btn--highlighted">
                                                <spring:message code="app.user-main-archive-donation"/>
                                            </a>
                                        </div>
                                    </div>
                                </c:if>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>

        </div>
    </section>
</c:if>

<c:if test="${requestScope.allDonations.size() > 0}">
    <section id="collected-donations" class="help hidden" style="margin-bottom: 200px">
        <h1 style="margin-bottom: 60px"><spring:message code="app.admin-donations-collected-heading-h2"/></h1>

        <!-- SLIDE 1 -->
        <div data-id="1">
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-donations-awaiting-pickup-btn">
                <spring:message code="app.admin-donations-awaiting-pickup-btn"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-donations-collected-btn">
                <spring:message code="app.admin-donations-collected-btn"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-donations-cancelled-btn">
                <spring:message code="app.admin-donations-cancelled-btn"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-donations-non-archived-btn">
                <spring:message code="app.admin-donations-non-archived-btn"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-donations-archived-btn">
                <spring:message code="app.admin-donations-archived-btn"/>
            </button>

            <table style="min-width: 1000px">
                <thead>
                <tr>
                    <th style="width: 50px"><spring:message code="app.user-main-th-donation-id"/></th>
                    <th style="width: 100px"><spring:message code="app.user-main-th-donation-created"/></th>
                    <th style="width: 100px"><spring:message code="app.user-main-th-donation-user-id"/></th>
                    <th style="width: 300px"><spring:message code="app.user-main-th-donation-beneficiary"/></th>
                    <th style="width: 150px"><spring:message code="app.user-main-th-donation-bags"/></th>
                    <th style="width: 150px"><spring:message code="app.user-main-th-donation-categories"/></th>
                    <th style="width: 160px"><spring:message code="app.user-main-th-donation-pickup-address"/></th>
                    <th style="width: 200px"><spring:message code="app.user-main-th-donation-status"/></th>
                </tr>
                </thead>
                <tbody style="text-align: center">
                <c:forEach var="donation" items="${requestScope.allDonations}">
                    <c:if test="${donation.archived == false && donation.status.id == 2}">
                        <tr>
                            <td><c:out value="${donation.id}"/></td>
                            <td><c:out value="${donation.created}"/></td>
                            <td>
                                <div class="dropdown">
                                    <button class="btn btn--without-border btn--highlighted"><c:out value="${donation.user.id}"/></button>
                                    <div class="dropdown-content" style="width: 370px">
                                        <table class="address-dropdown-table btn--highlighted">
                                            <tr>
                                                <th><spring:message code="app.admin-donations-user-th-name"/></th>
                                                <td><c:out value="${donation.user.name}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.admin-donations-user-th-surname"/> </th>
                                                <td><c:out value="${donation.user.surname}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.admin-donations-user-th-email"/></th>
                                                <td><c:out value="${donation.user.email}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.admin-donations-user-th-enabled"/></th>
                                                <td>
                                                    <c:if test="${donation.user.enabled == true}">
                                                        <spring:message code="app.admin-donations-user-td-enabled-true"/>
                                                    </c:if>
                                                    <c:if test="${donation.user.enabled == false}">
                                                        <spring:message code="app.admin-donations-user-td-enabled-false"/>
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.admin-donations-user-th-roles"/></th>
                                                <td>
                                                    <c:forEach var="role" items="${donation.user.roles}">
                                                        <c:if test="${role.name == 'ROLE_ADMIN'}">
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
                                </div>
                            </td>
                            <td style="width: 300px"><c:out value="${donation.institution.name}"/></td>
                            <td><c:out value="${donation.quantity}"/></td>
                            <td style="width: 150px">
                                <div class="dropdown">
                                    <button class="btn btn--without-border btn--highlighted"><spring:message code="app.user-main-td-donation-categories-li-dropdown"/></button>
                                    <div class="dropdown-content btn--highlighted" style="min-width: max-content; padding-right: 20px;">
                                        <ol type="1">
                                            <c:forEach var="category" items="${donation.categories}">
                                                <li style="text-align: left"><c:out value="${category.name}"/></li>
                                            </c:forEach>
                                        </ol>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="dropdown">
                                    <button class="btn btn--without-border btn--highlighted"><spring:message code="app.user-main-td-donation-pickup-address-details-dropdown"/></button>
                                    <div class="dropdown-content" style="width: 370px">
                                        <table class="address-dropdown-table btn--highlighted">
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-street"/></th>
                                                <td><c:out value="${donation.street}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-city"/></th>
                                                <td><c:out value="${donation.city}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-zip-code"/></th>
                                                <td><c:out value="${donation.zipCode}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-pickup-date"/></th>
                                                <td><c:out value="${donation.pickUpDate}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-pickup-time"/></th>
                                                <td><c:out value="${donation.pickUpTime}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-user-phone"/></th>
                                                <td><c:out value="${donation.phone}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-notes"/></th>
                                                <td><c:out value="${donation.pickUpComment}"/></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </td>
                            <td style="width: 200px">
                                <c:if test="${donation.status.id == 1}">
                                    <div class="dropdown">
                                        <button class="btn btn--without-border btn--highlighted status-btn">
                                            <spring:message code="app.user-main-td-donation-status-awaiting-pickup"/>
                                        </button>
                                        <div class="dropdown-content status-dropdown-menu btn--highlighted">
                                            <a href="/donation/update-status/${sessionScope.user.id}/${donation.id}/2" class="btn btn--without-border btn--small btn--highlighted">
                                                <spring:message code="app.user-main-change-donation-status-to-collected"/>
                                            </a>
                                            <a href="/donation/update-status/${sessionScope.user.id}/${donation.id}/3" class="btn btn--without-border btn--small btn--highlighted">
                                                <spring:message code="app.user-main-change-donation-status-to-canceled"/>
                                            </a>
                                            <a href="/donation/edit/${sessionScope.user.id}/${donation.id}" class="btn btn--without-border btn--small btn--highlighted">
                                                <spring:message code="app.user-main-edit-donation"/>
                                            </a>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${donation.status.id == 2}">
                                    <div class="dropdown">
                                        <button class="btn btn--without-border btn--highlighted status-btn">
                                            <spring:message code="app.user-main-donation-status-collected"/>
                                        </button>
                                        <div class="dropdown-content status-dropdown-menu btn--highlighted">
                                            <div style="padding-top: 15px; padding-bottom: 15px">
                                                <spring:message code="app.user-main-donation-status-collected-date"/>&nbsp;
                                                <c:out value="${donation.collected}"/>
                                            </div>
                                            <a href="/donation/archive/${sessionScope.user.id}/${donation.id}?admin=121101115" class="btn btn--without-border btn--small btn--highlighted">
                                                <spring:message code="app.user-main-archive-donation"/>
                                            </a>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${donation.status.id == 3}">
                                    <div class="dropdown">
                                        <button class="btn btn--without-border btn--highlighted status-btn">
                                            <spring:message code="app.user-main-donation-status-canceled"/>
                                        </button>
                                        <div class="dropdown-content status-dropdown-menu btn--highlighted">
                                            <div style="padding-top: 15px; padding-bottom: 15px">
                                                <spring:message code="app.user-main-donation-status-cancelled-date"/>&nbsp;
                                                <c:out value="${donation.cancelled}"/>
                                            </div>
                                            <a href="/donation/archive/${sessionScope.user.id}/${donation.id}?admin=121101115" class="btn btn--without-border btn--small btn--highlighted">
                                                <spring:message code="app.user-main-archive-donation"/>
                                            </a>
                                        </div>
                                    </div>
                                </c:if>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>

        </div>
    </section>
</c:if>

<c:if test="${requestScope.allDonations.size() > 0}">
    <section id="cancelled-donations" class="help hidden" style="margin-bottom: 200px">
        <h1 style="margin-bottom: 60px"><spring:message code="app.admin-donations-cancelled-heading-h2"/></h1>

        <!-- SLIDE 1 -->
        <div data-id="1">
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-donations-awaiting-pickup-btn">
                <spring:message code="app.admin-donations-awaiting-pickup-btn"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-donations-collected-btn">
                <spring:message code="app.admin-donations-collected-btn"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-donations-cancelled-btn">
                <spring:message code="app.admin-donations-cancelled-btn"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-donations-non-archived-btn">
                <spring:message code="app.admin-donations-non-archived-btn"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-donations-archived-btn">
                <spring:message code="app.admin-donations-archived-btn"/>
            </button>

            <table style="min-width: 1000px">
                <thead>
                <tr>
                    <th style="width: 50px"><spring:message code="app.user-main-th-donation-id"/></th>
                    <th style="width: 100px"><spring:message code="app.user-main-th-donation-created"/></th>
                    <th style="width: 100px"><spring:message code="app.user-main-th-donation-user-id"/></th>
                    <th style="width: 300px"><spring:message code="app.user-main-th-donation-beneficiary"/></th>
                    <th style="width: 150px"><spring:message code="app.user-main-th-donation-bags"/></th>
                    <th style="width: 150px"><spring:message code="app.user-main-th-donation-categories"/></th>
                    <th style="width: 160px"><spring:message code="app.user-main-th-donation-pickup-address"/></th>
                    <th style="width: 200px"><spring:message code="app.user-main-th-donation-status"/></th>
                </tr>
                </thead>
                <tbody style="text-align: center">
                <c:forEach var="donation" items="${requestScope.allDonations}">
                    <c:if test="${donation.archived == false && donation.status.id == 3}">
                        <tr>
                            <td><c:out value="${donation.id}"/></td>
                            <td><c:out value="${donation.created}"/></td>
                            <td>
                                <div class="dropdown">
                                    <button class="btn btn--without-border btn--highlighted"><c:out value="${donation.user.id}"/></button>
                                    <div class="dropdown-content" style="width: 370px">
                                        <table class="address-dropdown-table btn--highlighted">
                                            <tr>
                                                <th><spring:message code="app.admin-donations-user-th-name"/></th>
                                                <td><c:out value="${donation.user.name}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.admin-donations-user-th-surname"/> </th>
                                                <td><c:out value="${donation.user.surname}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.admin-donations-user-th-email"/></th>
                                                <td><c:out value="${donation.user.email}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.admin-donations-user-th-enabled"/></th>
                                                <td>
                                                    <c:if test="${donation.user.enabled == true}">
                                                        <spring:message code="app.admin-donations-user-td-enabled-true"/>
                                                    </c:if>
                                                    <c:if test="${donation.user.enabled == false}">
                                                        <spring:message code="app.admin-donations-user-td-enabled-false"/>
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.admin-donations-user-th-roles"/></th>
                                                <td>
                                                    <c:forEach var="role" items="${donation.user.roles}">
                                                        <c:if test="${role.name == 'ROLE_ADMIN'}">
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
                                </div>
                            </td>
                            <td style="width: 300px"><c:out value="${donation.institution.name}"/></td>
                            <td><c:out value="${donation.quantity}"/></td>
                            <td style="width: 150px">
                                <div class="dropdown">
                                    <button class="btn btn--without-border btn--highlighted"><spring:message code="app.user-main-td-donation-categories-li-dropdown"/></button>
                                    <div class="dropdown-content btn--highlighted" style="min-width: max-content; padding-right: 20px;">
                                        <ol type="1">
                                            <c:forEach var="category" items="${donation.categories}">
                                                <li style="text-align: left"><c:out value="${category.name}"/></li>
                                            </c:forEach>
                                        </ol>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="dropdown">
                                    <button class="btn btn--without-border btn--highlighted"><spring:message code="app.user-main-td-donation-pickup-address-details-dropdown"/></button>
                                    <div class="dropdown-content" style="width: 370px">
                                        <table class="address-dropdown-table btn--highlighted">
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-street"/></th>
                                                <td><c:out value="${donation.street}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-city"/></th>
                                                <td><c:out value="${donation.city}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-zip-code"/></th>
                                                <td><c:out value="${donation.zipCode}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-pickup-date"/></th>
                                                <td><c:out value="${donation.pickUpDate}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-pickup-time"/></th>
                                                <td><c:out value="${donation.pickUpTime}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-user-phone"/></th>
                                                <td><c:out value="${donation.phone}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-notes"/></th>
                                                <td><c:out value="${donation.pickUpComment}"/></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </td>
                            <td style="width: 200px">
                                <c:if test="${donation.status.id == 1}">
                                    <div class="dropdown">
                                        <button class="btn btn--without-border btn--highlighted status-btn">
                                            <spring:message code="app.user-main-td-donation-status-awaiting-pickup"/>
                                        </button>
                                        <div class="dropdown-content status-dropdown-menu btn--highlighted">
                                            <a href="/donation/update-status/${sessionScope.user.id}/${donation.id}/2" class="btn btn--without-border btn--small btn--highlighted">
                                                <spring:message code="app.user-main-change-donation-status-to-collected"/>
                                            </a>
                                            <a href="/donation/update-status/${sessionScope.user.id}/${donation.id}/3" class="btn btn--without-border btn--small btn--highlighted">
                                                <spring:message code="app.user-main-change-donation-status-to-canceled"/>
                                            </a>
                                            <a href="/donation/edit/${sessionScope.user.id}/${donation.id}" class="btn btn--without-border btn--small btn--highlighted">
                                                <spring:message code="app.user-main-edit-donation"/>
                                            </a>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${donation.status.id == 2}">
                                    <div class="dropdown">
                                        <button class="btn btn--without-border btn--highlighted status-btn">
                                            <spring:message code="app.user-main-donation-status-collected"/>
                                        </button>
                                        <div class="dropdown-content status-dropdown-menu btn--highlighted">
                                            <div style="padding-top: 15px; padding-bottom: 15px">
                                                <spring:message code="app.user-main-donation-status-collected-date"/>&nbsp;
                                                <c:out value="${donation.collected}"/>
                                            </div>
                                            <a href="/donation/archive/${sessionScope.user.id}/${donation.id}?admin=121101115" class="btn btn--without-border btn--small btn--highlighted">
                                                <spring:message code="app.user-main-archive-donation"/>
                                            </a>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${donation.status.id == 3}">
                                    <div class="dropdown">
                                        <button class="btn btn--without-border btn--highlighted status-btn">
                                            <spring:message code="app.user-main-donation-status-canceled"/>
                                        </button>
                                        <div class="dropdown-content status-dropdown-menu btn--highlighted">
                                            <div style="padding-top: 15px; padding-bottom: 15px">
                                                <spring:message code="app.user-main-donation-status-cancelled-date"/>&nbsp;
                                                <c:out value="${donation.cancelled}"/>
                                            </div>
                                            <a href="/donation/archive/${sessionScope.user.id}/${donation.id}?admin=121101115" class="btn btn--without-border btn--small btn--highlighted">
                                                <spring:message code="app.user-main-archive-donation"/>
                                            </a>
                                        </div>
                                    </div>
                                </c:if>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>

        </div>
    </section>
</c:if>

<c:if test="${requestScope.allDonations.size() > 0}">
    <section id="non-archived-donations" class="help hidden" style="margin-bottom: 200px">
        <h1 style="margin-bottom: 60px"><spring:message code="app.admin-donations-non-archived-heading-h2"/></h1>

        <!-- SLIDE 1 -->
        <div data-id="1">
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-donations-awaiting-pickup-btn">
                <spring:message code="app.admin-donations-awaiting-pickup-btn"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-donations-collected-btn">
                <spring:message code="app.admin-donations-collected-btn"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-donations-cancelled-btn">
                <spring:message code="app.admin-donations-cancelled-btn"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-donations-non-archived-btn">
                <spring:message code="app.admin-donations-non-archived-btn"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-donations-archived-btn">
                <spring:message code="app.admin-donations-archived-btn"/>
            </button>

            <table style="min-width: 1000px">
                <thead>
                <tr>
                    <th style="width: 50px"><spring:message code="app.user-main-th-donation-id"/></th>
                    <th style="width: 100px"><spring:message code="app.user-main-th-donation-created"/></th>
                    <th style="width: 100px"><spring:message code="app.user-main-th-donation-user-id"/></th>
                    <th style="width: 300px"><spring:message code="app.user-main-th-donation-beneficiary"/></th>
                    <th style="width: 150px"><spring:message code="app.user-main-th-donation-bags"/></th>
                    <th style="width: 150px"><spring:message code="app.user-main-th-donation-categories"/></th>
                    <th style="width: 160px"><spring:message code="app.user-main-th-donation-pickup-address"/></th>
                    <th style="width: 200px"><spring:message code="app.user-main-th-donation-status"/></th>
                </tr>
                </thead>
                <tbody style="text-align: center">
                <c:forEach var="donation" items="${requestScope.allDonations}">
                    <c:if test="${donation.archived == false && donation.status.id != 1}">
                        <tr>
                            <td><c:out value="${donation.id}"/></td>
                            <td><c:out value="${donation.created}"/></td>
                            <td>
                                <div class="dropdown">
                                    <button class="btn btn--without-border btn--highlighted"><c:out value="${donation.user.id}"/></button>
                                    <div class="dropdown-content" style="width: 370px">
                                        <table class="address-dropdown-table btn--highlighted">
                                            <tr>
                                                <th><spring:message code="app.admin-donations-user-th-name"/></th>
                                                <td><c:out value="${donation.user.name}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.admin-donations-user-th-surname"/> </th>
                                                <td><c:out value="${donation.user.surname}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.admin-donations-user-th-email"/></th>
                                                <td><c:out value="${donation.user.email}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.admin-donations-user-th-enabled"/></th>
                                                <td>
                                                    <c:if test="${donation.user.enabled == true}">
                                                        <spring:message code="app.admin-donations-user-td-enabled-true"/>
                                                    </c:if>
                                                    <c:if test="${donation.user.enabled == false}">
                                                        <spring:message code="app.admin-donations-user-td-enabled-false"/>
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.admin-donations-user-th-roles"/></th>
                                                <td>
                                                    <c:forEach var="role" items="${donation.user.roles}">
                                                        <c:if test="${role.name == 'ROLE_ADMIN'}">
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
                                </div>
                            </td>
                            <td style="width: 300px"><c:out value="${donation.institution.name}"/></td>
                            <td><c:out value="${donation.quantity}"/></td>
                            <td style="width: 150px">
                                <div class="dropdown">
                                    <button class="btn btn--without-border btn--highlighted"><spring:message code="app.user-main-td-donation-categories-li-dropdown"/></button>
                                    <div class="dropdown-content btn--highlighted" style="min-width: max-content; padding-right: 20px;">
                                        <ol type="1">
                                            <c:forEach var="category" items="${donation.categories}">
                                                <li style="text-align: left"><c:out value="${category.name}"/></li>
                                            </c:forEach>
                                        </ol>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="dropdown">
                                    <button class="btn btn--without-border btn--highlighted"><spring:message code="app.user-main-td-donation-pickup-address-details-dropdown"/></button>
                                    <div class="dropdown-content" style="width: 370px">
                                        <table class="address-dropdown-table btn--highlighted">
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-street"/></th>
                                                <td><c:out value="${donation.street}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-city"/></th>
                                                <td><c:out value="${donation.city}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-zip-code"/></th>
                                                <td><c:out value="${donation.zipCode}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-pickup-date"/></th>
                                                <td><c:out value="${donation.pickUpDate}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-pickup-time"/></th>
                                                <td><c:out value="${donation.pickUpTime}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-user-phone"/></th>
                                                <td><c:out value="${donation.phone}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-notes"/></th>
                                                <td><c:out value="${donation.pickUpComment}"/></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </td>
                            <td style="width: 200px">
                                <c:if test="${donation.status.id == 1}">
                                    <div class="dropdown">
                                        <button class="btn btn--without-border btn--highlighted status-btn">
                                            <spring:message code="app.user-main-td-donation-status-awaiting-pickup"/>
                                        </button>
                                        <div class="dropdown-content status-dropdown-menu btn--highlighted">
                                            <a href="/donation/update-status/${sessionScope.user.id}/${donation.id}/2" class="btn btn--without-border btn--small btn--highlighted">
                                                <spring:message code="app.user-main-change-donation-status-to-collected"/>
                                            </a>
                                            <a href="/donation/update-status/${sessionScope.user.id}/${donation.id}/3" class="btn btn--without-border btn--small btn--highlighted">
                                                <spring:message code="app.user-main-change-donation-status-to-canceled"/>
                                            </a>
                                            <a href="/donation/edit/${sessionScope.user.id}/${donation.id}" class="btn btn--without-border btn--small btn--highlighted">
                                                <spring:message code="app.user-main-edit-donation"/>
                                            </a>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${donation.status.id == 2}">
                                    <div class="dropdown">
                                        <button class="btn btn--without-border btn--highlighted status-btn">
                                            <spring:message code="app.user-main-donation-status-collected"/>
                                        </button>
                                        <div class="dropdown-content status-dropdown-menu btn--highlighted">
                                            <div style="padding-top: 15px; padding-bottom: 15px">
                                                <spring:message code="app.user-main-donation-status-collected-date"/>&nbsp;
                                                <c:out value="${donation.collected}"/>
                                            </div>
                                            <a href="/donation/archive/${sessionScope.user.id}/${donation.id}?admin=121101115" class="btn btn--without-border btn--small btn--highlighted">
                                                <spring:message code="app.user-main-archive-donation"/>
                                            </a>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${donation.status.id == 3}">
                                    <div class="dropdown">
                                        <button class="btn btn--without-border btn--highlighted status-btn">
                                            <spring:message code="app.user-main-donation-status-canceled"/>
                                        </button>
                                        <div class="dropdown-content status-dropdown-menu btn--highlighted">
                                            <div style="padding-top: 15px; padding-bottom: 15px">
                                                <spring:message code="app.user-main-donation-status-cancelled-date"/>&nbsp;
                                                <c:out value="${donation.cancelled}"/>
                                            </div>
                                            <a href="/donation/archive/${sessionScope.user.id}/${donation.id}?admin=121101115" class="btn btn--without-border btn--small btn--highlighted">
                                                <spring:message code="app.user-main-archive-donation"/>
                                            </a>
                                        </div>
                                    </div>
                                </c:if>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>

        </div>
    </section>
</c:if>

<c:if test="${requestScope.allDonations.size() > 0}">
    <section id="archived-donations" class="help hidden" style="margin-bottom: 200px">
        <h1 style="margin-bottom: 60px"><spring:message code="app.admin-donations-archived-heading-h2"/></h1>

        <!-- SLIDE 1 -->
        <div data-id="1">
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-donations-awaiting-pickup-btn">
                <spring:message code="app.admin-donations-awaiting-pickup-btn"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-donations-collected-btn">
                <spring:message code="app.admin-donations-collected-btn"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-donations-cancelled-btn">
                <spring:message code="app.admin-donations-cancelled-btn"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px; margin-right: 22px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-donations-non-archived-btn">
                <spring:message code="app.admin-donations-non-archived-btn"/>
            </button>
            <button style="height: 30px; width: 180px; margin-bottom: 20px; padding: 5px"
                    class="btn btn--without-border btn--highlighted add-institution-btn admin-donations-archived-btn">
                <spring:message code="app.admin-donations-archived-btn"/>
            </button>

            <table style="min-width: 1000px">
                <thead>
                <tr>
                    <th style="width: 50px"><spring:message code="app.user-main-th-donation-id"/></th>
                    <th style="width: 100px"><spring:message code="app.user-main-th-donation-created"/></th>
                    <th style="width: 100px"><spring:message code="app.user-main-th-donation-user-id"/></th>
                    <th style="width: 300px"><spring:message code="app.user-main-th-donation-beneficiary"/></th>
                    <th style="width: 150px"><spring:message code="app.user-main-th-donation-bags"/></th>
                    <th style="width: 150px"><spring:message code="app.user-main-th-donation-categories"/></th>
                    <th style="width: 160px"><spring:message code="app.user-main-th-donation-pickup-address"/></th>
                    <th style="width: 200px"><spring:message code="app.user-main-th-donation-status"/></th>
                </tr>
                </thead>
                <tbody style="text-align: center">
                <c:forEach var="donation" items="${requestScope.allDonations}">
                    <c:if test="${donation.archived == true}">
                        <tr>
                            <td><c:out value="${donation.id}"/></td>
                            <td><c:out value="${donation.created}"/></td>
                            <td>
                                <div class="dropdown">
                                    <button class="btn btn--without-border btn--highlighted"><c:out value="${donation.user.id}"/></button>
                                    <div class="dropdown-content" style="width: 370px">
                                        <table class="address-dropdown-table btn--highlighted">
                                            <tr>
                                                <th><spring:message code="app.admin-donations-user-th-name"/></th>
                                                <td><c:out value="${donation.user.name}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.admin-donations-user-th-surname"/> </th>
                                                <td><c:out value="${donation.user.surname}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.admin-donations-user-th-email"/></th>
                                                <td><c:out value="${donation.user.email}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.admin-donations-user-th-enabled"/></th>
                                                <td>
                                                    <c:if test="${donation.user.enabled == true}">
                                                        <spring:message code="app.admin-donations-user-td-enabled-true"/>
                                                    </c:if>
                                                    <c:if test="${donation.user.enabled == false}">
                                                        <spring:message code="app.admin-donations-user-td-enabled-false"/>
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.admin-donations-user-th-roles"/></th>
                                                <td>
                                                    <c:forEach var="role" items="${donation.user.roles}">
                                                        <c:if test="${role.name == 'ROLE_ADMIN'}">
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
                                </div>
                            </td>
                            <td style="width: 300px"><c:out value="${donation.institution.name}"/></td>
                            <td><c:out value="${donation.quantity}"/></td>
                            <td style="width: 150px">
                                <div class="dropdown">
                                    <button class="btn btn--without-border btn--highlighted"><spring:message code="app.user-main-td-donation-categories-li-dropdown"/></button>
                                    <div class="dropdown-content btn--highlighted" style="min-width: max-content; padding-right: 20px;">
                                        <ol type="1">
                                            <c:forEach var="category" items="${donation.categories}">
                                                <li style="text-align: left"><c:out value="${category.name}"/></li>
                                            </c:forEach>
                                        </ol>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="dropdown">
                                    <button class="btn btn--without-border btn--highlighted"><spring:message code="app.user-main-td-donation-pickup-address-details-dropdown"/></button>
                                    <div class="dropdown-content" style="width: 370px">
                                        <table class="address-dropdown-table btn--highlighted">
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-street"/></th>
                                                <td><c:out value="${donation.street}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-city"/></th>
                                                <td><c:out value="${donation.city}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-zip-code"/></th>
                                                <td><c:out value="${donation.zipCode}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-pickup-date"/></th>
                                                <td><c:out value="${donation.pickUpDate}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-pickup-time"/></th>
                                                <td><c:out value="${donation.pickUpTime}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-user-phone"/></th>
                                                <td><c:out value="${donation.phone}"/></td>
                                            </tr>
                                            <tr>
                                                <th><spring:message code="app.user-main-dropdown-th-donation-notes"/></th>
                                                <td><c:out value="${donation.pickUpComment}"/></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </td>
                            <td style="width: 200px">
                                <c:if test="${donation.status.id == 1}">
                                    <div class="dropdown">
                                        <button class="btn btn--without-border btn--highlighted status-btn">
                                            <spring:message code="app.user-main-td-donation-status-awaiting-pickup"/>
                                        </button>
                                    </div>
                                </c:if>
                                <c:if test="${donation.status.id == 2}">
                                    <div class="dropdown">
                                        <button class="btn btn--without-border btn--highlighted status-btn">
                                            <spring:message code="app.user-main-donation-status-collected"/>
                                        </button>
                                        <div class="dropdown-content status-dropdown-menu btn--highlighted">
                                            <div style="padding-top: 15px; padding-bottom: 15px">
                                                <spring:message code="app.user-main-donation-status-collected-date"/>&nbsp;
                                                <c:out value="${donation.collected}"/>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${donation.status.id == 3}">
                                    <div class="dropdown">
                                        <button class="btn btn--without-border btn--highlighted status-btn">
                                            <spring:message code="app.user-main-donation-status-canceled"/>
                                        </button>
                                        <div class="dropdown-content status-dropdown-menu btn--highlighted">
                                            <div style="padding-top: 15px; padding-bottom: 15px">
                                                <spring:message code="app.user-main-donation-status-cancelled-date"/>&nbsp;
                                                <c:out value="${donation.cancelled}"/>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>

        </div>
    </section>
</c:if>

<script src="<c:url value="/resources/js/admin-donations.js"/>"></script>

</body>
</html>
