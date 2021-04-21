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
    <script src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.0.2/chart.js"/>"></script>
</head>
<body class="custom-scrollbar">
<header class="header">
    <jsp:include page="../jspf/admin-header.jsp"/>
</header>

<section id="stats" class="">
    <span id="test-span"></span>
    <div style="width: 100%; text-align: center; margin-top: 72px; margin-bottom: 50px">
            <span style="font-size: 20px; font-weight: bold">
                <spring:message code="app.admin-main-statistics-heading"/>
            </span>
    </div>
    <div class="container-canvas">

        <div class="canvas-div">
            <canvas id="institution-chart" class="canvas">
            </canvas>
        </div>

        <div class="canvas-div">
            <canvas id="donation-chart" class="canvas">
            </canvas>
        </div>

        <div class="canvas-div">
            <canvas id="user-chart" class="canvas">
            </canvas>
        </div>

        <div class="canvas-div">
            <canvas id="admin-chart" class="canvas">
            </canvas>
        </div>

        <div class="canvas-div">
            <canvas id="message-chart" class="canvas">
            </canvas>
        </div>

        <span id="chart-institution-text" class="hidden"><spring:message code="app.admin-main-statistics-institutions"/></span>
        <span id="chart-institution-text-active" class="hidden"><spring:message code="app.admin-main-statistics-institutions-active"/></span>
        <span id="chart-institution-text-inactive" class="hidden"><spring:message code="app.admin-main-statistics-institutions-inactive"/></span>
        <span id="chart-donation-text" class="hidden"><spring:message code="app.admin-main-statistics-donations"/></span>
        <span id="chart-donation-text-awaiting" class="hidden"><spring:message code="app.admin-main-statistics-donations-awaiting"/></span>
        <span id="chart-donation-text-collected" class="hidden"><spring:message code="app.admin-main-statistics-donations-collected"/></span>
        <span id="chart-donation-text-cancelled" class="hidden"><spring:message code="app.admin-main-statistics-donations-cancelled"/></span>
        <span id="chart-donation-text-unarchived" class="hidden"><spring:message code="app.admin-main-statistics-donations-unarchived"/></span>
        <span id="chart-donation-text-archived" class="hidden"><spring:message code="app.admin-main-statistics-donations-archived"/></span>
        <span id="chart-users-text" class="hidden"><spring:message code="app.admin-main-statistics-users"/></span>
        <span id="chart-users-text-active" class="hidden"><spring:message code="app.admin-main-statistics-users-active"/></span>
        <span id="chart-users-text-suspended" class="hidden"><spring:message code="app.admin-main-statistics-users-suspended"/></span>
        <span id="chart-admin-text" class="hidden"><spring:message code="app.admin-main-statistics-admins"/></span>
        <span id="chart-admin-text-active" class="hidden"><spring:message code="app.admin-main-statistics-admins-active"/></span>
        <span id="chart-admin-text-suspended" class="hidden"><spring:message code="app.admin-main-statistics-admins-suspended"/></span>
        <span id="chart-messages-text" class="hidden"><spring:message code="app.admin-main-statistics-messages"/></span>
        <span id="chart-messages-text-unread" class="hidden"><spring:message code="app.admin-main-statistics-messages-unread"/></span>
        <span id="chart-messages-text-read" class="hidden"><spring:message code="app.admin-main-statistics-messages-read"/></span>
        <span id="chart-messages-text-archived" class="hidden"><spring:message code="app.admin-main-statistics-messages-archived"/></span>

    </div>
</section>

<script src="<c:url value="/resources/js/admin-stats-pie-charts.js"/>"></script>
</body>
</html>
