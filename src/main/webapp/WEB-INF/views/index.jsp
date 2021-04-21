<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<header class="header--main-page">
    <jsp:include page="/WEB-INF/views/jspf/user-header.jsp"/>

    <c:if test="${param.message == 'sent'}">
        <div class="container container--90" style="text-align: center; padding-top: 50px; height: 30px">
            <h3 class="form-group" style="color: #08b910; font-size: 18px">
                <span>
                    <spring:message code="app.index-contact-form-message-sent"/>
                </span>
            </h3>
        </div>
    </c:if>
    <c:if test="${param.message == 'error'}">
        <div class="container container--90" style="text-align: center; padding-top: 50px; height: 30px">
            <h3 class="form-group" style="color: red; font-size: 18px">
                <span>
                    <spring:message code="app.index-contact-form-message-error-1"/>
                </span>
                <span>
                    <spring:message code="app.index-contact-form-message-error-2"/>
                </span>
            </h3>
        </div>
    </c:if>

    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                <spring:message code="app.index-slogan-h1-top"/> <br>
                <spring:message code="app.index-slogan-h1-bottom"/>
            </h1>
        </div>
    </div>
</header>

<section id="stats" class="stats">
    <div class="container container--85" style="padding-left: 230px">
        <div class="stats--item">
            <em>${requestScope.numberOfDonatedBags}</em>
            <h3><spring:message code="app.index-stats-bags-received-h3"/></h3>
            <p style="width: 495px">
                <spring:message code="app.index-stats-bags-received-p"/>
            </p>
        </div>

        <div class="stats--item">
            <em>${requestScope.numberOfDonations}</em>
            <h3><spring:message code="app.index-stats-gifts-donated-h3"/></h3>
            <p style="width: 495px">
                <spring:message code="app.index-stats-gifts-donated-p"/>
            </p>
        </div>

    </div>
</section>

<section id="steps" class="steps">
    <h2><spring:message code="app.index-stats-steps-heading-h2"/></h2>

    <div class="steps--container">
        <div class="steps--item">
            <span class="icon icon--hands"></span>
            <h3><spring:message code="app.index-stats-steps-div-1-h3"/></h3>
            <p><spring:message code="app.index-stats-steps-div-1-p"/></p>
        </div>
        <div class="steps--item">
            <span class="icon icon--arrow"></span>
            <h3><spring:message code="app.index-stats-steps-div-2-h3"/></h3>
            <p><spring:message code="app.index-stats-steps-div-2-p"/></p>
        </div>
        <div class="steps--item">
            <span class="icon icon--glasses"></span>
            <h3><spring:message code="app.index-stats-steps-div-3-h3"/></h3>
            <p><spring:message code="app.index-stats-steps-div-3-p"/></p>
        </div>
        <div class="steps--item">
            <span class="icon icon--courier"></span>
            <h3><spring:message code="app.index-stats-steps-div-4-h3"/></h3>
            <p><spring:message code="app.index-stats-steps-div-4-p"/></p>
        </div>
    </div>

    <a href="<c:url value="/registration"/>" class="btn btn--large"><spring:message code="app.index-stats-steps-register-btn"/></a>
</section>

<section id="about-us" class="about-us">
    <div class="about-us--text">
        <h2><spring:message code="app.index-about-us-heading-h2"/></h2>
        <p><spring:message code="app.index-about-us-heading-p-1"/></p>
        <p><spring:message code="app.index-about-us-heading-p-2"/></p>
        <img src="<c:url value="/resources/images/signature.svg"/>" class="about-us--text-signature" alt="Signature" />
    </div>
    <div class="about-us--image"><img src="<c:url value="/resources/images/about-us.jpg"/>" alt="People in circle" /></div>
</section>

<section id="help" class="help">
    <h2><spring:message code="app.index-whom-do-we-help-heading-h2"/></h2>

    <!-- SLIDE 1 -->
    <div class="help--slides active" data-id="1">
        <p><spring:message code="app.index-whom-do-we-help-p"/></p>

        <ul class="help--slides-items">
            <c:set var="index" value="0"/>
            <jsp:useBean id="institutions" scope="request" type="java.util.List"/>
            <c:forEach items="${institutions}" varStatus="count" step="2">
                <li>
                    <div class="col">
                        <div class="title"><c:out value="${institutions[count.index].name}"/></div>
                        <div class="subtitle">
                            <spring:message code="app.index-whom-do-we-help-organization-goal-and-mission-text"/>
                            <c:out value="${institutions[count.index].description}"/>
                        </div>
                    </div>
                    <c:if test="${not empty institutions[count.index + 1].name }">
                        <div class="col">
                            <div class="title"><c:out value="${institutions[count.index + 1].name}"/></div>
                            <div class="subtitle">
                                <spring:message code="app.index-whom-do-we-help-organization-goal-and-mission-text"/>
                                <c:out value="${institutions[count.index + 1].description}"/>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${empty institutions[count.index + 1].name }">
                        <div style="width: 100%"></div>
                    </c:if>
                </li>
            </c:forEach>
        </ul>

    </div>

</section>

<jsp:include page="jspf/user-footer.jsp"/>
</body>
</html>
