
  
<%--
  Created by IntelliJ IDEA.
  User: maliang
  Date: 2020/4/7
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>

<%
   String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<html>
<head>
    <title>江宁智库大屏</title>
    <script type="text/javascript" src="<%=basePath %>dataview/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>dataview/js/echarts.min.js"></script>
    <script src="<%=basePath %>dataview/js/jquery-1.8.3.min.js"></script>
    <script src="<%=basePath %>dataview/js/highcharts.js"></script>
    <script src="<%=basePath %>dataview/js/highcharts-3d.js"></script>
    
    <style>
    .gzlfzdl {
 
    background-color:transparent;
    color:#00ebfb;
    border: 0;
    margin-top: -11px;
    font-size: 15px;
 
    }
        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            color: #fff;
            /* font-family: Microsoft JhengHei; */
        }
        ul {
            list-style: none;
        }
        .top_title {
            width: 100%;
            height: 8%;
            background: url('<%=basePath %>dataview/img/title.png');
            background-size: 100% 100%;
            display: flex;
            justify-content: space-between;
        }
        .top_title div {
            width: 30%;
            height: 68%;
            text-align: center;
            line-height: 55px;
            font-size: 14px;
        }
        .content {
            position: absolute;
            z-index: -1;
            width: 100%;
            height: 100%;
            background: url('<%=basePath %>dataview/img/base_bg.png') no-repeat ;
            background-size: 100% 100%;
            overflow:hidden;
        }
        .tabbar {
            width: 100%;
            padding: 0.5% 10%;
            background: url('<%=basePath %>dataview/img/title_bg.png') no-repeat;
            background-size: 100% 100%;
            display: flex;
            justify-content: space-around;
        }
        .tabbar li {
            font-size: 12px;
            margin: -18px 15px -12px 15px;
            font-weight: bold;
            color: #00ebfb;
            cursor: pointer;
            white-space: nowrap;
        }
        .tabbarAct, .sm_tit {
            background-image: -webkit-linear-gradient(top,#eacd93,#eb9d47);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .details {
            height: 92%;
            display: flex;
            justify-content: space-between;
        }
        .details > div:nth-child(odd) {
            width: 28%;
        }
        .details > div:nth-child(even) {
            width: 44%;
        }
        .left_cont > div {
            height: 31.5%;
            margin: 2.5% 3% 0 0;
        }
        .zxfx {
            background: url('<%=basePath %>dataview/img/box.png');
            background-size: 100% 100%;
        }
        .sm_tit {
            display: flex;
            font-weight: bold;
            font-size: 15px;
            padding: 2% 0 1% 4%;
        }
        .sm_tit img {
            height: 17px;
            width: 30%;
            padding: 1% 0 0 3%;
        }
        .zxfx_tab {
            display: flex;
            justify-content: space-around;
            font-size: 12px;

        }
        .zxfx_tab li {
            color: #09add3;
            width: 32.3%;
            padding: 1.5%;
            text-align: center;
            background: #0f409a;
            cursor: pointer;
            border: 1px solid #0f409a;
        }
        .zxfx_act {
            color: #00ebfb !important;
            border: 1px solid #00ebfb !important;
        }
        .zxfx_ul {
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
        }
        .zxfx_ul li {
            display: flex;
            justify-content: space-between;
            width: 100%;
            font-size: 12px;
            padding: 3% 0;
            margin: 2% 0;
            border: 1px solid #0a43bb;
            background: rgba(15, 61, 122, 0.3);
            white-space: nowrap;
        }
        .zxfx_ul li > div {
            display: flex;
            width: 33%;
        }
        .zxfx_ul li > div > div:nth-child(odd) {
            width: 55%;
            text-align: center;
            color: #00ebfb;
        }
        .zxfx_ul li > div > div:nth-child(even) {
            width: fit-content;
            width: 40%;
            width: 58px;
            padding: 0 5px;
            text-align: center;
            background: rgba(13, 64, 154, 0.7);
            border: 1px solid #0a43bb;
        }
        .fzr {
            padding: 0 !important;
            background: none !important;
            border: none !important;
        }
        .fzr img {
            height: 8px;
            margin: 0 2px 1px 0;
        }
        .rylb {
           position: absolute;
    bottom: 0.5%;
    height: 36%;
    width: 44.9%;
    margin-left: -0.5%;
            
        }
        .rdyw, .rylb {
            background: url('<%=basePath %>dataview/img/box1.png');
            background-size: 100% 100%;
        }
        .rdyw_ul {
            padding-left: 2%;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            height: 84%;
        }
        .rdyw_ul li {
            font-size: 12px;
            line-height: 27px;
            white-space: nowrap;
        }
        .rdyw_ul li img {
            vertical-align: middle;
            margin: 0 10px;
        }
        .sjzl {
            background: url('<%=basePath %>dataview/img/box1.png');
            background-size: 100% 100%;
        }
        .sjzl_cont {
            display: flex;
            justify-content: space-around;
            padding: 0 2%;
            height: 74%;
        }
        .sjzl_cont > div:nth-child(1) {
            width: 30%;
            text-align: center;
        }
        .sjzl_cont > div:nth-child(2) {
            width: 65%;
        }
        .sjzl_left {
            display: flex;
            flex-direction: column;
            justify-content: space-around;
        }
        .sjzl_left span ,.sjzl_left p {
            font-size: 12px;
        }
        .sjzl_left p {
            color: #00ebfb;
            margin-top: 2%;
        }
        .baseplat {
            background: url('<%=basePath %>dataview/img/baseplate.png') no-repeat;
            background-size: 50% 50%;
            background-position: bottom;
            height: 77%;
        }
        .sjzl_echart, .sjzl_left {
            border: 1px solid #0a43bb;
            background: rgba(15, 61, 122, 0.3);
        }
        .middle_cont {

        }
        .right_cont > div:nth-child(1) {
            height: 32%;
            margin: 2.5% 0 0 3%;
        }
        .right_cont > div:nth-child(2) {
            height: 64%;
            margin: 2.5% 0 0 3%;
            background: url('<%=basePath %>dataview/img/big_box.png') no-repeat;
            background-size: 100% 100%;
        }
        .jjyx {
            white-space: nowrap;
            width: 100%;
            font-size: 15px;
        }
        .jjyx img {
            vertical-align: middle;
            padding: 4px;
            width: 30%;
        }
        .gzlfz_text, .gzlfz_text0 {
            background-image: -webkit-linear-gradient(top,#01ffff,#01ffff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            padding: 9% 0%;
        }
        .gzlfz_text0 {
            background-image: -webkit-linear-gradient(top,#eacd93,#eb9d47);
        }
        .vs_img {
            margin: 0 26px;
            height: 0%;
        }
        .zhiku, .rylb_tit_row input {
            background: transparent;
            border: 0;
            outline: none;
            width: 100px;
            font-size: 12px;
        }
        .zhiku::-webkit-input-placeholder{/*Webkit browsers*/
            color: #fff;
            font-size: 12px;
        }
        .zhiku:-moz-placeholder{/*Mozilla Firefox 4 to 8*/
            color:#999;
            font-size: 12px;
        }

        .zhiku:-ms-input-placeholder{/*Internet Explorer 10+*/
            color:#999;
            font-size: 12px;
        }
        .rylb_tit_row input::-webkit-input-placeholder{/*Webkit browsers*/
            color: #00ebfb;
            font-size: 12px;
        }
        .rylb_tit_row input:-moz-placeholder{/*Mozilla Firefox 4 to 8*/
            color:#00ebfb;
            font-size: 12px;
        }

        .rylb_tit_row input:-ms-input-placeholder{/*Internet Explorer 10+*/
            color:#00ebfb;
            font-size: 12px;
        }
        .search_img, .rylb_tit_row img {
            width: 14px;
            height: 14px;
            vertical-align: middle;
        }
        .rylb_tit_row, .hjjc_unit {
            position: absolute;
            top: 0;
            right: 0;
            border: 1px solid #0a43bb;
            background: rgba(15, 61, 122, 0.3);
            padding: 0px 9px 4px;
            margin: 6px 5px;
        }
        .hjjc_unit {
            border: none;
            background: none;
            font-size: 12px;
            top: 8px;
        }
        .rylb_tit_row img {
            margin-right: 5px;
        }
        .rylb_table {
            width: 100%;
            text-align: center;
            font-size: 12px;
            height: 100%;
            border-collapse:collapse;
        }
        .rylb_table thead td {
            color: #00ebfb !important;
        }
        .rylb_table thead td {
            padding-bottom: 6px;
        }
        .rylb_table tbody tr:nth-child(odd) {
            background: #000000;
            background: -moz-linear-gradient(left,  rgba(0,0,0,0) 0%, rgba(15, 61, 122, 0.9) 100%);
            background: -webkit-linear-gradient(left,  rgba(0,0,0,0) 0%,rgba(15, 61, 122, 0.9) 100%);
            background: -o-linear-gradient(left,  rgba(0,0,0,0) 0%,rgba(15, 61, 122, 0.9) 100%);
            background: -ms-linear-gradient(left,  rgba(0,0,0,0) 0%,rgba(15, 61, 122, 0.9) 100%);
            background: linear-gradient(to right,  rgba(0,0,0,0) 0%,rgba(15, 61, 122, 0.9) 100%);
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='rgba(0,0,0,0)', endColorstr='rgba(15, 61, 122, 0.9)',GradientType=0 );
        }
        .word_red {
            color: #dd4528;
        }
        .selecte {
            display: block;
        }
        .not_seled {
            display: none;
        }
        .selecte0 {
            display: block;
        }
        .not_seled0 {
            visibility: hidden !important;
        }
        .kgyqxm{
        width: 5%; height: 100%;font-size: 12px;
        }
        .xmlx{
        width: 100%; height: 10%;text-align: center
        }
        .fontcor{
        color:#00ebfb
        }
        .cjxmle{
        width: 83px;
        text-align: center;
         
        }
        .xmleft{
        margin-left: -60%;
        }
        .kgxm{
        margin-top: 63%;
        }
        .yqxm{
        margin-top: 146%;
        }
        .xmright{
          margin-left: -171%;
        }
        .xmxxbt{
        width: 100%; height: 2%;text-align: center;margin-top: -9%;
        font-size: 15px;
        }
        .curweather{
        overflow:hidden;
        }
      
    </style>
</head>

<body>
<div class="content">
    <div class="top_title">
        <div id="currentdate"></div>
        <div style="position: relative;top: 92%;">
            <ul id="ulList" class="tabbar" >
                <li class="tabbarAct">人员信息</li><li>项目信息</li><li>环境监测</li><li>招商投资</li>
            </ul>
        </div>
        <div id="curweather" class="curweather" ><iframe width="400" style="margin-left: 18%"  scrolling="no" height="20" frameborder="0" allowtransparency="true" src="//i.tianqi.com/index.php?c=code&id=1&color=%23FFFFFF&bgc=%23&icon=1&py=jiangning&wind=1&num=1&site=14"></iframe></div>
    </div>
    <div class="details">
        <div class="left_cont">
            <div class="zxfx">
                <div class="sm_tit"><div>政效分析</div><img src="<%=basePath %>dataview/img/xiexian.png" alt=""></div>
                <div style="padding: 0 2%; height: 85%;">
                    <ul id="tabbar" class="zxfx_tab">
                        <li class="zxfx_act">今日大厅</li><li>工单12345</li><li>预审待办</li>
                    </ul>
                    <div id="content" style="height: 85%;">
                        <ul class="zxfx_ul selecte" style="height: 100%; flex-direction: column; justify-content: space-around;">
                            <li>
                                <div>
                                    <div>办理进度</div>
                                    <div>78%</div>
                                </div>
                                <div>
                                    <div>已办理</div>
                                    <div>158人次</div>
                                </div>
                                <div>
                                    <div>待办理</div>
                                    <div>5人次</div>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <div>本月叫号峰值</div>
                                    <div>78%</div>
                                </div>
                                <div>
                                    <div>峰值日</div>
                                    <div class="fzr"><img src="<%=basePath %>dataview/img/red_circle.png" />2020-3-18</div>
                                </div>
                                <div>
                                    <div>日均值</div>
                                    <div>8单/日</div>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <div>本月累计</div>
                                    <div>78%</div>
                                </div>
                                <div>
                                    <div>本年累计</div>
                                    <div>158人次</div>
                                </div>
                                <div>
                                </div>
                            </li>
                        </ul>
                        <ul class="zxfx_ul not_seled" style="height: 100%; flex-direction: column; justify-content: space-around;">
                            <li>
                                <div>
                                    <div>办结率</div>
                                    <div >78件</div>
                                </div>
                                <div>
                                    <div>已派单</div>
                                    <div>158件</div>
                                </div>
                                <div>
                                    <div>已结单</div>
                                    <div class="word_red">54</div>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <div>及时签收率</div>
                                    <div>78%</div>
                                </div>
                                <div>
                                    <div>综合满意率</div>
                                    <div>64%</div>
                                </div>
                                <div>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <div>本月累计</div>
                                    <div class="word_red">113单</div>
                                </div>
                                <div>
                                    <div>本年累计</div>
                                    <div class="word_red">2024单</div>
                                </div>
                                <div>
                                </div>
                            </li>
                        </ul>
                        <ul class="zxfx_ul not_seled" style="height: 100%; flex-direction: column; justify-content: space-around;">
                            <li>
                                <div>
                                    <div>不通过项目</div>
                                    <div>78件</div>
                                </div>
                                <div>
                                    <div>已派单</div>
                                    <div>158人次</div>
                                </div>
                                <div>
                                    <div>已办结</div>
                                    <div class="word_red">54</div>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <div>已通过项目</div>
                                    <div>78%</div>
                                </div>
                                <div>
                                    <div>综合满意率</div>
                                    <div>64%</div>
                                </div>
                                <div>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <div>平均处理周期</div>
                                    <div class="word_red">113单</div>
                                </div>
                                <div>
                                    <div>本年累计</div>
                                    <div class="word_red">2024件</div>
                                </div>
                                <div>
                                </div>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
            <div class="rdyw">
                <div class="sm_tit"><div>热点要闻</div><img src="<%=basePath %>dataview/img/xiexian.png" alt=""></div>
                <ul class="rdyw_ul" id="rdywlist">
           
                </ul>
            </div>
            <div class="sjzl">
                <div class="sm_tit"><div>数据总览</div><img src="<%=basePath %>dataview/img/xiexian.png" alt=""></div>
                <div class="sjzl_cont" style="display: flex;">
                    <div class="sjzl_left">
                        <div>
                            <div class="baseplat" id="byzl"></div>
                            <p>本月增量</p>
                        </div>
                        <div>
                            <div class="baseplat" id="zksjzl"></div>
                            <p>智库数据总量</p>
                        </div>
                    </div>
                    <div class="sjzl_echart">
                        <div id="allnum" style="width: 100%; height: 100%;"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="middle_cont">
            <div>
                <div style="display: flex; margin: 4.4% auto;width: fit-content;font-size: 12px;">
                    <div style="background: rgba(0, 0, 0, 0.2); padding: 6px;">智库<img src="<%=basePath %>dataview/img/down.png" /></div>
                    <div style="    background: rgba(0,0,0,0.55); padding: 6px;"><input class="zhiku" type="text" placeholder="请输入关键字"><img id="zk_search" class="search_img" src="<%=basePath %>dataview/img/search.png" alt=""></div>
                </div>
            </div>
            <div id="mid_cont">
                <div class="rylb selecte0" >
                    <div class="sm_tit"><div>人员列表</div><img src="<%=basePath %>dataview/img/xiexian.png" alt="" ></div>
                    <div class="rylb_tit_row">
                        <img id="rylb_sear" onclick="search()" src="<%=basePath %>dataview/img/search0.png" alt=""><input type="text" id="searchContent" placeholder="请输入搜索人信息" >
                    </div>
                    <div >
                     <table class="rylb_table">
                      <thead>
                            <tr>
                                <td>姓名</td><td>职位</td><td>电话</td><td>性别</td><td>年龄</td>
                            </tr>
                            </thead>
                     </table>
                    </div>
            
                    <div id="demo"   style="width: 100%; height:71%;padding: 3px 5px 0;overflow:hidden">
                        <div id="demo1">
                        <table class="rylb_table" id="rylblist"></table>
                        </div>
                        <div id="demo2">
                       </div>
                    </div>
                    
                </div>
                <div class="rylb not_seled0" >
                    <div class="sm_tit" style="padding-left:1%"><div>项目信息</div><img src="<%=basePath %>dataview/img/xiexian.png" alt=""></div>
                    <div class="hjjc_unit">数量：个</div>
                    <div class="xmxx" style="width: 100%; height: 80%;padding: 3px 5px 0;display: flex;">
                      <div style="width: 50%; height: 100%;">
                       <div id="xmxx_pie" style="width: 100%; height: 100%;"></div>
                       <div id="xmxx_cj"  class="xmxxbt" ></div>
                      </div>
                      <div  style="width: 50%; height: 100%;">
                        <div id="xmxx_pie2" style="width: 100%; height: 100%;"></div>
                        <div id="xmxx_cy" class="xmxxbt" ></div>
                      </div>
                    </div>  
                </div>
                <div class="rylb not_seled0" >
                    <div class="sm_tit"><div>环境监测</div><img src="<%=basePath %>dataview/img/xiexian.png" alt=""></div>
                    <div class="hjjc_unit">数量：个</div>
                    <div style="width: 100%; height: 80%;padding: 3px 5px 0;">
                        <div id="hjjc_echart" style="width: 100%; height: 100%;"></div>
                    </div>
                </div>
                <div class="rylb not_seled0">
                    <div class="sm_tit"><div>招商投资</div><img src="<%=basePath %>dataview/img/xiexian.png" alt=""></div>
                    <div style="display:flex;height: 21%;letter-spacing: 2px;">
                     <div id="ndjhtze" style="margin-left: 12%;"> </div>
                     <div id="dqtzje" style="background:url(<%=basePath %>dataview/img/zstzyz.png) no-repeat;width: 41%;margin-left: 6%;" ></div>
                     
                      </div>                                 
                    <div style="width: 100%; height: 80%;padding: 3px 5px 0;display: flex;">
                        <div id="zstz_pie" style="width: 45%; height: 100%;top:-21px"></div>
                        <div id="zstz_line" style="width: 55%; height: 100%;top: -36px;"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="right_cont">
            <div class="zxfx">
                <div class="sm_tit"><div>经济运行</div><img src="<%=basePath %>dataview/img/xiexian.png" alt=""></div>
                <div style="padding: 0 2%; height: 100%;">
                    <div class="jjyx"><div style="margin: auto;width: fit-content;" id="jjyxbt"></div></div>
                    <div id="jjyx_echart" style="width: 100%; height: 75%;"></div>
                    <div id="testtitle"></div>
                </div>
            </div>
            <div class="sjzl">
                <div style="display:flex">
                <div class="sm_tit"><div>高质量发展</div><img src="<%=basePath %>dataview/img/xiexian.png" alt=""></div>
                <div style="display: flex;width: fit-content;margin: 5% auto;" >  
                <select class="gzlfzdl" id="gzlfzdl" style=" border: 0;"></select> </div>
                </div>
                <div style="font-size: 18px;font-weight: bold;text-align: center;">
                    <div style="display: flex;width: fit-content;margin: 5% auto;margin-right: 10%;">
                        <div class="gzlfz_text">江宁</div>
                        <img class="vs_img" src="<%=basePath %>dataview/img/vs.png" alt="">
                        <select class="gzlfz_text0" id="gzlfzname" style="border: 0;font-size: 18px;"></select>
                    </div>
                </div>
                <div id="gzlfz_chart" style="width: 100%; height: 58%;"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    window.onresize=function(){
        location=location;
    }

  
    // 大屏点击切换事件
    var ulList = document.getElementById("ulList").children
    var mid_cont = document.getElementById("mid_cont").children
    for(var i=0; i< ulList.length; i++) {
        change(ulList[i])
    }
    function change (obj0) {
        obj0.onclick = function () {
            for(var j=0; j<ulList.length; j++) {
                if(obj0 == ulList[j]) {
                    obj0.className = "tabbarAct";
                    mid_cont[j].className = "rylb selecte0"
                }else{
                    ulList[j].className = ''
                    mid_cont[j].className = 'rylb not_seled0'
                }
            }
        }
    }

    // 政效分析点击切换事件
    var arrLi = document.getElementById("tabbar").children
    var content = document.getElementById("content").children
    for(var i=0; i< arrLi.length; i++) {
        cut(arrLi[i])
    }
    function cut (obj) {
        obj.onclick = function () {
            for(var j=0; j<arrLi.length; j++) {
                if(obj == arrLi[j]) {
                    obj.className = "zxfx_act";
                    content[j].className = "selecte zxfx_ul"
                }else{
                    arrLi[j].className = ''
                    content[j].className = 'not_seled zxfx_ul'
                }
            }
        }
    }

    // 智库 点击搜索
    $(document).ready(function(){
        $("#zk_search").click(function(){
            alert("智库搜索")
        })
    })

 
    // 数据总览
    var option1 = {
        title: {
            text: '本月新增数据统计',
            x:'center',
            textStyle: {
                color: '#00ebfb',
                fontSize: 12,
                fontWeight: 300,
            }
        },
        color: ['#3398DB'],
        tooltip: {
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        grid: {
            top: '30%',
            left: '2%',
            right: '2%',
            bottom: '5%',
            containLabel: true
        },
        xAxis: {
            type: 'category',
            data: ['百科全书','专家智库','热点要闻'],
            axisTick: {
                alignWithLabel: true
            },
            axisTick: {show: false},
            axisLine:{
                lineStyle:{
                    show:false,
                    color:'#114D94', //横轴上的颜色
                }
            },
            axisLabel: {
                textStyle: {
                    color: '#72ABE2'
                }
            },
        },
        yAxis: {
            type: 'value',
            // y轴最大值结尾处添加单位name
            name: '数量：条',
            nameLocation: "end",
            nameTextStyle:{
                color:"#657dbb",
                fontSize:12,
                fontWeight: 300,
            },
            axisTick: {show: false},
            axisLine:{
                show: false,  // 不显示y轴
                lineStyle:{
                    color:'#657dbb', //纵轴上的颜色
                }
            },
            splitLine: {
                lineStyle: {
                    color: '#0D2B5C', // 网格线颜色
                    width: 1,
                    // opacity: 0.2
                }
            },
            axisLabel: {
                textStyle: {
                    color: '#657dbb'
                }
            },
        },
        series: [
            {
                type: 'bar',
                barWidth: '30%',
                data:[100, 252, 200],
                itemStyle: {   // 柱子渐变色
                    normal: {
                        color:function (params) {
                            var colorList = [
                                ['#0482de', '#3f29d0'],
                                ['#ffd701', '#fb9400'],
                                ['#65dfe3', '#0482df'],
                            ];
                            var index = params.dataIndex;
                            if (params.dataIndex >= colorList.length) {
                                index = params.dataIndex - colorList.length;
                            }
                            return new echarts.graphic.LinearGradient(0, 0, 0, 1,
                                [{
                                    offset: 0,
                                    color: colorList[index][0]
                                },
                                    {
                                        offset: 1,
                                        color: colorList[index][1]
                                    }
                                ]);
                        },
                        label: {
                            show: true,
                            position: 'top',
                            textStyle: {
                                color: '#00ebfb',
                                fontSize: 12
                            }
                        }
                    }
                }
            },
        ]
    }
    //初始化echarts实例
    var myChartone = echarts.init(document.getElementById('allnum'));
    
    var seriesData1 = [];
    $.ajax({
        url:basePath + "zk/BigDataVies/findDataZL.ajax",
        dataType: 'json',
        async: true,
        type:'get',
        jsonp: 'callback',
        success : function(data) {
        	var mydata=data.data;
         
             seriesData1 =mydata.numarr;
             $("#byzl").html(mydata.byzl).append("<span>条</span>");
             $("#zksjzl").html(mydata.zksjzl).append("<span>条</span>");
    
            option1.series[0].data =seriesData1;

            //使用制定的配置项和数据显示图表
            myChartone.setOption(option1);
        },
        error : function(html) {
        }
    });
    
    


    
     var etids=[];
     var etno="";
     if(etids.length==0){ 
    	etno= "";
    	getAjacJJYX(etno);
     }
     
       //经济运行
       function getAjacJJYX(etno){
       $.ajax({
        url:basePath + "zk/BigDataVies/findJJYX.ajax?etno="+etno,
        dataType: 'json',
        async: true,
        type:'get',
        jsonp: 'callback',
        success : function(data) {
             var res=data.data;
             if(!res.etids.length==0){
            	 etids=res.etids;
             }
             getJJYX(res);
        
        },
        error : function(html) {
        }
    });
   }   
       var k=0;
       //左边切换
       function leftChange(){
    	   k--;
    	   if(k<0){
    		   getAjacJJYX(etids[etids.length-1]);
    		   k=etids.length-1;
    		   
    	   }else{
    		   
    		   getAjacJJYX(etids[k]);
    	   }
	   
       }
       	
        //右边切换
       function rightChange(){
    	   k++;
    	   if(k<=etids.length-1){
    		   getAjacJJYX(etids[k]);
    		  
    	   }else{
    		   getAjacJJYX(etids[0]);
    		   k=0;
    		   
    	   }
    	   
       }
 //构建经济运行echars图
 function getJJYX(res){
	 var title="<img src=\"<%=basePath %>dataview/img/left_sq.png\" onclick=\"leftChange()\" />"+res.title+"<img src=\"<%=basePath %>dataview/img/right_sq.png\" onclick=\"rightChange()\" />";
 	
     $("#jjyxbt").html(title);
     
     Highcharts.chart('jjyx_echart', {
         chart: {
             backgroundColor: 'rgba(0,0,0,0)',
             type: 'column',
             options3d: {
                 enabled: true,
                 alpha: 10,
                 beta: 10,
                 depth: 0,
                 viewDistance: 25
             }
         },
         xAxis: {
             categories: res.yearList,
             gridLineColor: 'transparent',
             labels: {
                 style: {
                     "color" : "#fff"
                 }
             },
             plotLines: [{
                 value: 0,
                 width: 1,
                 color: '#4897c5'
             }]
         },
         yAxis: {
             title:'',
             gridLineColor: 'transparent',
             labels: {
                 style: {
                     "color" : "#fff"
                 }
             },
             plotLines: [{
                 value: 0,
                 width: 1,
                 color: '#4897c5'
             }]
         },
         credits: {
             enabled: false
         },
         title: {
             text: ''
         },
         subtitle: {
             align: "left",
             text:"单位:"+res.unit,
             style: {
                 "color" : "#fff"
             }
         },
         plotOptions: {
             series: {
                 depth: 25,
                 colorByPoint: true
             },
             column: {
                 pointPadding: 0.2,
                 borderWidth: 0,
                 dataLabels: {
                     enabled: true,
                     color: "#fff"
                 }
             }
         },
         dataLabels: {
             enabled: true
         },
         series: [{
             data: res.numList,
             name: 'Cylinders',
             showInLegend: false,
             zones: [{
                 color: {
                     linearGradient:{x1: 0, y1: 0, x2: 0, y2: 1 },
                     stops: [
                         [0, "#70f2ef"],
                         [1, "#3f71dd"]
                     ]
                 }
             }]
         }]
     });
     
     
	 
 }
       
       

    // 高质量发展
    var option3 = {
        legend: {
            data: [],
            itemWidth: 20,
            itemHeight: 6,
            textStyle: {
                color: "#fff"
            }
        },
        radar: {
            indicator: [],
            center: ['50%', '54%'],
            radius: '50%',
            splitNumber: 5,
            shape: 'polygon',
            name: {
                formatter: '{value}',
                color: '#fff',
                fontStyle: 'normal'
            },

            axisLine: {
                lineStyle: {
                    color: '#1baed4',
                    width: 1
                }
            },
            splitArea : {
                show : true,
                areaStyle : {
                    color: ["rgba(255, 255, 255, 0)"]  // 图表背景网格的颜色
                }
            },
            splitLine: {
                lineStyle: {
                    color: '#1baed4',
                    width: 1
                }
            }
        },
        series: [
            {
                name: '雷达图',
                type: 'radar',
                emphasis: {
                    lineStyle: {
                        width: 1
                    }
                },
                data: [
                    {
                        value: [],
                        name: '',
                        symbol: 'circle',
                        symbolSize: 8,
                        itemStyle: {
                            color: '#01ffff'
                        },
                        lineStyle: {
                            type: 'dashed',
                            color: '#a6a227',
                            width: 1.5
                        },
                        areaStyle: {
                            color: 'rgba(255, 255, 255, 0.1)'
                        }
                    },
                    {
                        value: [],
                        name: '',
                        symbol: 'circle',
                        symbolSize: 1,
                        itemStyle: {
                            color: '#eaa24d',
                            borderWidth: 0,
                            borderColor: '#01dbdd'
                        },
                        lineStyle: {
                            color: '#01dbdd',
                            width: 1
                        },
                        areaStyle: {
                            color: 'rgba(46, 208, 234, 0.6)'
                        }
                    }
                ]
            }
        ]
    }
    //初始化echarts实例
    var myCharthree = echarts.init(document.getElementById('gzlfz_chart'));

    //使用制定的配置项和数据显示图表
     // myCharthree.setOption(option3);
     var optnam=[];
    var optids =[];
    var optdbnam=[];
    var optdbids=[];
    var options="";
    var optionsdb="";//高质量发展大类option
    function getGZLFZ(dano,dbno){
    if(dano==undefined){
    	var dano="";
    }
    if(dbno==undefined){
    	var dbno="";
    }
    $.ajax({
        url:basePath + "zk/BigDataVies/findGZLFZ.ajax?dano="+dano+"&dbno="+dbno,
        dataType: 'json',
        async: true,
        type:'get',
        jsonp: 'callback',
        success : function(data) {
        	var mydata=data.data;
        	   
          	 if(!mydata.alldanames.length==0&&!mydata.alldaids.length==0){
              	 
              	 optnam=mydata.alldanames;//地区名称
              	 optids=mydata.alldaids;//地区主键
               }
          	
            	
            	if(!mydata.alldbnames.length==0&&!mydata.alldbids.length==0){
             	 optdbnam=mydata.alldbnames;//高质量发展大类名称
          	     optdbids=mydata.alldbids;//高质量发展大类主键
              }
        	
        	//地区选择框
        	if($("#gzlfzname").html()==null ||$("#gzlfzname").html()==""){
        	for( var k=0;k<optnam.length;k++){
        		options+="<option style=\"background-color: #000103;color:#eab56d\" value=\""+optids[k]+"\">"+optnam[k]+"</option>";
        		
        	}
        	    $("#gzlfzname").html(options);   
        	}
        	
        	//高质量发展大类选择框
        	if($("#gzlfzdl").html()==null ||$("#gzlfzdl").html()=="" ){
 
        		for( var m=0;m<optdbnam.length;m++){
        			optionsdb+="<option style=\"background-color: #143276;color:#00ebfb\" value=\""+optdbids[m]+"\">"+optdbnam[m]+"</option>";
            		
            	}
            	    $("#gzlfzdl").html(optionsdb);  
        		
        	}
        	
        	option3.legend.data=mydata.legend;//两个地区的图例
        	option3.radar.indicator=mydata.indicator;//所有的指标名称
        	
        	var myvalues=mydata.values;//地区对应的数值数组
        	for(var m=0;m<myvalues.length;m++){
        		option3.series[0].data[m].value=myvalues[m].value;
        	
        		option3.series[0].data[m].name=myvalues[m].name;
        		
        		
        	}
        
          //使用制定的配置项和数据显示图表
            myCharthree.setOption(option3);
        },
        error : function(html) {
        }
    });
    };
    getGZLFZ();//默认请求
    //下拉框改变，重新请求
     $("#gzlfzname").change(function(){
    	var selval = document.getElementById("gzlfzname");
         var dano=selval.options[selval.selectedIndex].value;
         var selval2 = document.getElementById("gzlfzdl");
         var dbno=selval2.options[selval2.selectedIndex].value;
         
    	getGZLFZ(dano,dbno);
    	
     
    });
     $("#gzlfzdl").change(function(){
    	 var selval = document.getElementById("gzlfzname");
         var dano=selval.options[selval.selectedIndex].value;
     	var selval2 = document.getElementById("gzlfzdl");
        var dbno=selval2.options[selval2.selectedIndex].value;
       
     	getGZLFZ(dano,dbno);
     	
      
     });
 
  
      //城建项目
      cjoption = {
    		    tooltip: {
    		    	 backgroundColor: 'rgba(0,0,0,0)',
    		        trigger: 'item',
    		        formatter: '{b}: {c} ({d}%)'
    		    },
    		    legend: {
    		        orient: 'vertical',
    		        right:-5,
    		        itemWidth: 15, 
    		        itemHeight: 10,
    		        textStyle:{color:'#4f9de3',
    		        	fontSize: 10},
    		        data: ['开工项目', '未开工项目', '正常项目', '延期项目']
    		    },
    		 
    		    series: [
    		        {
    		            name: '访问来源',
    		            type: 'pie',
    		            selectedMode: 'single',
    		            radius: [0, '30%'],

    		            label: {
    		                position: 'inner',
    		               // backgroundColor: 'transparent',
    		                //borderColor: 'transparent ',
    		                textStyle:{fontSize:8}
    		            },
    		            labelLine: {
    		                show: false
    		            },
    		            data: [
    		          
    		                
    		            ]
    		        },
    		        {
    		            name: '访问来源',
    		            type: 'pie',
    		            radius: ['40%', '55%'],
    		            tooltip: {
    		            	textStyle:{
    		            		  fontSize: 1
    		            	}
    		            	
    		            },
    		            label: {
    		                formatter: '{b}:{c}{per|{d}%} ',
    		                backgroundColor: 'transparent',
    		                borderColor: '#aaa ',
    		                borderWidth: 1,
    		                borderRadius: 4,
    		                textStyle:{fontSize:8},
    		                // shadowBlur:3,
    		                // shadowOffsetX: 2,
    		                // shadowOffsetY: 2,
    		                // shadowColor: '#999',
    		                // padding: [0, 7],
    		                rich: {
    		                    a: {
    		                        color: '#999',
    		                        lineHeight: 22,
    		                        align: 'center'
    		                    },
    		                    // abg: {
    		                    //     backgroundColor: '#333',
    		                    //     width: '100%',
    		                    //     align: 'right',
    		                    //     height: 22,
    		                    //     borderRadius: [4, 4, 0, 0]
    		                    // },
    		                    hr: {
    		                        borderColor: '#aaa',
    		                        width: '100%',
    		                        borderWidth: 0.5,
    		                        height: 0
    		                    },
    		                    b: {
    		                        fontSize: 10,
    		                        lineHeight: 33
    		                    },
    		                    per: {
    		                        color: '#eee',
    		                        fontSize: 8,
    		                        backgroundColor: 'transparent',
    		                        padding: [2, 4],
    		                        borderRadius: 2
    		                    }
    		                }
    		            },
		                  
    		            data: [
    		            
    		           
    		            ]
    		        }
    		    ]
    		};
      
    
    
      
      //产业项目
       cyoption = {
    		    tooltip: {
    		    	 backgroundColor: 'rgba(0,0,0,0)',
    		        trigger: 'item',
    		        formatter: '{b}: {c} ({d}%)'
    		    },
    		    legend: {
    		        orient: 'vertical',
    		        right: -5,
    		        itemWidth: 15, 
    		        itemHeight: 10,
    		        textStyle:{
    		        	color:'#4f9de3',
    		        	fontSize: 10
    		        },
    		        data: ['开工项目', '未开工项目', '正常项目', '延期项目']
    		    },
    		 
    		    series: [
    		        {
    		            name: '访问来源',
    		            type: 'pie',
    		            selectedMode: 'single',
    		            radius: [0, '30%'],

    		            label: {
    		                position: 'inner',
    		                textStyle:{fontSize:8}
    		            },
    		            labelLine: {
    		                show: false
    		            },
    		            data: [
    		                
    		                
    		            ]
    		        },
    		        {
    		            name: '访问来源',
    		            type: 'pie',
    		            radius: ['40%', '55%'],
    		            tooltip: {
    		            	textStyle:{
    		            		  fontSize: 1
    		            	}
    		            	
    		            },
    		            label: {
    		                formatter: '{b}:{c}{per|{d}%} ',
    		                backgroundColor: 'transparent',
    		                borderColor: '#aaa ',
    		                borderWidth: 1,
    		                borderRadius: 4,
    		                textStyle:{fontSize:8},
    		                // shadowBlur:3,
    		                // shadowOffsetX: 2,
    		                // shadowOffsetY: 2,
    		                // shadowColor: '#999',
    		                // padding: [0, 7],
    		                rich: {
    		                    a: {
    		                        color: '#999',
    		                        lineHeight: 22,
    		                        align: 'center'
    		                    },
    		                    // abg: {
    		                    //     backgroundColor: '#333',
    		                    //     width: '100%',
    		                    //     align: 'right',
    		                    //     height: 22,
    		                    //     borderRadius: [4, 4, 0, 0]
    		                    // },
    		                    hr: {
    		                        borderColor: '#aaa',
    		                        width: '100%',
    		                        borderWidth: 0.5,
    		                        height: 0
    		                    },
    		                    b: {
    		                        fontSize: 10,
    		                        lineHeight: 33
    		                    },
    		                    per: {
    		                        color: '#eee',
    		                        fontSize: 8,
    		                        backgroundColor: 'transparent',
    		                        padding: [2, 4],
    		                        borderRadius: 2
    		                    }
    		                }
    		            },
		                  
    		            data: [
    		              
    		           
    		            ]
    		        }
    		    ]
    		};
      
   	//初始化echarts实例
       var myChartcjxm= echarts.init(document.getElementById('xmxx_pie'));
   	
     //初始化echarts实例
       var myChartcyxm= echarts.init(document.getElementById('xmxx_pie2')); 
    	    $.ajax({
    	        url:basePath + "zk/BigDataVies/findXXBZT.ajax",
    	        dataType: 'json',
    	        async: true,
    	        type:'get',
    	        jsonp: 'callback',
    	        success : function(data) {
    	        	var mydata=data.data;
    
    	            cjoption.series[0].data=mydata.kglist;
    	            cjoption.series[1].data=mydata.yqlist;
    	        	  //使用制定的配置项和数据显示图表
    	            myChartcjxm.setOption(cjoption);
    	        
    	            cyoption.series[0].data=mydata.cykglist;
    	            cyoption.series[1].data=mydata.cyyqlist;
    	            //使用制定的配置项和数据显示图表
    	           myChartcyxm.setOption(cyoption); 

    	        	var content= "<span style=\"color:#00ebfb\">"+mydata.xmlx[0]+"：<span>"+mydata.xmzs[0]+"个";
    	        	$("#xmxx_cj").html(content);
    	        	   content= "<span style=\"color:#00ebfb\">"+mydata.xmlx[1]+"：<span>"+mydata.xmzs[1]+"个";
    	        	$("#xmxx_cy").html(content);
    	            
    	        
    			     
    	        },
    	        error : function(html) {
    	        }
    	    });
    	    
    
    	
    
    // 招商投资 饼状图
   
    
    //初始化echarts实例
    var myChartZSTZ = echarts.init(document.getElementById('zstz_pie'));
    //使用制定的配置项和数据显示图表
   //myChartfour.setOption(option5);
    
    //获取招商投资饼状图
 
     $.ajax({
        url:basePath + "zk/BigDataVies/findZSTZ.ajax",
        dataType: 'json',
        async: true,
        type:'get',
        jsonp: 'callback',
        success : function(data) {
        	var mydata=data.data;
        	
        	var option5 = {
        	        color: ["#07e3f4", "#f9b100"],
        	        tooltip: {
        	            trigger: 'item',
        	            formatter: '{b} : {c} ({d}%)'
        	        },
        	        legend: {
        	            data: ['内资', '外资'],
        	            icon: "circle",
        	            itemHeight: 10,
        	            itemWidth: 10,
        	            right: 10,
        	            top: "38%",
        	            bottom: 20,
        	            height: 80,
        	            width:30,
        	            textStyle: {
        	                color: "#fff",
        	                fontSize: 12
        	            },
        	            formatter: function(name) {
        	                var index = 0;
        	                var clientlabels = ['内资', '外资'];
        	               var clientcounts = mydata.nums;
        	              
        	               
        	                clientlabels.forEach(function(value,i){
        	                    if(value == name){
        	                        index = i;
        	                    }
        	                });
        	                return name + "  " + clientcounts[index];
        	            }
        	        },
        	        series: [
        	            {
        	                name: '管控率',
        	                type: 'gauge',
        	                center: ['35%', '50%'],
        	                radius: '59%',
        	                startAngle: 314,
        	                endAngle: -45,
        	                min: 0,
        	                max: 100,
        	                axisLine: {
        	                    show: true,
        	                    lineStyle: {
        	                        width: 1,
        	                        color: [
        	                            [
        	                                100 / 100, new echarts.graphic.LinearGradient(
        	                                0, 0, 1, 0, [{
        	                                    offset: 0,
        	                                    color: '#0041c2'
        	                                },
        	                                    {
        	                                        offset: 1,
        	                                        color: '#0041c2'
        	                                    }
        	                                ]
        	                            )
        	                            ],
        	                            [
        	                                1, '#0041c2'
        	                            ]
        	                        ]
        	                    }
        	                },
        	                axisTick: {
        	                    show: 0
        	                },
        	                splitLine: {
        	                    show: 0
        	                },
        	                axisLabel: {
        	                    show: 0
        	                },
        	                pointer: {
        	                    show: 0
        	                },
        	                detail: {
        	                    show: 0
        	                },
        	                data: [{
        	                    value: 100
        	                }]
        	            },
        	            {
        	                type: 'pie',
        	                radius: [10, 47],
        	                center: ['35%', '50%'],
        	                roseType: 'radius',
        	                label: {
        	                    show: false
        	                },
        	                emphasis: {
        	                    label: {
        	                        show: true
        	                    }
        	                },
        	                data:[]
        	                
        	            }
        	        ]
        	    }
        	
        	//var guestJsonArray = new Array();
        	var arr=mydata.arr;
        	//guestJsonArray.push(arr);	
           option5.series[1].data=mydata.arr; 
          //使用制定的配置项和数据显示图表
            myChartZSTZ.setOption(option5);
        },
        error : function(html) {
        }
    });
  
    //招商投资横向柱状图
     //初始化echarts实例
    var myChartZZT = echarts.init(document.getElementById('zstz_line'));
    //初始化数据

    var optionZZT = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: {
        	show : false,
            type: 'value',
            axisLine: {
                show: false
            },
            axisTick: {
                show: false
            }
        },
        yAxis: {
        	show : true,
            type: 'category',
            data: [],
            splitLine: {show: false},
            axisLabel: {
                show: true,
                textStyle: {
                    color: '#00ffff'
                }
            },

            axisLine: {
                show: false
            },
            axisTick: {
                show: false
            },
            offset: 10,
            nameTextStyle: {
                fontSize: 15,
                
            }
        },
        series: [
            {
                name: '数量',
                type: 'bar',
                data: [],
                barWidth: 14,
                barGap: 10,
                smooth: true,
                label: {
                    normal: {
                        show: true,
                        position: 'right',
                        offset: [5, -2],
                        textStyle: {
                            color: '#00ffff',//#00ffff
                            fontSize: 13
                        }
                    }
                },
                itemStyle: {
                    emphasis: {
                        barBorderRadius: 7
                    },
                    normal: {
                        barBorderRadius: 7,
                        color: new echarts.graphic.LinearGradient(
                            0, 0, 1, 0,
                            [
                                {offset: 0, color: '#3977E6'},
                                {offset: 1, color: '#37BBF8'}

                            ]
                        )
                    }
                }
            }
        ]
    };
   // myChartZZT.setOption(optionZZT);

    //招商横向柱状图请求
    $.ajax({
        url:basePath + "zk/BigDataVies/findHXZZT.ajax",
        dataType: 'json',
        async: true,
        type:'get',
        jsonp: 'callback',
        success : function(data) {
        var mydata =data.data;
        
        //给大圆柱赋值
        var cont="<div style=\"margin-left:9px;margin-top:4px ;color: #00ffff\">"+mydata.tmoney+"</div>"
        
         $("#dqtzje").html(cont);
         $("#ndjhtze").html(mydata.pmoney);
        optionZZT.yAxis.data=mydata.category;
        optionZZT.series[0].data=mydata.barData;	
        myChartZZT.setOption(optionZZT);   
        },
        error : function(html) {
        }
    });
  
    
  
    
    
    
  //获取热点要闻的数据
    $.ajax({
        url:basePath + "zk/BigDataVies/findNewsHot.ajax",
        dataType: 'json',
        async: true,
        type:'get',
        jsonp: 'callback',
        success : function(data) {
        
        	var content="";
        
             var res=data.data;
        	 for (var i = 0; i < res.length; i++){
        		 var isimg="";
        		 if(res[i].isimg==true){
                	 isimg+="<img src=\"<%=basePath %>dataview/img/hot.png\" >";
     
                 }
                 content+="<li><img src=\"<%=basePath %>dataview/img/sm_circle.png\" />"+res[i].title+
                 isimg+"</li>";
             
        	 }
        	
        	 $("#rdywlist").html(content);
           
        },
        error : function(html) {
        }
    });
  
  
    //人员搜索
   var value="";
    $("#searchContent").bind('input propertychange', function() {
    	value=$("#searchContent").val();
    	 findRYLB(value);
   })
   
  
  //获得人员列表数据
 var speed = 100;
  function findRYLB(value){
	  var content="";
	 
    $.ajax({
        url:basePath + "zk/BigDataVies/findRYLB.ajax?value="+value,
        dataType: 'json',
        async: true,
        type:'get',
        jsonp: 'callback',
        success : function(data) {
             var res=data.data;
        	 for (var i = 0; i < res.length; i++){
        		content+=" <tr> <td style=\"width: 18%;\">"+res[i].name+"</td><td style=\"width: 23%;\">"+res[i].postname+"</td><td style=\"width: 19%;\">"+res[i].phone+"</td><td>"+res[i].sex+"</td><td style=\"width: 20%;\">"+res[i].age+"</td> </tr>";
             
        	 }	
        	 $("#rylblist").html(content);
 		     if(value!=''){
        	  if(parseInt($('#demo div').get(0).offsetHeight)>152){
        		 // $('#demo div').style.overflow=auto;
        		 $("#demo").css("overflow","auto");
    		   }
         }else{
        	 $("#demo").css("overflow","hidden");
        	
        }
        
        },
        error : function(html) {
        }
    });
    }
  
    findRYLB(value);
     var mytop1='';
     var mytop2='';
     var i=0;
      var flag=false;
	function Marquee() {
		i=i+1;
		if (demo2.offsetTop - demo.scrollTop <= 0) {
			demo.scrollTop -= demo1.offsetHeight;
		} else {
	
			 mytop1=  document.getElementById("demo").scrollTop	  
			document.getElementById("demo").scrollTop=i;
			 mytop2=document.getElementById("demo").scrollTop;

			if(mytop2!=0&&mytop2==mytop1&&mytop2%10!=0){
				i=0;
			}
			
		}
	}
	var MyMar = setInterval(Marquee, speed);
	
	demo.onmouseover = function() {
		clearInterval(MyMar);
	}
	
	demo.onmouseout = function() {
		//alert("鼠标移开")
		MyMar = setInterval(Marquee, speed);
	}
    
    //星期几
    
    var week;
	if(new Date().getDay()==0) week="星期日"
	if(new Date().getDay()==1) week="星期一"
	if(new Date().getDay()==2) week="星期二"
	if(new Date().getDay()==3) week="星期三"
	if(new Date().getDay()==4) week="星期四"
	if(new Date().getDay()==5) week="星期五"
	if(new Date().getDay()==6) week="星期六"
	
	//从服务器上获取初始时间 。+"   "+week
	var currentDate = new Date(<%=new java.util.Date().getTime()%>);
	function run()
	{
	currentDate.setSeconds(currentDate.getSeconds()+1);
	currentDate.toLocaleString().s
	document.getElementById("currentdate").innerHTML =new Date().getFullYear()+"年   "+(new Date().getMonth()+1)+"月   "+new Date().getDate()+"日 "+currentDate.toLocaleString().substring(12, 20);
	}
	window.setInterval("run();", 1000);

	
	


  
	
  
</script>
</body>


</html>
