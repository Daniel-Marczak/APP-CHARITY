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
<header class="header--form-page">
    <jsp:include page="../jspf/user-header.jsp"/>
    <div class="slogan container container--90" style="padding-top: 200px; align-items: start">
        <div class="slogan--item">
            <h2>
                <spring:message code="app.donation-edit-heading-h1-1"/>&nbsp;<c:out value="${editDonation.id}"/>
            </h2>
            <div class="slogan--steps" style="font-size: 28px">
                <spring:message code="app.donation-edit-heading-h1-2"/>&nbsp;<c:out value="${editDonation.institution.name}"/>
            </div>
        </div>
    </div>
</header>
<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3><spring:message code="app.donation-form-steps-instructions-important-h3"/></h3>
            <p data-step="1" class="active">
                <spring:message code="app.donation-form-steps-instructions-step-1-p"/>
            </p>
            <p data-step="2">
                <spring:message code="app.donation-form-steps-instructions-step-2-p"/>
            </p>
            <p data-step="3">
                <spring:message code="app.donation-form-steps-instructions-step-3-p"/>
            </p>
            <p data-step="4">
                <spring:message code="app.donation-form-steps-instructions-step-4-p"/>
            </p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">
            <spring:message code="app.donation-form-step-counter-text"/> <span>1</span>/4
        </div>

        <!-- STEP 1 -->
        <form:form class="donation-form" modelAttribute="editDonation" action="/donation/edit" method="post">
            <form:hidden path="id"/>
            <form:hidden path="user"/>
            <form:hidden path="created"/>

            <div data-step="1" class="active">
                <h3><spring:message code="app.donation-form-step-1-checkbox-heading-h3"/></h3>

                <c:forEach var="category" items="${requestScope.categories}">
                    <div class="form-group form-group--checkbox">
                        <label>
                            <input class="input-categories" name="categories" title="${category.name}" type="checkbox" value="${category.id}">
                            <span class="checkbox"></span>
                            <span class="description"> <c:out value="${category.name}"/></span>
                        </label>
                    </div>
                </c:forEach>

                <div class="form-group form-group--buttons" style="height: 50px">
                    <button type="button" class="btn next-step hidden first-next-step-btn">
                        <spring:message code="app.donation-form-next-step-btn"/>
                    </button>
                </div>
            </div>

            <!-- STEP 2 -->
            <div data-step="2">
                <h3><spring:message code="app.donation-form-step-2-bag-quantity-heading-h3"/></h3>

                <div class="form-group form-group--inline">
                    <label>
                        <spring:message code="app.donation-form-step-2-bag-quantity-label"/>
                        <form:input class="input-quantity" type="number" step="1" min="1" path="quantity" cssStyle="width: 75px"/>
                    </label>
                </div>

                <div class="form-group form-group--buttons" style="height: 50px">
                    <button type="button" class="btn prev-step">
                        <spring:message code="app.donation-form-previous-step-btn"/>
                    </button>
                    <button type="button" class="btn next-step second-next-step-btn">
                        <spring:message code="app.donation-form-next-step-btn"/>
                    </button>
                </div>
            </div>

            <!-- STEP 3 -->
            <div data-step="3">
                <h3><spring:message code="app.donation-form-step-3-choose-organization-heading-h3"/></h3>

                <c:forEach var="institution" items="${requestScope.institutions}">
                    <div class="form-group form-group--checkbox">
                        <label>
                            <form:radiobutton cssClass="input-institution" data-inst-name="${institution.name}" data-inst-city="${institution.city}" path="institution" value="${institution}"/>
                            <span class="checkbox radio"></span>
                            <span class="description">
                                <span class="title"><c:out value="${institution.name}"/></span>
                                <label class="subtitle">
                                    <spring:message code="app.donation-form-step-3-organization-goal-and-mission-text"/>
                                    <c:out value="${institution.description}"/>
                                </label>
                            </span>
                        </label>
                    </div>
                </c:forEach>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">
                        <spring:message code="app.donation-form-previous-step-btn"/>
                    </button>
                    <button type="button" class="btn next-step third-next-step-btn">
                        <spring:message code="app.donation-form-next-step-btn"/>
                    </button>
                </div>
            </div>

            <!-- STEP 4 -->
            <div data-step="4">
                <h3><spring:message code="app.donation-form-step-4-pick-up-address-and-date-heading-h3"/></h3>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4><spring:message code="app.donation-form-step-4-pick-up-address-heading-h4"/></h4>
                        <div class="form-group form-group--inline">
                            <label>
                                <spring:message code="app.donation-form-step-4-pick-up-address-street"/>
                                <form:input class="input-street" path="street"/>
                            </label>
                            <div class="error-div-street hidden" style="margin-top: 10px">
                                <spring:message code="validation.error-donation-street"/>
                            </div>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                <spring:message code="app.donation-form-step-4-pick-up-address-city"/>
                                <form:input class="input-city" path="city"/>
                            </label>
                            <div class="error-div-city hidden" style="margin-top: 10px">
                                <spring:message code="validation.error-donation-city"/>
                            </div>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                <spring:message code="app.donation-form-step-4-pick-up-address-postcode"/>
                                <form:input class="input-zipCode" path="zipCode"/>
                            </label>
                            <div class="error-div-postcode hidden" style="margin-top: 10px">
                                <spring:message code="validation.error-donation-postcode"/>
                            </div>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                <spring:message code="app.donation-form-step-4-pick-up-address-telephone-nr"/>
                                <form:input class="input-phone" path="phone"/>
                            </label>
                            <div class="error-div-phone hidden" style="margin-top: 10px">
                                <spring:message code="validation.error-donation-phone"/>
                            </div>
                        </div>
                    </div>

                    <div class="form-section--column">
                        <h4><spring:message code="app.donation-form-step-4-pick-up-date-heading-h4"/></h4>
                        <div class="form-group form-group--inline">
                            <label>
                                <spring:message code="app.donation-form-step-4-pick-up-date"/>
                                <form:input class="input-pickUpDate" type="date" path="pickUpDate"/>
                            </label>
                            <div class="error-div-date hidden" style="margin-top: 10px">
                                <spring:message code="validation.error-donation-date"/>
                            </div>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                <spring:message code="app.donation-form-step-4-pick-up-hour"/>
                                <form:input class="input-pickUpTime" type="time" path="pickUpTime"/>
                            </label>
                            <div class="error-div-time hidden" style="margin-top: 10px">
                                <spring:message code="validation.error-donation-time"/>
                            </div>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                <spring:message code="app.donation-form-step-4-pick-up-notes-for-courier"/>
                                <form:textarea class="input-pickUpComment" path="pickUpComment" maxlength="295"/>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">
                        <spring:message code="app.donation-form-previous-step-btn"/>
                    </button>
                    <button type="button" class="btn next-step input-collector hidden fourth-next-step-btn">
                        <spring:message code="app.donation-form-next-step-btn"/>
                    </button>
                    <button type="button" class="btn donation-edit-confirm-address-and-date" style="margin-left: 20px">
                        <spring:message code="app.donation-edit-confirm-address-and-date"/>
                    </button>
                </div>
            </div>

            <!-- STEP 5 -->
            <div data-step="5">
                <h3><spring:message code="app.donation-form-donation-summary-heading-h3"/></h3>

                <div class="summary">
                    <div class="form-section">
                        <h4><spring:message code="app.donation-form-donation-summary-user-donation-h4"/></h4>
                        <ul>
                            <li>
                                <span class="icon icon-bag"></span>
                                <span class="summary--text">
                                    <spring:message code="app.donation-form-donation-summary-quantity"/>
                                    <span class="summary-quantity"></span>,&nbsp;
                                    <spring:message code="app.donation-form-donation-summary-items"/>&nbsp;
                                    <span class="summary-items"></span>
                                </span>
                            </li>

                            <li>
                                <span class="icon icon-hand"></span>
                                <span class="summary--text">
                                    <spring:message code="app.donation-form-donation-summary-beneficiary-span-1"/>
                                    <span class="summary-beneficiary-name"></span>
                                    <spring:message code="app.donation-form-donation-summary-beneficiary-span-2"/>
                                    <span class="summary-beneficiary-city"></span>
                                </span>
                            </li>
                        </ul>
                    </div>

                    <div class="form-section form-section--columns">
                        <div class="form-section--column">
                            <h4><spring:message code="app.donation-form-donation-summary-pickup-address-h4"/></h4>
                            <ul>
                                <li class="summary-address-street"></li>
                                <li class="summary-address-city"></li>
                                <li class="summary-address-zipCode"></li>
                                <li class="summary-phone"></li>
                            </ul>
                        </div>

                        <div class="form-section--column">
                            <h4><spring:message code="app.donation-form-donation-summary-pickup-date-h4"/></h4>
                            <ul>
                                <li class="summary-pickUp-date"></li>
                                <li class="summary-pickUp-time"></li>
                            </ul>
                            <h4><spring:message code="app.donation-form-step-4-pick-up-notes-for-courier"/></h4>
                            <ul>
                                <li class="summary-notes"></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">
                        <spring:message code="app.donation-form-previous-step-btn"/>
                    </button>
                    <button type="button" class="btn submit-donation-btn">
                        <spring:message code="app.donation-form-donation-summary-confirm-donation-btn"/>
                    </button>
                </div>
            </div>
            <sec:authorize access="hasRole('ADMIN')">
                <input type="hidden" name="admin" value="121101115">
            </sec:authorize>
            <sec:authorize access="hasRole('SUPER_ADMIN')">
                <input type="hidden" name="admin" value="121101115">
            </sec:authorize>
            <sec:authorize access="hasRole('USER')">
                <input type="hidden" name="admin" value="110111">
            </sec:authorize>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form:form>

    </div>
</section>

<jsp:include page="../jspf/user-footer.jsp"/>
<script src="<c:url value="/resources/js/donation-form.js"/>"></script>

</body>
</html>
