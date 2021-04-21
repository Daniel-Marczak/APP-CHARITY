<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<nav class="container container--70">

    <ul class="nav--actions">
        <li class="logged-user">
            <spring:message code="app.top-bar-admin-welcome-text"/> <c:out value="${sessionScope.user.name}"/>
            <ul class="dropdown"  style="text-align: center">
                <li style="padding: 5px">
                    <a class="btn btn--without-border btn--small" href="<c:url value="/admin/profile"/>" style="width: 100px">
                        <spring:message code="app.top-bar-admin-drop-menu-profile-href"/>
                    </a>
                </li>
                <li>
                    <a class="btn btn--without-border btn--small" href="<c:url value="/user/main"/>" style="width: 100px">
                        <spring:message code="app.top-bar-admin-drop-menu-user-zone-href"/>
                    </a>
                </li>
                <li>
                    <form action="<c:url value="/logout"/>" method="post" style="display: inline-block">
                        <input class="btn btn--without-border btn--small" style="width: 100px; margin-top: 5px"
                               type="submit" value="<spring:message code="app.top-bar-admin-drop-menu-logout-href"/>"/>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                </li>
            </ul>
        </li>
    </ul>

    <ul>
        <li>
            <a href="<c:url value="/admin/main"/>" class="btn btn--without-border">
                <spring:message code="app.top-bar-admin-main-page-btn"/>
            </a>
        </li>
        <li>
            <a href="<c:url value="/institution/institutions"/>" class="btn btn--without-border">
                <spring:message code="app.top-bar-admin-institutions-btn"/>
            </a>
        </li>
        <li>
            <a href="<c:url value="/admin/donations"/>" class="btn btn--without-border">
                <spring:message code="app.top-bar-admin-donations-btn"/>
            </a>
        </li>
        <li>
            <a href="<c:url value="/admin/users"/>" class="btn btn--without-border">
                <spring:message code="app.top-bar-admin-users-btn"/>
            </a>
        </li>
        <li>
            <a href="<c:url value="/admin/administrators"/>" class="btn btn--without-border">
                <spring:message code="app.top-bar-admin-administrators-btn"/>
            </a>
        </li>
        <li>
            <a href="<c:url value="/admin/contact-form-messages"/>" class="btn btn--without-border">
                <spring:message code="app.admin-contact-form-messages-heading-h2"/>
            </a>
        </li>
    </ul>
</nav>