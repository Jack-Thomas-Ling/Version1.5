<%--
  Created by IntelliJ IDEA.
  User: Maxci
  Date: 2018/7/4
  Time: 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="../../statics/css/layui.css">
<!-- 引入 Bootstrap -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- 包括所有已编译的插件 -->
<script src="../../statics/js/bootstrap.min.js"></script>
<script src="../../statics/layui.js"></script>
<html>
<head>
    <title>欢迎来到Forum!</title>
</head>
<body>
<%@include file="header.jsp"%>
<div class="layui-container">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>
            <span class="layui-badge">快捷导航</span></legend>
    </fieldset>
        <div class="layui-anim layui-anim-up">
        <span class="layui-breadcrumb" lay-separator="/">
  <a href="">娱乐</a>
  <a href="">八卦</a>
  <a href="">体育</a>
  <a href="">搞笑</a>
  <a href="">视频</a>
  <a href="">游戏</a>
  <a href="">综艺</a>
</span>
    </div>

    <div style="height: 20px"></div>
    <div class="layui-row layui-col-space10" style="height: 1200px">
        <div class="layui-col-md9">
            <div class="grid-demo grid-demo-bg1">
                <fieldset class="layui-elem-field" style="height: 540px;">
                    <legend>近期热帖</legend>
                    <table class="table table-striped" style="background-color: white" >
                        <tbody>
                        <c:forEach items="${hotList}" var="t">
                            <tr>
                                <td style="font-size: 15px">
                                    <c:if test="${t.digest==1}">
                                        <span class="layui-badge">精</span> &nbsp;&nbsp;
                                    </c:if>
                                    <a href="/article/${t.topicId}">${t.topicTitle}</a>
                                    &nbsp;&nbsp;
                                    <i style="font-size: 12px;color: gray">-<fmt:formatDate value="${t.createTime}" type="date"/></i>
                                    <div style="float: right">${t.topicViews}</div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </fieldset>
            </div>
            <div class="grid-demo grid-demo-bg1">
                <fieldset class="layui-elem-field" style="height: 540px;">
                    <legend>新贴榜</legend>
                    <table class="table table-striped" style="background-color: white" >
                        <tbody>
                        <c:forEach items="${newList}" var="t">
                            <tr>
                                <td style="font-size: 15px">
                                    <c:if test="${t.digest==1}">
                                        <span class="layui-badge">精</span> &nbsp;&nbsp;
                                    </c:if>
                                    <a href="/article/${t.topicId}">${t.topicTitle}</a>
                                    &nbsp;&nbsp;
                                    <i style="font-size: 12px;color: gray">-<fmt:formatDate value="${t.createTime}" type="date"/></i>
                                    <div style="float: right">${t.topicViews}</div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </fieldset>
            </div>
        </div>
        <div class="layui-col-md3">
            <div class="grid-demo">
                <fieldset class="layui-elem-field" >
                    <legend>近期新用户</legend>
                    <div class="layui-field-box"style="height: 300px">
                        <c:forEach items="${recentUser}" var="r">
                            <div style="width: 60px ;height: 70px;float: left ;margin-right: 15px ;margin-bottom: 15px">
                                <img src="${r.imagePath}" onerror=this.src="/userPic/pic.jpg" style="width: 65px; height: 65px" >
                                <a align="center" href="/user/detail/${r.userId}"><p align="center">${r.userName}</p></a>
                            </div>
                        </c:forEach>
                    </div>
                </fieldset>
            </div>
            <br/>
            <button id="new" class="layui-btn  layui-btn-fluid">
                <i class="layui-icon">&#xe608;</i> 发帖
            </button>
            <br/>
            <br/>
            <div class="grid-demo">
                <fieldset class="layui-elem-field" >
                    <legend>论坛公告</legend>
                    <div class="layui-field-box"style="height: 400px">
                        公告是行政公文的主要文种之一，它和通告都属于发布范围广泛的晓谕性文种。公告是向国内外宣布重要事项或者法定事项时使用的公文。适用于向国内外宣布重要事项或者法定事项。
                        公告是用于向国内外宣布重要事项或者法定事项的公文。公告主要有两种，一是宣布重要事项，如最近中国将在东海进行地对地导弹发射训练；二是宣布法定事项，如宣布某项法规或规章，宣布国家领导人选举结果。


                    </div>
                </fieldset>
            </div>

        </div>
    </div>

</div>
<%@include file="footer.jsp"%>
</body>
<script>
    layui.use(['jquery', 'layer'], function(){
        var $ = layui.$ //重点处
            ,layer = layui.layer;
        $(document).ready(function(){
            $("#new").click(function () {
                if (${empty user}){
                    layer.msg("请先登录！");
                }else {
                    window.location.href="/addTopic";
                }
            });
        })
    })
</script>
</html>
