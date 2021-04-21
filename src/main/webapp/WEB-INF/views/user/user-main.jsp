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
<header class="header--form-page">
    <jsp:include page="../jspf/user-header.jsp"/>
    <div class="slogan container container--90" style="padding-top: 150px; align-items: start">
        <div class="slogan--item">
                <c:if test="${empty param.updateStatus}">
                    <h2>
                        <c:if test="${param.edit == 'successful'}">
                            <div style="color: #08b910; font-size: 1.8rem; margin-bottom: 25px">
                                <spring:message code="app.admin-donations-edit-success-msg"/>
                            </div>
                        </c:if>
                        <p><spring:message code="app.user-main-page-heading-h1-1"/></p>
                    </h2>
                    <div class="slogan--steps" style="font-size: 16px">
                        <spring:message code="app.user-main-page-heading-h1-2"/>
                    </div>
                </c:if>
                <c:if test="${param.updateStatus == 2}">
                    <h1><spring:message code="app.user-main-status-updated-to-collected-message"/></h1>
                </c:if>
                <c:if test="${param.updateStatus == 3}">
                    <h1><spring:message code="app.user-main-status-updated-to-cancelled-message"/></h1>
                </c:if>
                <c:if test="${param.updateStatus == 4}">
                    <h1><spring:message code="app.user-main-status-updated-to-archived-message"/></h1>
                </c:if>
        </div>
    </div>

</header>

<section id="stats" class="stats">
    <div class="container container--85" style="padding-left: 130px">
        <div class="stats--item">
            <em><c:out value="${requestScope.bagsDonated}"/></em>
            <h3><spring:message code="app.user-main-stats-total-bags-quantity-h3"/></h3>
            <p><spring:message code="app.user-main-stats-total-bags-quantity-p"/></p>
        </div>

        <div class="stats--item">
            <em><c:out value="${requestScope.collectedDonations}"/></em>
            <h3><spring:message code="app.user-main-stats-gifts-donated-h3"/></h3>
            <p><spring:message code="app.user-main-stats-gifts-donated-p"/></p>
        </div>

        <div class="stats--item">
            <em><c:out value="${requestScope.awaitingDonations}"/></em>
            <h3><spring:message code="app.user-main-stats-awaiting-donations-h3"/></h3>
            <p><spring:message code="app.user-main-stats-awaiting-donations-p"/></p>
        </div>
    </div>
</section>

<c:if test="${requestScope.donations.size() > 0}">
<section id="help" class="help" style="margin-bottom: 200px">
    <h2 style="margin-bottom: 60px"><spring:message code="app.user-main-table-heading-h2"/></h2>

    <!-- SLIDE 1 -->
    <div data-id="1">

        <table style="min-width: 1000px">
            <thead>
                <tr>
                    <th style="width: 50px"><spring:message code="app.user-main-th-donation-id"/></th>
                    <th style="width: 100px"><spring:message code="app.user-main-th-donation-created"/></th>
                    <th style="width: 300px"><spring:message code="app.user-main-th-donation-beneficiary"/></th>
                    <th style="width: 150px"><spring:message code="app.user-main-th-donation-bags"/></th>
                    <th style="width: 150px"><spring:message code="app.user-main-th-donation-categories"/></th>
                    <th style="width: 160px"><spring:message code="app.user-main-th-donation-pickup-address"/></th>
                    <th style="width: 200px"><spring:message code="app.user-main-th-donation-status"/></th>
                </tr>
            </thead>
            <tbody style="text-align: center">
                <c:forEach var="donation" items="${requestScope.donations}">
                    <tr>
                        <td><c:out value="${donation.id}"/></td>
                        <td><c:out value="${donation.created}"/></td>
                        <td style="width: 300px"><c:out value="${donation.institution.name}"/></td>
                        <td><c:out value="${donation.quantity}"/></td>
                        <td style="width: 150px">
                            <div class="dropdown">
                                <button class="btn btn--without-border btn--highlighted">
                                    <spring:message code="app.user-main-td-donation-categories-li-dropdown"/>
                                </button>
                                <div class="dropdown-content btn--highlighted drop-down-style">
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
                                <button class="btn btn--without-border btn--highlighted">
                                    <spring:message code="app.user-main-td-donation-pickup-address-details-dropdown"/>
                                </button>
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
                                        <a href="/donation/archive/${sessionScope.user.id}/${donation.id}" class="btn btn--without-border btn--small btn--highlighted">
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
                                        <a href="/donation/archive/${sessionScope.user.id}/${donation.id}" class="btn btn--without-border btn--small btn--highlighted">
                                            <spring:message code="app.user-main-archive-donation"/>
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

<jsp:include page="/WEB-INF/views/jspf/user-footer.jsp"/>
</body>
</html>
