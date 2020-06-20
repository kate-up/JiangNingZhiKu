<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="aweto"  uri="http://wwww.aweto-framework.org/taglibs/AwetoTag" %>
<html>
<head>
    <title>江宁智库大屏</title>
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/bootstrap-3.3.4.css">
    
	<script language="javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=acedaa71c0c42e595703f11207a93b89&plugin=Map3D,AMap.DistrictSearch,AMap.MarkerClusterer"></script>
    <script type="text/javascript" src="<%=basePath %>dataview/js/echarts.min.js"></script>
    <script src="<%=basePath %>dataview/js/jquery-1.8.3.min.js"></script>
	<script src="<%=basePath %>dataview/js/jquery.min.js"></script>
	<script src="<%=basePath %>dataview/js/bootstrap.min.js"></script>
    <script src="<%=basePath %>dataview/js/highcharts.js"></script>
    <script src="<%=basePath %>dataview/js/highcharts-3d.js"></script>
    <script src="<%=basePath %>aweto/aweto-2.0.js"></script>
    <style>
        body{
            font-size:1vw;
        }
        div,li,ul {
            margin:0;
            padding:0;
        }
        ul li {
            list-style:none;
        }
		a{
			text-decoration:none !important;
			cursor: pointer;
		}

        .Companies {
            position:relative;
			padding-left: 1.5vh
        }
        .Companies ul {
            position:relative;
			height:8vh;
            width:100%;
            overflow-y:auto;
            border:1px solid #DDD;
            display:none;
        }
        .Companies ul li {
            padding:3px 12px;
        }
        .Companies ul li:hover {
            background-color:#bebebe;
            cursor:pointer;
        }
        .Companies ul li.top {
            position:absolute;
            top:0;
        }
		
		.groupid {
			position:relative;
			height:10vh;
            width:100%;
            overflow-y:auto;
            display:none;
		}
		.groupid li {
			padding:3px 2vh;
		}
		.groupid li:hover {
            cursor:pointer;
		}
		.groupid li.top {
            position:absolute;
            top:0;
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
        #container {
            position: absolute;
            width: 100%;
            height: 100%;
            z-index: 0;
            top: 0;
            right: 0;
            // background: url('<%=basePath %>dataview/img/base_bg0.png');
            background-size: 100% 100%;
        }
        .content {
            position: absolute;
            /* z-index: -1;  */
            width: 100%;
            height: 100%;
            // background: url('<%=basePath %>dataview/img/base_bg0.png') no-repeat ;
            background-size: 100% 100%;
            overflow:hidden;
        }
        .tabbar {
            width: 100%;
            padding: 0%;
            /* background: url('<%=basePath %>dataview/img/title_bg.png') no-repeat; */
            /* background-size: 100% 100%; */
            display: flex;
            justify-content: space-around;
        }
        .tabbar li {
            font-size:1.7vh;
            width: 22%;
            height:4vh;
            cursor: pointer;
            white-space: nowrap;
            background: url('<%=basePath %>dataview/img/smtitlebg.png') no-repeat;
            background-size: 100% 100%;
            z-index: 10;
            text-align: center;
        }
        .tabbar li div {
            line-height: 4vh;
            font-weight: bold;
            color: #00ebfb;
        }
        .tabbarAct, .sm_tit, .searchTit {
            background-image: -webkit-linear-gradient(top,#eacd93,#eb9d47);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            color: #eb9d47;
        }
        .details {
            height: 100%;
            display: flex;
            justify-content: space-between;
        }
        .details > div:nth-child(odd) {
            width: 28%;
            z-index: 10;
        }
        .details > div:nth-child(even) {
            width: 44%;
        }
        /* .left_cont > div {
            height: 32%;
            margin: 0 3% 2.5% 0;
        } */
        .zxfx {
            height: 32%;
            margin: 0 3% 2.5% 0;
            /* background: url('<%=basePath %>dataview/img/box.png'); */
            background: url('<%=basePath %>dataview/img/zxfxbox.png');
            background-size: 100% 100%;
        }
        .sm_tit {
            display: flex;
            font-weight: bold;
            font-size: 1.2vw;
            padding: 1vh 0 1vh 2vh;
            height:15%;
        }
        .sm_tit img {
            padding: 0;
            width: 7vw;
            height: 2.3vh;
            margin: 0.7vh;
        }
        .zxfx_tab {
            display: flex;
            justify-content: space-around;
            font-size: 1.7vh;
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
		.zxfx_ulli {
            display: flex;
            justify-content: space-between;
            width: 100%;
            font-size:1.5vh;
            padding: 3% 0;
            margin: 2% 0;
            border: 1px solid #0a43bb;
            background: rgba(15, 61, 122, 0.3);
            white-space: nowrap;
			justify-content: space-around;
        }
        .zxfx_ul li > div {
            display: flex;
            width: 33%;
			justify-content:space-between;
        }
        .zxfx_ul li > div > div:nth-child(odd) {
            width: 55%;
            text-align: center;
            color: #00ebfb;
        }
        .zxfx_ul li > div > div:nth-child(even) {
            width: fit-content;
			min-width: 40%;
            padding: 0 5px;
            text-align: center;
            background: rgba(13, 64, 154, 0.7);
            border: 1px solid #0a43bb;
			    margin-right: 1vh;
        }
        .fzr {
            padding: 0 !important;
            background: none !important;
            border: none !important;
        }
        .fzr img {
            height: 0.6vh;
            margin: 0 1vh 0.4vh 0;
        }
        .rylb {
            position: absolute;
            bottom: 0.9%;
            height: 30.3%;
            width: 44%;
        }
        .rdyw  {
            height: 32%;
            margin: 0 3% 2.5% 0;
            background: url('<%=basePath %>dataview/img/rdywbox.png');
            background-size: 100% 100%;
        }
        .rylb {
            background: url('<%=basePath %>dataview/img/zstzbox.png');
            background-size: 100% 100%;
        }
        .rdyw_ul {
            padding-left: 2%;
            padding-right: 2%;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            height: 80%;
        }
        .rdyw_ul li {
            font-size: 1.5vh;
            line-height: 2vh;
            white-space: nowrap;
            width: 100%;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .rdyw_ul li img:nth-child(1) {
            vertical-align: middle;
            width:0.4vh;
            margin: 0 1vh;
        }
        .rdyw_ul li img:nth-child(2) {
            vertical-align: middle;
            width:2.9vh;
            margin: 0 1vh;
        }
        .sjzl {
            height: 32%;
            margin: 0 3% 0 0;
            background: url('<%=basePath %>dataview/img/sjzlbox.png');
            background-size: 100% 100%;
        }
        .sjzl_cont {
            display: flex;
            justify-content: space-around;
            padding: 0 2%;
            height: 80%;
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
            font-size:1.5vh;
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
			text-shadow: -1px 0px 7px #ace;
        }
        .sjzl_echart, .sjzl_left {
            border: 1px solid #0a43bb;
            background: rgba(15, 61, 122, 0.3);
        }
        .right_cont > div:nth-child(1) {
            height: 32.5%;
            margin: 0 0 2.5% 3%;
        }
        .right_cont > div:nth-child(2) {
            height: 65%;
            margin: 0 0 0 3%;
            background: url('<%=basePath %>dataview/img/gzlfzbox.png') no-repeat;
            background-size: 100% 100%;
			overflow:hidden;
        }
        .jjyx {
            white-space: nowrap;
            width: 100%;
            font-size:1.5vh;
        }
        .jjyx img {
            height:1vh;
            width:10vh;
            margin-top:0.5vh;
        }

        .gzlfz_text, .gzlfz_text0 {
            background-image: -webkit-linear-gradient(top,#01ffff,#01ffff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
			font-size:1.45vh;
        }
        .gzlfz_text0 {
            background-image: -webkit-linear-gradient(top,#eacd93,#eb9d47);
        }
        .vs_img {
            height: 0%;
			width:2h;
            height:2vh;
            margin: 0 1.5vh;
        }
        .zhiku, .rylb_tit_row input {
            background: transparent;
            border: 0;
            outline: none;
            font-size:1.2vh;
            width:10vw;
        }
        .zhiku::-webkit-input-placeholder{/*Webkit browsers*/
            color: #fff;
            font-size: 1.2vh;
        }
        .zhiku:-moz-placeholder{/*Mozilla Firefox 4 to 8*/
            color:#999;
            font-size: 1.2vh;
        }
        .zhiku::moz-placeholder{/*Mozilla Firefox 19+*/
            color:#999;
            font-size: 1.2vh;
        }
        .zhiku:-ms-input-placeholder{/*Internet Explorer 10+*/
            color:#999;
            font-size: 1.2vh;
        }
        .rylb_tit_row input::-webkit-input-placeholder{/*Webkit browsers*/
            color: #00ebfb;
            font-size:1.2vh;
        }
        .rylb_tit_row input:-moz-placeholder{/*Mozilla Firefox 4 to 8*/
            color:#00ebfb;
            font-size:1.2vh;
        }
        .rylb_tit_row input::moz-placeholder{/*Mozilla Firefox 19+*/
            color:#00ebfb;
            font-size:1.2vh;
        }
        .rylb_tit_row input:-ms-input-placeholder{/*Internet Explorer 10+*/
            color:#00ebfb;
            font-size:1.2vh;
        }
        .search_img, .rylb_tit_row img {
            height:100%;
            vertical-align: middle;
            cursor: pointer;
            margin:0 1vh;
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
            font-size: 1.8vh;
        }
        .rylb_tit_row {
            width: 15vw;
        }
        .rylb_tit_row img {
            margin-right: 5px;
        }
        .rylb_table {
            width: 100%;
            text-align: center;
            font-size: 1.2vh;
            height: 10%;
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
            background: -webkit-gradient(linear, left, right, color-stop(0%,rgba(0,0,0,0)), color-stop(100%,rgba(15, 61, 122, 0.9)));
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
            display: flex;
        }
        .not_seled {
            display: none;
        }
        .selecte0 {
            display: block;
            padding: 0 1vh;
        }
        .not_seled0 {
            visibility: hidden !important;
        }

        .info {
            color: #fff;
            font-size:1.2vh;
            text-align: center;
            padding: 0 20px;
        }

        .amap-info-content,
        .amap-info-outer {
            background: rgba(0, 0, 0, 0.5);
            overflow:hidden !important;
        }

        .bottom-center .amap-info-sharp {
            border-left: 8px solid transparent;
            border-right: 8px solid transparent;
            border-top: 8px solid rgba(0, 0, 0, 0.5);
        }
        .searchTit {
            font-weight: bold;
            font-size: 2.2vh;
        }
        #gzlfzdl {
            background-color:transparent;
            color:#00ebfb;
            border: 0;
            margin-top: -11px;
            font-size:2vh;
        }
        .zkbkserach{
            background-color:transparent;
            color:#00ebfb;
            border: 0;
            height:3vh;
			// /*隐藏默认小箭头*/
			// appearance: none;
			// -webkit-appearance: none;
			// -moz-appearance: none;
			// background: url("../images/no_select.png") no-repeat scroll right 5px center transparent;
        }

        .xmxxbt{
            width: 100%;
            height: 2%;
            text-align:center;
            margin-top: -9%;
            font-size: 1.8vh;
        }
        .xmxx {
            width: 100%;
            height: 80%;
            display: flex;
        }
        .hidescoll {
            width: 100%;
            height: 70%;
            overflow-y: auto;
            position: relative;
        }
        .hidescoll::-webkit-scrollbar {
            display: none;
        }

        .mask {
            position: absolute;
            top: 0;
            display: none;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .groupid{
            overflow-y:auto;
			height: 5vh;
            width:100%;
            position: relative;
        }
        #groupid::-webkit-scrollbar {
            dispaly:none;
        }
        .groupid::-webkit-scrollbar {
            dispaly:none;
        }
        .ycscroll{
            overflow-y: auto;
            position: relative;
            background: rgba(0,0,0,0.25);
            width:100%;z-index: 10;
            padding-top: 1vh;
        }
        .ycscroll::-webkit-scrollbar {
            dispaly:none;
        }

        #search02::-webkit-scrollbar {
            display: none;
        }

        #mybkdesc::-webkit-scrollbar {
            display: none;
        }
        #mybkdesc {
            font-size: 1.5vh;
            line-height: 3vh;
        }
        .ssjg ::-webkit-scrollbar {
            display: none;
        }
        .ssjgul {
            margin: 1vh 0 2vh 0;
            max-height: 36vh;
			overflow-y: auto;
        }
        .ssjgli {
            background: url('<%=basePath %>dataview/img/blueBox.png');
            padding: 1vh;
			overflow: scroll;
			max-height: 36vh;
        }
        .form-control{
            border: 1px solid #f4f0f005;
            font-size:1.5vh;
            height:100%;
            display:flex;
            background:rgba(0,0,0,0.25);
            color: white;
            width:100%;
        }
        select:focus{
            outline: none;
        }
	
        .amap-info-close {
            width:1.2vh;
            height:1.2vh;
        }
        .whichSech {
            background: rgba(255, 255, 255, 0.07);
            padding:1vh;
            z-index: 10;
            height: 5vh;
            font-size: 1.7vh;
        }
        .middle_one_con {
            width: 100%;
            height: 3vw;
            margin-top: 1vh;
        }
        #closeImg {
            position: absolute;
            top: 1.5vh;
            right: 3vh;
            width: 2.5vh;
            height: 2.5vh;
        }
        #ryxxbox {
            display:none;
            position: absolute;
            top: -20vh;
            right: 0;
            z-index: 1000;
            background: rgba(0,0,0,0.5);
            padding: 2vh;
            font-size: 1.8vh;
        }
        #search02 {
            display: none;
            width: 44%;
            height: 45.7%;
            overflow: auto;
            left: 28%;
            background: url(<%=basePath %>dataview/img/zstzbox.png);
            background-size: 100% 100%;
            z-index: 100;
            position: absolute;
            top: 22%;
        }
        #search02 > div {
            color: #fff; font-size: 2vh;padding:2vh 5vh 1vh 3vh;
        }
        .search02_img {
            width: 3vh;
            height: 3vh;
            vertical-align: middle;
            margin-right: 0.5vh;
        }
        #searchContent {
            width: 10vw;
        }

		.top_title {
                width: 100%;
                height: 8%;
                // background: url('<%=basePath %>dataview/img/title01.png');
                background-size: 100% 100%;
                display: flex;
                justify-content: space-between;
                z-index: 10;
				position:relative;
            }
			
            .top_title div {
                /* width: 30%; */
                height: 49%;
                text-align: center;
                line-height: 55px;
                font-size: 14px;
                z-index: 10;
            }
		.hyjc_img img {
			width: 75%;
			height:90%;
			margin-left: 12.5%;
		}
		.hyjc_img > div {
			width: 20%
		}
		
		
		// 高质量发展气泡样式
.circle_box {
	width: 100%;
	height: 3vh;
}
.circle_box > div {
	width:fit-content;
	height:fit-content;
}

.round:nth-child(1) {
	position: relative;
	padding: 1vh;
	left: 0;
	top: -3vh;
}
.round:nth-child(1) div {
	 background: radial-gradient(rgba(0,0,0,0),rgba(0.0,12,0.5), teal, indigo);
}
.round:nth-child(1) div:first-child {
	width: 8vh;
	height: 8vh;
}
.round:nth-child(1) div:first-child a {
	line-height: 8vh;
}
.round:nth-child(1) div:nth-child(2) {
	width: 9vh;
	height: 9vh;
}
.round:nth-child(1) div:last-child {
	width: 10vh;
	height: 10vh;
}

.round:nth-child(2) {
	position: absolute;
	left: 8vh;
	top: -2vh;
	padding: 1vh;
}
.round:nth-child(2) div {
	background:radial-gradient(rgba(0,0,0,0), #5aecd4);
}
.round:nth-child(2) div:first-child {
	width: 8vh;
	height: 8vh;
}
.round:nth-child(2) div:first-child a {
	line-height: 8vh;
}
.round:nth-child(2) div:nth-child(2) {
	width: 9vh;
	height: 9vh;
}
.round:nth-child(2) div:last-child {
	width: 10vh;
	height: 10vh;
}

.round:nth-child(3) {
	position: absolute;
	left: 17vh;
	top: -4vh;
	padding: 1vh;
}
.round:nth-child(3) div {
	background: #d67c61;
	background:radial-gradient(rgba(0,0,0,0), #51ecf4);
}
.round:nth-child(3) div:first-child {
	width: 9vh;
	height: 9vh;
}
.round:nth-child(3) div:first-child a {
	line-height: 9vh;
}
.round:nth-child(3) div:nth-child(2) {
	width: 10vh;
	height: 10vh;
}
.round:nth-child(3) div:last-child {
	width: 11vh;
	height: 11vh;
}

.round:nth-child(4) {
	position: absolute;
	left: 26vh;
	top: -2vh;
	padding: 1vh;
}
.round:nth-child(4) div {
	background: #307cc2;
	background:radial-gradient(rgba(0,0,0,0), #307cc2);
}
.round:nth-child(4) div:first-child {
	width: 9vh;
	height: 9vh;
}
.round:nth-child(4) div:first-child a {
	line-height: 9vh;
}
.round:nth-child(4) div:nth-child(2) {
	width: 10vh;
	height: 10vh;
}
.round:nth-child(4) div:last-child {
	width: 11vh;
	height: 11vh;
}

.round:nth-child(5) {
	position: absolute;
	left:37vh;
	top: -2vh;
	padding: 1vh;
}
.round:nth-child(5) div {
	background: radial-gradient(rgba(0,0,0,0),rgba(0.0,12,0.5), teal, indigo);
}
.round:nth-child(5) div:first-child {
	width: 8vh;
	height: 8vh;
}
.round:nth-child(5) div:first-child a {
	line-height: 8vh;
}
.round:nth-child(5) div:nth-child(2) {
	width: 9vh;
	height: 9vh;
}
.round:nth-child(5) div:last-child {
	width: 10vh;
	height: 10vh;
}

.round:nth-child(6) {
	position: absolute;
	left: 0;
	top: 6vh;
	padding: 1vh;
}
.round:nth-child(6) div {
	background: radial-gradient(rgba(0,0,0,0), #5aecd4);
}
.round:nth-child(6) div:first-child {
	width: 5vh;
	height: 5vh;
}
.round:nth-child(6) div:first-child a {
	line-height: 5vh;
}
.round:nth-child(6) div:nth-child(2) {
	width: 6vh;
	height: 6vh;
}
.round:nth-child(6) div:last-child {
	width: 7vh;
	height: 7vh;
}

.round:nth-child(7) {
	position: absolute;
	left: 7vh;
	top: 7vh;
	padding: 1vh;
}
.round:nth-child(7) div {
	background: radial-gradient(rgba(0,0,0,0), #aac);
}
.round:nth-child(7) div:first-child {
	width: 5vh;
	height: 5vh;
}
.round:nth-child(7) div:first-child a {
	line-height: 5vh;
}
.round:nth-child(7) div:nth-child(2) {
	width: 6vh;
	height: 6vh;
}
.round:nth-child(7) div:last-child {
	width: 7vh;
	height: 7vh;
}

.round:nth-child(8) {
	position: absolute;
	left: 14vh;
	top: 6vh;
	padding: 1vh;
}
.round:nth-child(8) div {
	background: radial-gradient(rgba(0,0,0,0), #4ad);
}
.round:nth-child(8) div:first-child {
	width: 5vh;
	height: 5vh;
}
.round:nth-child(8) div:first-child a {
	line-height: 5vh;
}
.round:nth-child(8) div:nth-child(2) {
	width: 6vh;
	height: 6vh;
}
.round:nth-child(8) div:last-child {
	width: 7vh;
	height: 7vh;
}

.round:nth-child(9) {
	position: absolute;
	left: 19vh;
	top: 8vh;
	padding: 1vh;
}
.round:nth-child(9) div {
	background: radial-gradient(rgba(0,0,0,0), #5ae);
}
.round:nth-child(9) div:first-child {
	width: 5vh;
	height: 5vh;
}
.round:nth-child(9) div:first-child a {
	line-height: 5vh;
}
.round:nth-child(9) div:nth-child(2) {
	width: 6vh;
	height: 6vh;
}
.round:nth-child(9) div:last-child {
	width: 7vh;
	height: 7vh;
}

.round:nth-child(10) {
	position: absolute;
	left: 23vh;
	top: 4vh;
	padding: 1vh;
}
.round:nth-child(10) div {
	background: radial-gradient(rgba(0,0,0,0), #faecaa);
}
.round:nth-child(10) div:first-child {
	width: 5vh;
	height: 5vh;
}
.round:nth-child(10) div:first-child a {
	line-height: 5vh;
}
.round:nth-child(10) div:nth-child(2) {
	width: 6vh;
	height: 6vh;
}
.round:nth-child(10) div:last-child {
	width: 7vh;
	height: 7vh;
}

.round:nth-child(11) {
	position: absolute;
	left: 29vh;
	top: 7vh;
	padding: 1vh;
}
.round:nth-child(11) div {
	background: radial-gradient(rgba(0,0,0,0), #aec);
}
.round:nth-child(11) div:first-child {
	width: 5vh;
	height: 5vh;
}
.round:nth-child(11) div:first-child a {
	line-height: 5vh;
}
.round:nth-child(11) div:nth-child(2) {
	width: 6vh;
	height: 6vh;
}
.round:nth-child(11) div:last-child {
	width: 7vh;
	height: 7vh;
}

.round:nth-child(12) {
	position: absolute;
	left: 35vh;
	top: 6vh;
	padding: 1vh;
}
.round:nth-child(12) div {
	background: radial-gradient(rgba(0,0,0,0), #7e4c4f);
}
.round:nth-child(12) div:first-child {
	width: 7vh;
	height: 7vh;
}
.round:nth-child(12) div:first-child a {
	line-height: 7vh;
}
.round:nth-child(12) div:nth-child(2) {
	width: 8vh;
	height: 8vh;
}
.round:nth-child(12) div:last-child {
	width: 9vh;
	height: 9vh;
}

.round:nth-child(13) {
	position: absolute;
	left: 44vh;
	top: 3vh;
	padding: 1vh;
}
.round:nth-child(13) div {
	background: radial-gradient(rgba(0,0,0,0),rgba(0.0,12,0.5), #aecead);
}
.round:nth-child(13) div:first-child {
	width: 6vh;
	height: 6vh;
}
.round:nth-child(13) div:first-child a {
	line-height: 6vh;
}
.round:nth-child(13) div:nth-child(2) {
	width: 7vh;
	height: 7vh;
}
.round:nth-child(13) div:last-child {
	width: 8vh;
	height: 8vh;
}

.round:nth-child(14) {
	position: absolute;
	left: 42vh;
	top: 10vh;
	padding: 1vh;
}
.round:nth-child(14) div {
	background: radial-gradient(rgba(0,0,0,0),rgba(0.0,12,0.5), teal,#1e539e);
}
.round:nth-child(14) div:first-child {
	width: 8vh;
	height: 8vh;
}
.round:nth-child(14) div:first-child a {
	line-height: 8vh;
}
.round:nth-child(14) div:nth-child(2) {
	width: 9vh;
	height: 9vh;
}
.round:nth-child(14) div:last-child {
	width: 10vh;
	height: 10vh;
}

.round:nth-child(15) {
	position: absolute;
	left: 3vh;
	top: 11vh;
	padding: 1vh;
}
.round:nth-child(15) div {
	background: radial-gradient(rgba(0,0,0,0),rgba(0.0,12,0.5), teal, indigo);
}
.round:nth-child(15) div:first-child {
	width: 6vh;
	height: 6vh;
}
.round:nth-child(15) div:first-child a {
	line-height: 6vh;
}
.round:nth-child(15) div:nth-child(2) {
	width: 7vh;
	height: 7vh;
}
.round:nth-child(15) div:last-child {
	width: 8vh;
	height: 8vh;
}

.round:nth-child(16) {
	position: absolute;
	left: 55vh;
	top: 6vh;
	padding: 1vh;
}
.round:nth-child(16) div {
	background: radial-gradient(rgba(0,0,0,0),rgba(0.0,12,0.5), teal, indigo);
}
.round:nth-child(16) div:first-child {
	width: 6vh;
	height: 6vh;
}
.round:nth-child(16) div:first-child a {
	line-height: 6vh;
}
.round:nth-child(16 ) div:nth-child(2) {
	width: 7vh;
	height: 7vh;
}
.round:nth-child(16) div:last-child {
	width: 8vh;
	height: 8vh;
}


.circle a {
	font-size: 18px;
	line-height: 100px;
	color: #000735;
	font-weight: bold;
	color: #fff;
	font-size:1vh;
}

.circle {
	background: #3a96e1;
	border-radius: 100%;
	width: 100px;
	height: 100px;
	width: 5vh;
	height: 5vh;
	text-align: center;
	top: 18px;
	left: 18px;
	position: absolute;
	cursor:pointer;
}

.circle_bottom {
	background: rgba(58, 150, 225, 0.4);
	border-radius: 100%;
	width: 100px;
	height: 100px;
	filter: alpha(opacity=40);
	z-index: -100;
	position: absolute;
	top: 0;
	left: 0;
}

.circle_bottom2 {
	background: rgba(58, 150, 225, 0.2);
	border-radius: 100%;
	width: 110px;
	height: 110px;
	filter: alpha(opacity=20);
	z-index: -110;
	position: relative;
	top: -1.5vh;
	left: -1.5vh;
}

.animation {
	-webkit-animation: twinkling 2.1s infinite ease-in-out;
	animation: twinkling 2.1s infinite ease-in-out;
	-webkit-animation-fill-mode: both;
	animation-fill-mode: both;
}

.animation2 {
	-webkit-animation: twinkling 2.1s infinite ease-in-out;
	animation: twinkling 2.1s infinite ease-in-out;
	-webkit-animation-fill-mode: both;
	animation-fill-mode: both;
}

@-webkit-keyframes twinkling {
	0% {
		opacity: 0.2;
		filter: alpha(opacity=20);
		-webkit-transform: scale(1);
	}

	50% {
		opacity: 0.5;
		filter: alpha(opacity=50);
		-webkit-transform: scale(1.12);
	}

	100% {
		opacity: 0.2;
		filter: alpha(opacity=20);
		-webkit-transform: scale(1);
	}
}

@keyframes twinkling {
	0% {
		opacity: 0.2;
		filter: alpha(opacity=20);
		-webkit-transform: scale(1);
	}

	50% {
		opacity: 0.5;
		filter: alpha(opacity=50);
		-webkit-transform: scale(1.12);
	}

	100% {
		opacity: 0.2;
		filter: alpha(opacity=20);
		-webkit-transform: scale(1);
	}
}
.dropdown-menu > li > a:hover, .dropdown-menu > li > a:focus{
background: transparent;
text-shadow: 0px 1px 6px #fff;
}
    </style>
</head>

<body >
<div class="content">
	<div id="top_title" class="top_title">
	  <img style="background: rgba(0,0,0,0.6);width: 100%; height: 100%;z-index: 10;" src="<%=basePath %>dataview/img/bigtitbg.png" alt="">
	  <div style="position:absolute;width:100%;text-align:center;height: 100%;font-size:3vh;text-shadow: 5px 3px 6px #ace;">江宁智库</div>
	</div>
    <div id="details" class="details">
        <div class="left_cont">
            <div class="zxfx">
                <div class="sm_tit"><div style="font-size: 1.2vw;">政效分析</div><img src="<%=basePath %>dataview/img/xiexian.png" alt=""></div>
                <div style="padding: 0 2%; height: 85%;">
                    <ul id="tabbar" class="zxfx_tab">
                        <li class="zxfx_act">今日大厅</li>
                        <li>工单12345</li>
                        <li>预审待办</li>
                    </ul>
                    <div id="content" style="height: 85%;">
                        <ul class="zxfx_ul selecte" style="height: 100%;flex-direction: column; justify-content: space-around;">
                            <li class="zxfx_ulli">
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
                            <li class="zxfx_ulli">
                                <div>
                                    <div>本月叫号峰值</div>
                                    <div>195人次</div>
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
                            <li class="zxfx_ulli" style="justify-content:space-between;">
                                <div style="width:50%;">
                                    <div>本月累计</div>
                                    <div>163人次</div>
                                </div>
                                <div style="width:50%;">
                                    <div>本年累计</div>
                                    <div>1058人次</div>
                                </div>
                            </li>
                        </ul>
                        <ul class="zxfx_ul not_seled" style="height: 100%; flex-direction: column; justify-content: space-around;">
                            <li class="zxfx_ulli">
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
                            <li class="zxfx_ulli">
                                <div style="width:50%;">
                                    <div>及时签收率</div>
                                    <div>78%</div>
                                </div>
                                <div style="width:50%;">
                                    <div>综合满意率</div>
                                    <div>64%</div>
                                </div>
                            </li>
                            <li class="zxfx_ulli">
                                <div style="width:50%;">
                                    <div>本月累计</div>
                                    <div class="word_red">113单</div>
                                </div>
                                <div style="width:50%;">
                                    <div>本年累计</div>
                                    <div class="word_red">2024单</div>
                                </div>
                            </li>
                        </ul>
                        <ul class="zxfx_ul not_seled" style="height: 100%; flex-direction: column; justify-content: space-around;">
                            <li class="zxfx_ulli">
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
                            <li class="zxfx_ulli" style="justify-content: space-between;" >
                                <div style="width:50%;">
                                    <div>已通过项目</div>
                                    <div>78%</div>
                                </div>
                                <div style="width:50%;">
                                    <div>综合满意率</div>
                                    <div>64%</div>
                                </div>
                            </li>
                            <li class="zxfx_ulli" style="justify-content: space-between;">
                                <div style="width:50%;">
                                    <div>平均处理周期</div>
                                    <div class="word_red">113单</div>
                                </div>
                                <div style="width:50%;">
                                    <div>本年累计</div>
                                    <div class="word_red">2024件</div>
                                </div>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
            <div class="rdyw">
                <div class="sm_tit"><div>热点要闻</div><img src="<%=basePath %>dataview/img/xiexian.png" alt=""></div>
                <ul class="rdyw_ul" id="rdywlist"></ul>
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
						<div style="text-align:center;width:100%;height:6%;padding-top:2%;color: #00ebfb">本月新增数据统计</div>
                        <div id="allnum" style="width: 100%; height: 90%;padding-top:4%;"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="middle_cont">
            <div class="middle_one_con">
                <ul id="ulList" class="tabbar" >
                    <li ><div class="tabbarAct">人员信息</div></li>
                    <li><div>项目信息</div></li>
                    <li><div>环境监测</div></li>
                    <li><div>招商投资</div></li>
                </ul>
            </div>
            <div id="search01" style="display: block;">
                <div style="display: flex; margin: 1vh auto 0;width: 46%;font-size: 1.2vh;">
                    <div class="whichSech" style="width:fit-content;">
                        <div class="dropdown" style="width:5vh;">
							<button onclick="showselect()" class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="true" style="font-size:1.7vh;background:transparent;color: #00ebfb;border:none;">
								搜索
								<!-- <span class="caret"></span> -->
							</button>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenu1" id="selectmenu" style="width:fit-content;z-index:1000;dispaly:block !important;font-size:1.7vh;background:transparent;color: #00ebfb;">
								<li><a href="javascript:void(0);" rel="external nofollow" id="sousuoa" rel="external nofollow"
										onclick="js_method0()" style="color: #00ebfb;width:fit-content !important;white-space: nowrap;">搜索</a></li>
								<li><a href="javascript:void(0);" rel="external nofollow" id="sousuob" rel="external nofollow"
										onclick="js_method1()" style="color: #00ebfb;width:fit-content;!important;white-space: nowrap;">百科</a></li>
							</ul>
						</div>
                    </div>
                    <div class="ycscroll">
                        <div id="Companies" class="Companies" style="display:flex" >
                            <input   class=" form-control "  type="text"  id="js-groupId" placeholder="请输入关键词">
                            <img id="zk_search" class="search_img" src="<%=basePath %>dataview/img/search.png" alt="">
                        </div>
                        <ul id="groupid" class="groupid"></ul>
                    </div>
                </div>
                <div id="search02">
                    <div>
                        <img class="search02_img" src="<%=basePath %>dataview/img/result.png" alt="">
                        <span class="info_title" style="line-height:18px;">搜索结果</span>
                        <img id="closeImg" src="<%=basePath %>dataview/img/close.png" alt="">
                        <ul id="bkSearchContent" class="ssjg ssjgul">
                            <li class="ssjg ssjgli">
                                <p class="searchTit" id="mybktitle"></p>
                                <div id="mybkdesc"></div>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
            <%--地图--%>
            <div id="container"></div>
            <div id="mid_cont" >
                <div class="rylb selecte0" >
                    <div id="ryxxbox"></div>
                    <div class="sm_tit"><div>人员列表</div><img src="<%=basePath %>dataview/img/xiexian.png" alt="" ></div>
                    <div class="rylb_tit_row">
                        <img id="rylb_sear" src="<%=basePath %>dataview/img/search0.png" alt="">
                        <input type="text" id="searchContent" placeholder="请输入姓名或职位" >
                    </div>
                    <table class="rylb_table" >
                        <thead>
                        <tr style="width: 100%;">
                            <td style="width: 15%;">姓名</td>
                            <td style="width: 45%;">职位</td>
                            <td style="width: 20%;">电话</td>
                            <td style="width: 10%;">性别</td>
                            <td style="width: 10%;">年龄</td>
                        </tr>
                        </thead>
                    </table>
                    <div class="hidescoll">
                        <table class="rylb_table">
                            <tbody id="thbody" ></tbody>
                        </table>
                    </div>
                </div>
                <div class="rylb not_seled0" >
                    <div class="sm_tit" style="padding-left:1%">
                        <div>项目信息</div>
                        <img src="<%=basePath %>dataview/img/xiexian.png" alt="">
                    </div>
                    <div class="hjjc_unit">数量：个</div>
                    <div class="xmxx">
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
						<div class="hyjc_img" style="display:flex;justify-content:space-around;height:100%;  margin-bottom: 2%;">
							<div style='background: url(<%=basePath%>dataview/img/jcdzs1.png) no-repeat; background-size: 80% 100%; background-position: top center;'>
								<div style='background: url(<%=basePath%>dataview/img/zhudi.png) no-repeat; background-size: 80% 10%; background-position: bottom center;width: 100%; height:100%;'> </div>
							</div>
							<div style='background: url(<%=basePath%>dataview/img/szdzs1.png) no-repeat; background-size: 80% 100%; background-position: top center;'>
								<div style='background: url(<%=basePath%>dataview/img/zhudi.png) no-repeat; background-size: 80% 30%; background-position: bottom center;width: 100%; height:100%;'></div>
							</div>
							<div style='background: url(<%=basePath%>dataview/img/wzdzs1.png) no-repeat; background-size: 80% 100%; background-position: top center;'>
								<div style='background: url(<%=basePath%>dataview/img/zhudi.png) no-repeat; background-size: 80% 50%; background-position: bottom center;width: 100%; height:100%;'></div>
							</div>
							<div style='background: url(<%=basePath%>dataview/img/szdyc1.png) no-repeat; background-size: 80% 100%; background-position: top center;'>
								<div style='background: url(<%=basePath%>dataview/img/zhudi.png) no-repeat; background-size: 70% 12%; background-position: bottom center;width: 100%; height:100%;'></div>
							</div>
							<div style='background: url(<%=basePath%>dataview/img/wzdyc1.png) no-repeat; background-size: 80% 100%; background-position: bottom center;'>
								<div style='background: url(<%=basePath%>dataview/img/zhudi.png) no-repeat; background-size: 80% 2%; background-position: bottom center;width: 100%; height:100%;'></div>
							</div>
						</div>
                    </div>
                </div>
                <div class="rylb not_seled0">
                    <div class="sm_tit"><div>招商投资</div><img src="<%=basePath %>dataview/img/xiexian.png" alt=""></div>
                    <div style="display:flex;height: 15%;letter-spacing: 2px;">
                        <div id="ndjhtze" style="width:50%;text-align:center;padding-top:1vh;font-size:2vh;"> </div>
                        <div id="dqtzje" style="background:url(<%=basePath %>dataview/img/zstzyz.png) no-repeat;background-size: 100% 100%;width: 50%;text-align:center;font-size:2vh;" ></div>
                    </div>
                    <div style="width: 100%; height: 70%;padding: 3px 5px 0;display: flex;justify-content: space-around;">
                        <div id="zstz_pie" style="width: 50%; height: 100%;"></div>
                        <div id="zstz_line" style="width: 50%; height: 100%;"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="right_cont">
            <div class="zxfx">
                <div class="sm_tit"><div>经济运行</div><img src="<%=basePath %>dataview/img/xiexian.png" alt=""></div>
                <div style="padding: 0 2%; height: 100%;">
                    <div class="jjyx"><div style="margin: auto;width: fit-content;display:flex;justify-content:space-around;" id="jjyxbt"></div></div>
                    <div id="jjyx_echart" style="width: 100%; height: 75%;"></div>
                </div>
            </div>
            <div class="sjzl">
                <div style="display:flex">
                    <div class="sm_tit"><div>高质量发展</div><img src="<%=basePath %>dataview/img/xiexian.png" alt=""></div>
					<div style="display: flex;width: fit-content;margin: 5% auto;">
                        <div class="gzlfz_text">江宁</div>
                        <img class="vs_img" src="<%=basePath %>dataview/img/vs.png" alt="">
						<div class="gzlfz_text0" id='gzl_sele_html'>南京</div>
                        <%--<select class="gzlfz_text0" id="gzlfzname" style="border: 0;font-size: 1vh;width: fit-content;"></select>--%>
                    </div>
                </div>
				

	<div id='select_id' class="circle_box" style="position: relative !important;z-index:10000;"></div>			
				
                <%--<div style="font-size: 1.5vh;font-weight: bold;text-align: center;">
                    <div style="display: flex;width: fit-content;margin: 5% auto;" >
                        <select id="gzlfzdl" style=" border: 0;"></select>
                    </div>
                </div>--%>
                <div id="gzlfz_chart" style="width: 100%; height: 78%;"></div>
            </div>
        </div>
    </div>
</div>


<script language="javascript">

	
$("#dropdownMenu1").on('click',function(){
    $('.dropdown-toggle').dropdown();
});
	function js_method0() {
        document.getElementById("dropdownMenu1").innerHTML = "搜索"
    }

    function js_method1() {
        document.getElementById("dropdownMenu1").innerHTML = "百科"
    }
	
	function showselect (){
		document.getElementById("selectmenu").style.dispaly = "block"
	}


    function filterList(list) {
        $('#js-groupId').bind('input propertychange', function() {
            var filter = $(this).val();
            if (filter) {
                $matches = $(list).find('a:Contains(' + filter + ')').parent();
                $('li', list).not($matches).slideUp();
                $matches.slideDown();
            } else {
                $(list).find("li").slideDown();
            }
        });
    }
    $(function() {
        filterList($("#groupid"));
        $('#js-groupId').bind('focus', function() {
            $('#groupid').slideDown();
        }).bind('blur', function() {
            $('#groupid').slideUp();
        })
        $('#groupid').on('click', 'li', function() {
            $('#js-groupId').val($(this).text())
            $('#groupId').val($(this).data('id'))
            $('#groupid').slideUp()
        });
    })

	// 判断屏幕分辨率是否展示头部
	if(screen.width > 7600) {
		document.getElementById("top_title").style.display = "none"
		document.getElementById("details").style.height = "100%"
		document.getElementById("zk_search").style.width = "2.5vh"
		document.getElementById("rylb_sear").style.width = "2vh"
		document.getElementById("Companies").style.paddingTop = "0.5vh"
		// document.getElementById("zk").style.fontSize = "1vh"
		// document.getElementById("bk").style.fontSize = "1vh"
		document.getElementById("select_id").style.marginLeft = "3vh"
		
	}else{
		document.getElementById("top_title").style.display = "flex"
		document.getElementById("details").style.height = "92%"
	}


    //人员信息 - 初始化 - 点击人员列表某个人员展示具体信息弹窗
    function openInfo (id) {
        //根据主键从新查人员
        $.ajax({
            url:basePath + "zk/BigDataVies/findRYBYID.ajax?id="+id,
            dataType: 'json',
            async: false,
            type:'get',
            jsonp: 'callback',
            success : function(data) {
                var mydata=data.data;
                var content="";
                content+= "<div style='color: #fff;position: absolute;right: 1vh;top: 1vh;padding: 0 1vh;cursor: pointer;' onclick=\"closewin()\">x</div>"
                    +"<img src='"+mydata.photo +"' style='width: 11vh;height: 11vh;' />"
                    +"<div style='display:flex;justify-content:space-between;flex-direction:column;  padding-left: 2vh;'>"
                    +	"<div>姓名："+mydata.name+"</div>"
                    +	"<div style='white-space: nowrap;'>职位："+mydata.post_nam+"</div>"
                    +	"<div>电话："+mydata.tel+"</div></div>"	;
                $("#ryxxbox").html(content);
            },
            error : function(html) {
            }
        });
        document.getElementById('ryxxbox').style.display='flex';
    }
    //人员详情关闭
    function closewin(){
        document.getElementById('ryxxbox').style.display='none';
    }
	
	//关闭信息窗体
	function closeInfoWindow() {
		map.clearInfoWindow();
		
		document.getElementById("closeInfoWind").style.display = "none";
		document.getElementById("clearInfoWin1").style.display = "none";
		document.getElementById("closeInfoWind2").style.display = "none";
		document.getElementsByClassName("closeInfoWind2").style.dispaly = "none"
		console.log(document.getElementsByClassName("closeInfoWind2"))
	}

    //利用行政区查询获取边界构建mask路径
    //也可以直接通过经纬度构建mask路径
    var district = new AMap.DistrictSearch({
        subdistrict: 0,
        extensions: 'all',
        level: 'city'
    });
    var chooseIndex=0;
    var lnglats = [];//人员信息
    var map = null;
    var xmxxMark="";//项目信息
    var zstzMark ="";//招商投资
    // 窗体信息
	
	
    var infoWindow = new AMap.InfoWindow({
		isCustom:true,
		// content: createInfoWindow(title, content.join("<br/>")),
		// offset: new AMap.Pixel(16, -50)
        offset: new AMap.Pixel(0, -30)
    });
	
	
    // var zkselval = document.getElementById("zkbkserach");
	var zkselval = document.getElementById("dropdownMenu1");
	
    var selvalValue='';
    //定义搜索下拉框提示的内容
    var xlsearch='';
    //百科内容
    var bkstr="";
    //部门机构
    var bmjgarry="";
    //项目信息
    var xmxxarry="";
    //招商投资
    var zstzarry="";
    //大屏切换事件
    var ulList='';

	//输入框值改变监听函数
    $("#js-groupId").bind('input propertychange', function() {
		 zhiku = document.getElementById("js-groupId");
		 if(zhiku.value!=""){
		 findBKSeleTS(zhiku.value);
		 }
    });
	
    district.search('江宁区', function (status, result) {
        // 描边坐标数组[118.618582,31.87338,118.618184,31.873338,118.618019,31.873358,118.617923,31.873421,118.61788,31.873531,118.617863,......]
        var bounds = result.districtList[0].boundaries;
        map = new AMap.Map('container', {
            center: [118.85, 31.95],
            disableSocket: true,
            viewMode: '3D',
            showLabel: false,
            labelzIndex: 130,
            features: ['bg', 'building', 'road'], // 显示图层（背景，建筑，街道）
            pitch: 40, // 俯视角度
            zoom: 1, // 初始放大级别（有 0~21）
            zooms: [1,18],
            resizeEnable: true, //是否监控地图容器尺寸变化
            // mapStyle: "amap://styles/blue", // 地图样式
			mapStyle: "amap://styles/c7add6f2a48f7903faf2b91d9ad2cbbd"
        });

        //设置地图比例尺
        AMap.plugin(['AMap.Scale'], function(){ map.addControl(new AMap.Scale()) });

        //添加高度面
        var object3Dlayer = new AMap.Object3DLayer({ zIndex: 1 });
        map.add(object3Dlayer);
        var height = -6000;
        var color = '#0088ffcc'; //rgba
        var wall = new AMap.Object3D.Wall({
            path: bounds,
            height: height,
            color: color
        });
        wall.transparent = true;
        object3Dlayer.add(wall);
        //添加描边
        for (var i = 0; i < bounds.length; i += 1) {
            new AMap.Polyline({
                path: bounds[i],
                strokeColor: '#99ffff',
                strokeWeight: 2,
                map: map
            });
        };

		function markerClick(e) {
			var infoWindow = new AMap.InfoWindow({
				isCustom: true,  //使用自定义窗体
				content: e.target.content,
				offset: new AMap.Pixel(0, -45)
			});
            infoWindow.open(map, e.target.getPosition());
        }

		function removeMarkers(){
            map.remove(markers);// 移除markers标记
			map.remove(markers1);// 移除markers标记
			map.remove(markers2);// 移除markers标记
			map.remove(markers3);// 移除markers标记
            infoWindow.close(); // 移除窗体信息
        }

		map.setFitView();

		// 设置多个marker
        var cluster,markers = [],markers1=[],markers2=[],markers3=[];
        //获得地图人员信息
        $.ajax({
            url:basePath + "zk/BigDataVies/findDTFLCXRY.ajax",
            dataType: 'json',
            async: true,
            type:'get',
            jsonp: 'callback',
            success : function(data) {
                lnglats=data.data;
                addMarker0();
            },
            error : function(html) {
            }
        });
		
		

        // 人员信息Marker
        function addMarker0 () {
			if(screen.width > 7600){
				var newsize = new AMap.Size(122, 152);
				var newimageSize = new AMap.Size(100,126);
			}else{
				var newsize = new AMap.Size(42, 52);
				var newimageSize = new AMap.Size(20,26);
			}
            for (var i = 0, marker; i < lnglats.length; i++) {
                marker = new AMap.Marker({
                    position: lnglats[i].position,
                    map: map,
					// icon: lnglats[i].icon,
					icon: new AMap.Icon({            
			            image: lnglats[i].icon,
			            size: newsize,  //图标大小
			            imageSize: newimageSize
			        }),
					
                    clickable: true,
                    extData: lnglats[i]
                });
                markers.push(marker)
                //设置文本标注内容
				marker.content = "<div id='closeInfoWind' style='z-index: 1000;background: rgba(0,0,0,0.5);padding: 2vh;font-size: 1.8vh;width:fit-content;'><div style='color: #fff;position: absolute;right: 1vh;top: 1vh;padding: 0 1vh;cursor: pointer;' onclick=\"closeInfoWindow()\">x</div><div class='info' style='padding: 0 2vh;font-size:1.8vh;width:fit-content;'><div style='white-space:nowrap;text-align:center;'>" 
					+ lnglats[i].content.job + "</div><div class='info' style='width:100%;padding: 0 1vh;font-size:1.5vh;text-align: center;white-space: nowrap;'>" 
					+lnglats[i].content.num + "人</div></div></div>"
                marker.on('click', function changeLists(e) {
					
					var infoWindow = new AMap.InfoWindow({
						isCustom: true,  //使用自定义窗体
						content: e.target.content,
						offset: new AMap.Pixel(0, -45)
					});

                    infoWindow.open(map, e.target.getPosition());
					
					var whichlist = e.target.w.extData.content.job;
                    var perLists = e.target.w.extData.content.info;
                    if(whichlist == perLists.job) {
                        var infos = perLists.infos;
                        document.getElementById("thbody").innerHTML = ''
                        for(var j=0; j<infos.length; j++) {
                            document.getElementById("thbody").innerHTML +=
                                "<tr style=\"height:30px;\" onclick=\"openInfo("+
                                infos[j].id +")\"><td style='width: 15%;'>"+
                                infos[j].name +"</td><td style='width: 45%;'>"+
                                infos[j].post +"</td><td style='width: 20%;'>"+
                                infos[j].phon.slice(0,3)+"****"+ infos[j].phon.slice(7,-1) +"</td><td style='width: 10%;'>"+
                                infos[j].sex +"</td><td style='width:10%; '>"+
                                infos[j].age +"</td></tr>"
                        }
                    }
                });
                marker.emit('click', {
                    target: marker
                });
            };

            var count = markers.length;
            var _renderClusterMarker = function (context) {
                var factor = Math.pow(context.count / count, 1 / 4);
                var div = document.createElement('div');
                var Hue = 180 - factor * 180;
                var bgColor = 'hsla(' + Hue + ',100%,50%,0.7)';
                var fontColor = 'hsla(' + Hue + ',100%,20%,1)';
                var borderColor = 'hsla(' + Hue + ',100%,40%,1)';
                var shadowColor = 'hsla(' + Hue + ',100%,50%,1)';
                div.style.backgroundColor = bgColor;
				// 设置点聚合的圈圈大小
				if(screen.width > 7600){
					var size = Math.round(40 + Math.pow(context.count / count, 1 / 5) * 160);
					div.style.fontSize = '60px';
				}else{
					var size = Math.round(40 + Math.pow(context.count / count, 1 / 5) * 16);
					div.style.fontSize = '14px';
				}
                div.style.width = div.style.height = size + 'px';
                div.style.border = 'solid 1px ' + borderColor;
                div.style.borderRadius = size / 2 + 'px';
                div.style.boxShadow = '0 0 1px ' + shadowColor;
                div.innerHTML = context.count;
                div.style.lineHeight = size + 'px';
                div.style.color = fontColor;
                // div.style.fontSize = '14px';
                div.style.textAlign = 'center';
                context.marker.setOffset(new AMap.Pixel(-size / 10, -size / 10));
                context.marker.setContent(div)
            };
            if (cluster) {
                cluster.setMap(null);
            }
            cluster = new AMap.MarkerClusterer(map, markers, {
                gridSize: 80,
                renderClusterMarker: _renderClusterMarker
            });
            // 获取地图的缩放级别，如果级别已经是最高，那么点击后，显示聚合点内的点信息
            cluster.on('click',function(e,markers){
				var markerList = e.markers
                if(map.getZoom() == 18){
					if(screen.width > 7600){
						var newsize = new AMap.Size(122, 152);
						var newimageSize = new AMap.Size(100,126);
					}else{
						var newsize = new AMap.Size(42, 52);
						var newimageSize = new AMap.Size(20,26);
					}
					for(var i=0,marker; i < markerList.length; i++) {
						var extData = markerList[i].w.extData
						marker = new AMap.Marker({
							position: extData.position,
							map: map,
							// icon: extData.icon,
							icon: new AMap.Icon({            
					            image: extData.icon,
					            size: newsize,  //图标大小
					            imageSize: newimageSize
					        }),
							clickable: true,
							extData: extData
						});
						marker.content = "<div style='z-index: 1000;background: rgba(0,0,0,0.5);padding: 2vh;font-size: 1.8vh;width:fit-content;'><div style='color: #fff;position: absolute;right: 1vh;top: 1vh;padding: 0 1vh;cursor: pointer;' onclick=\"closeInfoWindow()\">x</div><div class='info' style='padding: 0 2vh;font-size:1.8vh;width:fit-content;'><div style='white-space:nowrap;text-align:center;'>" 
							+ extData.content.job + "</div><div class='info' style='width:100%;padding: 0 1vh;font-size:1.5vh;text-align: center;white-space: nowrap;'>" 
							+ extData.content.num + "人</div></div></div>"
						marker.on('click', function changeLists(e) {
							infoWindow.setContent(e.target.content);
							
							infoWindow.open(map, e.target.getPosition());
							var infoss = e.target.w.extData.content.info.infos
							var job = e.target.w.extData.content.info.job
							document.getElementById("thbody").innerHTML = ''
							for(var j=0; j<infoss.length; j++) {
								document.getElementById("thbody").innerHTML +=
									"<tr style=\"height:30px;\" onclick=\"openInfo("+
									infoss[j].id +")\"><td style='width: 15%;'>"+
									infoss[j].name +"</td><td style='width: 45%'>"+
									infoss[j].post +"</td><td style='width: 20%;'>"+
									infoss[j].phon.slice(0,3)+"****"+ infoss[j].phon.slice(7,-1) +"</td><td style='width: 10%;'>"+
									infoss[j].sex +"</td><td style='width:10%; '>"+
									infoss[j].age +"</td></tr>"
							}
						});
					}
                }
            })
        }



        // 项目信息markers

        //获得地图项目信息
        $.ajax({
            url:basePath + "zk/BigDataVies/findDTXMXX.ajax",
            dataType: 'json',
            async: true,
            type:'get',
            jsonp: 'callback',
            success : function(data) {
                xmxxMark=data.data;
				addMarker1()
            },
            error : function(html) {
            }
        });


        function addMarker1(){
			if(screen.width > 7600){
				var newsize = new AMap.Size(122, 152);
				var newimageSize = new AMap.Size(100,126);
			}else{
				var newsize = new AMap.Size(42, 52);
				var newimageSize = new AMap.Size(20,26);
			}
            for (var i = 0, marker; i < xmxxMark.length; i++) {
                marker = new AMap.Marker({
                    position: xmxxMark[i].position,
                    map: map,
                    // icon: xmxxMark[i].icon,
					icon: new AMap.Icon({            
			            image: xmxxMark[i].icon,
			            size: newsize,  //图标大小
			            imageSize: newimageSize
			        }),
                })
                markers1.push(marker)
                //设置文本标注内容
				marker.content = "<div id='clearInfoWin1' style='z-index: 1000;background: rgba(0,0,0,0.5);padding: 2vh;font-size: 1.8vh;'><div style='color: #fff;position: absolute;right: 1vh;top: 1vh;padding: 0 1vh;cursor: pointer;' onclick=\"closeInfoWindow()\">x</div><div style='font-size: 1.6vh;line-height: 3vh;'><div style='text-align: center;color: #00e4f5; white-space:nowrap;'>"+
                    xmxxMark[i].content.title +"</div><table><tr><td style='padding-right: 2vh;white-space:nowrap;'>状态："+
                    xmxxMark[i].content.state +"</td><td style='white-space:nowrap;'>进度："+
                    xmxxMark[i].content.plan +"</td></tr><tr><td style='padding-right: 2vh; white-space:nowrap;'>负责单位："+
                    xmxxMark[i].content.unit +"</td><td style='white-space:nowrap;'>投资额："+
                    xmxxMark[i].content.amount +"</td></tr><tr><td style='padding-right: 2vh; white-space:nowrap;'>项目负责人："+
                    xmxxMark[i].content.principal +"</td><td style='white-space:nowrap;'>开始时间："+
                    xmxxMark[i].content.start +"</td></tr><tr><td style='padding-right: 2vh; white-space:nowrap;'>项目类型："+
                    xmxxMark[i].content.type +"</td><td style=' white-space:nowrap;'>更新时间："+
                    xmxxMark[i].content.finish +"</td></tr></table></div></div>"

                marker.on('click', markerClick);
                marker.emit('click', {
                    target: marker
                });
            }
			var count = markers1.length;
            var _renderClusterMarker = function (context) {
                var factor = Math.pow(context.count / count, 1 / 4);
                var div = document.createElement('div');
                var Hue = 180 - factor * 180;
                var bgColor = 'hsla(' + Hue + ',100%,50%,0.7)';
                var fontColor = 'hsla(' + Hue + ',100%,20%,1)';
                var borderColor = 'hsla(' + Hue + ',100%,40%,1)';
                var shadowColor = 'hsla(' + Hue + ',100%,50%,1)';
                div.style.backgroundColor = bgColor;
				// 设置点聚合的圈圈大小
				if(screen.width > 7600){
					var size = Math.round(40 + Math.pow(context.count / count, 1 / 5) * 160);
					div.style.fontSize = '60px';
				}else{
					var size = Math.round(40 + Math.pow(context.count / count, 1 / 5) * 16);
					div.style.fontSize = '14px';
				}
                div.style.width = div.style.height = size + 'px';
                div.style.border = 'solid 1px ' + borderColor;
                div.style.borderRadius = size / 2 + 'px';
                div.style.boxShadow = '0 0 1px ' + shadowColor;
                div.innerHTML = context.count;
                div.style.lineHeight = size + 'px';
                div.style.color = fontColor;
                // div.style.fontSize = '14px';
                div.style.textAlign = 'center';
                context.marker.setOffset(new AMap.Pixel(-size / 10, -size / 10));
                context.marker.setContent(div)
            };
            if (cluster) {
                cluster.setMap(null);
            }
            cluster = new AMap.MarkerClusterer(map, markers1, {
                gridSize: 80,
                renderClusterMarker: _renderClusterMarker
            });
            // 获取地图的缩放级别，如果级别已经是最高，那么点击后，显示聚合点内的点信息
            cluster.on('click',function(e,markers1){
				var markerList = e.markers
                if(map.getZoom() == 18){
					if(screen.width > 7600){
						var newsize = new AMap.Size(122, 152);
						var newimageSize = new AMap.Size(100,126);
					}else{
						var newsize = new AMap.Size(42, 52);
						var newimageSize = new AMap.Size(20,26);
					}
					for(var i=0,marker; i < markerList.length; i++) {
					  var extData = markerList[i].w
					  console.log(markerList[i])
						marker = new AMap.Marker({
							position: extData.position,
							map: map,
							// icon: extData.icon,
							icon: new AMap.Icon({            
					            image: extData.icon.Ce.image, 
					            size: newsize,  //图标大小
					            imageSize: newimageSize
					        }),
						});
						marker.content = markerList[i].content
						marker.on('click', markerClick);
						marker.emit('click', {
							target: marker
						});
					}
                }
            })
        };

        // 环境监测markers
        var hjjcMark = [{
            icon: '<%=basePath %>dataview/img/normal0.png',
            position: [118.665497, 31.785761],
            content: {
                title: '胜太路3号站点',
                jing: 'E43.434°',
                wei: 'S33.432°',
                type: '二氧化硫浓度',
                num: '250ug/m3',
                state: '正常',
                time: '2020-3-12 17:45'
            }}, {
            icon: '<%=basePath %>dataview/img/exceptron.png',
            position: [118.698904, 31.733423],
            content: {
                title: '东山8号站点',
                jing: 'E43.434°',
                wei: 'S33.432°',
                type: 'PM2.5',
                num: '250ug/m3',
                state: '异常',
                time: '2020-3-12 17:45',
            }},{
            icon: '<%=basePath %>dataview/img/normal0.png',
            position: [118.665497, 31.785761],
            content: {
                title: '胜太路3号站点',
                jing: 'E43.434°',
                wei: 'S33.432°',
                type: '二氧化硫浓度',
                num: '250ug/m3',
                state: '正常',
                time: '2020-3-12 17:45'
            }}, {
            icon: '<%=basePath %>dataview/img/exceptron.png',
            position: [118.698904, 31.733423],
            content: {
                title: '东山8号站点',
                jing: 'E43.434°',
                wei: 'S33.432°',
                type: 'PM2.5',
                num: '250ug/m3',
                state: '异常',
                time: '2020-3-12 17:45',
            }}
		];
        function addMarker2(){
			if(screen.width > 7600){
				var newsize = new AMap.Size(122, 152);
				var newimageSize = new AMap.Size(100,126);
			}else{
				var newsize = new AMap.Size(42, 52);
				var newimageSize = new AMap.Size(20,26);
			}
            for (var i = 0, marker; i < hjjcMark.length; i++) {
                marker = new AMap.Marker({
                    position: hjjcMark[i].position,
                    map: map,
                    // icon: hjjcMark[i].icon,
					icon: new AMap.Icon({            
			            image: hjjcMark[i].icon,
			            size: newsize,  //图标大小
			            imageSize: newimageSize
			        }),
                })
                markers2.push(marker)
				marker.content = "<div id='closeInfoWind2' class='closeInfoWind2' style='z-index: 1000;background: rgba(0,0,0,0.5);padding: 2vh;font-size: 1.8vh;'><div style='color: #fff;position: absolute;right: 1vh;top: 1vh;padding: 0 1vh;cursor: pointer;' onclick=\"closeInfoWindow()\">x</div><div style='font-size: 1.6vh;line-height: 3vh;'><div style='text-align: center;color: #00e4f5;'>"+
                    hjjcMark[i].content.title +"</div><div style='display:flex;justify-content:space-between'><div style=' white-space:nowrap;'>经度："+
                    hjjcMark[i].content.jing +"</div><div style=' white-space:nowrap;'>经度："+
                    hjjcMark[i].content.wei +"</div></div><div style=' white-space:nowrap;'>污染类型："+
                    hjjcMark[i].content.type +"</div><div style='display:flex;justify-content:space-between'><div style=' white-space:nowrap;'>监测值："+
                    hjjcMark[i].content.num +"</div><div style=' white-space:nowrap;'>状态： "+
                    hjjcMark[i].content.state +"</div></div><div style=' white-space:nowrap;'>更新时间："+
                    hjjcMark[i].content.time +"</div></div></div>"

                marker.on('click', markerClick);
                marker.emit('click', {
                    target: marker
                });
            }
			var count = markers2.length;
            var _renderClusterMarker = function (context) {
                var factor = Math.pow(context.count / count, 1 / 4);
                var div = document.createElement('div');
                var Hue = 180 - factor * 180;
                var bgColor = 'hsla(' + Hue + ',100%,50%,0.7)';
                var fontColor = 'hsla(' + Hue + ',100%,20%,1)';
                var borderColor = 'hsla(' + Hue + ',100%,40%,1)';
                var shadowColor = 'hsla(' + Hue + ',100%,50%,1)';
                div.style.backgroundColor = bgColor;
				// 设置点聚合的圈圈大小
				if(screen.width > 7600){
					var size = Math.round(40 + Math.pow(context.count / count, 1 / 5) * 160);
					div.style.fontSize = '60px';
				}else{
					var size = Math.round(40 + Math.pow(context.count / count, 1 / 5) * 16);
					div.style.fontSize = '14px';
				}
                div.style.width = div.style.height = size + 'px';
                div.style.border = 'solid 1px ' + borderColor;
                div.style.borderRadius = size / 2 + 'px';
                div.style.boxShadow = '0 0 1px ' + shadowColor;
                div.innerHTML = context.count;
                div.style.lineHeight = size + 'px';
                div.style.color = fontColor;
                // div.style.fontSize = '14px';
                div.style.textAlign = 'center';
                context.marker.setOffset(new AMap.Pixel(-size / 10, -size / 10));
                context.marker.setContent(div)
            };
            if (cluster) {
                cluster.setMap(null);
            }
            cluster = new AMap.MarkerClusterer(map, markers2, {
                gridSize: 80,
                renderClusterMarker: _renderClusterMarker
            });
            // 获取地图的缩放级别，如果级别已经是最高，那么点击后，显示聚合点内的点信息
            cluster.on('click',function(e,markers2){
                if(map.getZoom() == 18){
					for(var i=0,marker; i < hjjcMark.length; i++) {
						if(screen.width > 7600){
							var newsize = new AMap.Size(122, 152);
							var newimageSize = new AMap.Size(100,126);
						}else{
							var newsize = new AMap.Size(42, 52);
							var newimageSize = new AMap.Size(20,26);
						}
						marker = new AMap.Marker({
							position: hjjcMark[i].position,
							map: map,
							// icon: hjjcMark[i].icon,
							icon: new AMap.Icon({            
					            image: hjjcMark[i].icon,
					            size: newsize,  //图标大小
					            imageSize: newimageSize
					        }),
						})
						marker.content = "<div id='closeInfoWind2' style='z-index: 1000;background: rgba(0,0,0,0.5);padding: 2vh;font-size: 1.8vh;'><div style='color: #fff;position: absolute;right: 1vh;top: 1vh;padding: 0 1vh;cursor: pointer;' onclick=\"closeInfoWindow()\">x</div><div style='font-size: 1.6vh;line-height: 3vh;'><div style='text-align: center;color: #00e4f5;'>"+
							hjjcMark[i].content.title +"</div><div style='display:flex;justify-content:space-between'><div style=' white-space:nowrap;'>经度："+
							hjjcMark[i].content.jing +"</div><div style=' white-space:nowrap;'>经度："+
							hjjcMark[i].content.wei +"</div></div><div style=' white-space:nowrap;'>污染类型："+
							hjjcMark[i].content.type +"</div><div style='display:flex;justify-content:space-between'><div style=' white-space:nowrap;'>监测值："+
							hjjcMark[i].content.num +"</div><div style=' white-space:nowrap;'>状态： "+
							hjjcMark[i].content.state +"</div></div><div style=' white-space:nowrap;'>更新时间："+
							hjjcMark[i].content.time +"</div></div></div>"
						marker.on('click', markerClick);
						marker.emit('click', {
							target: marker
						});
					}
                }
            })
        }

        // 招商投资markers

        //获得地图项目信息
        $.ajax({
            url:basePath + "zk/BigDataVies/findDTZSTZ.ajax",
            dataType: 'json',
            async: true,
            type:'get',
            jsonp: 'callback',
            success : function(data) {
                zstzMark=data.data;

            },
            error : function(html) {
            }
        });

        function addMarker3(){
            for (var i = 0, marker; i < zstzMark.length; i++) {
				if(screen.width > 7600){
					var newsize = new AMap.Size(122, 152);
					var newimageSize = new AMap.Size(100,126);
				}else{
					var newsize = new AMap.Size(42, 52);
					var newimageSize = new AMap.Size(20,26);
				}	
                marker = new AMap.Marker({
                    position: zstzMark[i].position,
                    map: map,
                    // icon: zstzMark[i].icon,
					icon: new AMap.Icon({            
			            image: zstzMark[i].icon,
			            size: newsize,  //图标大小
			            imageSize: newimageSize
			        }),
                })
                markers3.push(marker)
                //设置文本标注内容
                marker.content = "<div style='z-index: 1000;background: rgba(0,0,0,0.5);padding: 2vh;font-size: 1.8vh;'><div style='color: #fff;position: absolute;right: 1vh;top: 1vh;padding: 0 1vh;cursor: pointer;' onclick=\"closeInfoWindow()\">x</div><div style='font-size: 1.6vh;line-height: 3vh;'><div style='text-align: center;color: #00e4f5;'>"+
                    zstzMark[i].content.title +"</div><div style='background: url(<%=basePath %>dataview/img/xmgkTitBg.png);background-size: 100% 100%;'>项目概况</div><div style=' text-indent:2em;text-indent: 2em;line-height: 3vh;padding: 1vh;'>"+
                    zstzMark[i].content.general +"</div><div style='background: url(<%=basePath %>dataview/img/xmgkTitBg.png);background-size: 100% 100%;'>投资详情</div><div><table style='width: 100%;'><tr><td style=' white-space:nowrap;'>计划投资额："+
                    zstzMark[i].content.plan +"</td><td style=' white-space:nowrap;'>投资完成率："+
                    zstzMark[i].content.finish +"</td></tr><tr><td style=' white-space:nowrap;'>实际投资额："+
                    zstzMark[i].content.real +"</td><td style=' white-space:nowrap;'>投资性质："+
                    zstzMark[i].content.nature +"</td></tr><tr><td style=' white-space:nowrap;'>项目当前进程："+
                    zstzMark[i].content.course +"</td></tr></table></div></div></div>"
                marker.on('click', markerClick);
                marker.emit('click', {
                    target: marker
                });
            }
			var count = markers3.length;
            var _renderClusterMarker = function (context) {
                var factor = Math.pow(context.count / count, 1 / 4);
                var div = document.createElement('div');
                var Hue = 180 - factor * 180;
                var bgColor = 'hsla(' + Hue + ',100%,50%,0.7)';
                var fontColor = 'hsla(' + Hue + ',100%,20%,1)';
                var borderColor = 'hsla(' + Hue + ',100%,40%,1)';
                var shadowColor = 'hsla(' + Hue + ',100%,50%,1)';
                div.style.backgroundColor = bgColor;
				// 设置点聚合的圈圈大小
				if(screen.width > 7600){
					var size = Math.round(40 + Math.pow(context.count / count, 1 / 5) * 160);
					div.style.fontSize = '60px';
				}else{
					var size = Math.round(40 + Math.pow(context.count / count, 1 / 5) * 16);
					div.style.fontSize = '14px';
				}
                div.style.width = div.style.height = size + 'px';
                div.style.border = 'solid 1px ' + borderColor;
                div.style.borderRadius = size / 2 + 'px';
                div.style.boxShadow = '0 0 1px ' + shadowColor;
                div.innerHTML = context.count;
                div.style.lineHeight = size + 'px';
                div.style.color = fontColor;
                // div.style.fontSize = '14px';
                div.style.textAlign = 'center';
                context.marker.setOffset(new AMap.Pixel(-size / 10, -size / 10));
                context.marker.setContent(div)
            };
            if (cluster) {
                cluster.setMap(null);
            }
            cluster = new AMap.MarkerClusterer(map, markers3, {
                gridSize: 80,
                renderClusterMarker: _renderClusterMarker
            });
            // 获取地图的缩放级别，如果级别已经是最高，那么点击后，显示聚合点内的点信息
            cluster.on('click',function(e,markers3){
				var markerList = e.markers
				
                if(map.getZoom() == 18){
					if(screen.width > 7600){
						var newsize = new AMap.Size(122, 152);
						var newimageSize = new AMap.Size(100,126);
					}else{
						var newsize = new AMap.Size(42, 52);
						var newimageSize = new AMap.Size(20,26);
					}
					for(var i=0,marker; i < markerList.length; i++) {
					  var extData = markerList[i].w
					  console.log(extData)
						marker = new AMap.Marker({
							position: extData.position,
							map: map,
							// icon: extData.icon,
							icon: new AMap.Icon({            
					            image: extData.icon,
					            size: newsize,  //图标大小
					            imageSize: newimageSize
					        }),
						});
						marker.content = extData.content
						marker.on('click', markerClick);
						marker.emit('click', {
							target: marker
						});
					}
                }
            })
        };



        // 大屏点击切换事件
        ulList = document.getElementById("ulList").children
        var mid_cont = document.getElementById("mid_cont").children
        for(var i=0; i< ulList.length; i++) {
            change(ulList[i].firstChild)
			if(cluster != null) {
				if(markers != null) {
					markers = []
					// cluster.removeMarker({marker:markers});
					// map.remove({marker:markers})
					// removeMarkers()
				}
				if(markers1 != null) {
					markers1 = []
				}
				if(markers2 != null) {
					markers2 = []
				}
				if(markers3 != null) {
					markers3 = []
				}
			}
        }

        //搜索人员信息，项目信息，招商投资的标题内容
        $.ajax({
            url:basePath + "zk/BigDataVies/findSearchContent.ajax",
            dataType: 'json',
            async: true,
            type:'get',
            jsonp: 'callback',
            success : function(data) {
                xlsearch=data.data;
                //百科下拉
                // for(var i=0;i<xlsearch.bkarry.length;i++){
                    // bkstr+=  "<li data-id='"+xlsearch.bkarry[i].title+"'><a href='javascript:void(0)'>"+xlsearch.bkarry[i].title+"</a></li>";
                // }
                //部门机构下拉
                for(var i=0;i<xlsearch.bmjgarry.length;i++){
                    bmjgarry +=  "<li data-id='"+xlsearch.bmjgarry[i].id+"'><a href='javascript:void(0)'>"+xlsearch.bmjgarry[i].deaprtName+"</a></li>";
                }
                //项目信息下拉
                for(var i=0;i<xlsearch.xmxxarry.length;i++){
                    xmxxarry +=  "<li data-id='"+xlsearch.xmxxarry[i].id+"'><a href='javascript:void(0)'>"+xlsearch.xmxxarry[i].prjName+"</a></li>";
                }
                //招商投资下拉
                for(var i=0;i<xlsearch.zstzarry.length;i++){
                    zstzarry +=  "<li data-id='"+xlsearch.zstzarry[i].id+"'><a href='javascript:void(0)'>"+xlsearch.zstzarry[i].acpName+"</a></li>"
                }

            },
            error : function(html) {
            }
        });
        //输入框颜色  改变函数
        function inputColorChange(){
            if(document.getElementById("js-groupId").style.borderColor=='red'){
                $("#js-groupId").css('borderColor','');
                document.getElementById("js-groupId").value='';
            }
        }

		// 大屏tab点击切换事件
        function change (obj0) {
            obj0.onclick = function () {
				if(cluster != null) {
					if(markers != null) {
						cluster.removeMarker({marker:markers});
						map.remove({marker:markers})
						// removeMarkers()
					}
					if(markers1 != null) {
						cluster.removeMarker({marker:markers1});
						map.remove({marker:markers1})
						markers1 = []
					}
					if(markers2 != null) {
						cluster.removeMarker({marker:markers2});
						map.remove({marker:markers2})
						markers2 = []
					}
					if(markers3 != null) {
						cluster.removeMarker({marker:markers3});
						map.remove({marker:markers3})
						markers3 = []
					}
				}
                for(var j=0; j<ulList.length; j++) {
                    if(obj0 == ulList[j].firstChild) {
                        obj0.className = "tabbarAct";
                        mid_cont[j].className = "rylb selecte0"
                        if(j == 0) {
							document.getElementById("js-groupId").value='';
                            addMarker0();
                            chooseIndex=j;
                            document.getElementById("js-groupId").onfocus=function(){
                                inputColorChange();
                                document.getElementById("groupid").innerHTML = '';
                                // selvalValue=  zkselval.options[selval.selectedIndex].value;
								selvalValue=  zkselval.innerHTML;
								if(selvalValue!='百科'){
                                // if(selvalValue!='bk'){
									document.getElementById("groupid").style.height='5vh';
                                    document.getElementById("groupid").innerHTML =bmjgarry;
                                }else{
									document.getElementById("groupid").style.height='0';
                                    document.getElementById("groupid").innerHTML=bkstr;
                                }
                            };
                        }else if(j == 1) {
							document.getElementById("js-groupId").value='';
                            addMarker1();
                            closewin();
                            chooseIndex=j;
                            document.getElementById("js-groupId").onfocus=function(){
                                inputColorChange();
                                document.getElementById("groupid").innerHTML = '';
                                // selvalValue=  zkselval.options[selval.selectedIndex].value;
								selvalValue=  zkselval.innerHTML;
                                // if(selvalValue!='bk'){
								if(selvalValue!='百科'){
									document.getElementById("groupid").style.height='5vh';
                                    document.getElementById("groupid").innerHTML=xmxxarry;
                                }else{
								
                                    document.getElementById("groupid").innerHTML=bkstr;
                                }
                            };
                        }else if(j == 2) {
							document.getElementById("js-groupId").value='';
                            addMarker2();
                            chooseIndex=j;
                            inputColorChange()
                            document.getElementById('ryxxbox').style.display='none';
                        }else if(j == 3){
							document.getElementById("js-groupId").value='';
                            chooseIndex=j;
                            addMarker3();
                            closewin();

                            document.getElementById("js-groupId").onfocus=function(){
                                inputColorChange();
                                document.getElementById("groupid").innerHTML = '';
                                // selvalValue=  zkselval.options[selval.selectedIndex].value;
								selvalValue=  zkselval.innerHTML;
                                // if(selvalValue!='bk'){
								if(selvalValue!='百科'){
									document.getElementById("groupid").style.height='5vh';
                                    document.getElementById("groupid").innerHTML=zstzarry
                                }else{
									
                                    document.getElementById("groupid").innerHTML=bkstr;
                                }
                            };
                        }
                    }else{
                        ulList[j].firstChild.className = ''
                        mid_cont[j].className = 'rylb not_seled0'
                    }
                }
            }
        }
    });


    document.getElementById("js-groupId").onfocus=function(){
        if(document.getElementById("js-groupId").style.borderColor=='red'){
            $("#js-groupId").css('borderColor','');
            document.getElementById("js-groupId").value='';
        }

        document.getElementById("groupid").innerHTML = '';
        // selvalValue=  zkselval.options[selval.selectedIndex].value;
		selvalValue=  zkselval.innerHTML;
        // if(selvalValue!='bk'){
		if(selvalValue!='百科'){
			document.getElementById("groupid").style.height='5vh';
            document.getElementById("groupid").innerHTML= bmjgarry ;
        }else{
			
            document.getElementById("groupid").innerHTML=bkstr;

        }

    };
    //下拉框提示函数
    function tsselect(data){

    }

	//以下是操作大屏，不涉及地图

    window.onresize=function(){
        location=location;
    };

    // 政效分析点击切换事件
    var arrLi = document.getElementById("tabbar").children;
    var content = document.getElementById("content").children;
    for(var i=0; i< arrLi.length; i++) {
        cut(arrLi[i]);
    }
    function cut (obj) {
        obj.onclick = function () {
            for(var j=0; j<arrLi.length; j++) {
                if(obj == arrLi[j]) {
                    obj.className = "zxfx_act";
                    content[j].className = "selecte zxfx_ul";
                } else {
                    arrLi[j].className = '';
                    content[j].className = 'not_seled zxfx_ul';
                }
            }
        };
    }


    var zhiku = document.getElementById("js-groupId");
    // var selval = document.getElementById("zkbkserach");
	var selval = document.getElementById("dropdownMenu1");
    //智库，百科选择框切换清空搜索框内容
    $("#zkbkserach").change(function(){


    })

    // 智库 点击搜索
    $("#zk_search").click(function(){

        if(zhiku.value == '') {
            $("#js-groupId").css('borderColor','red'); //添加css样式
            $("#js-groupId").attr('placeholder','搜索的内容不能为空！')
            return;
        }

        // if( selval.options[selval.selectedIndex].value=='zk'){
		if( selval.innerHTML=='搜索'){
            if(chooseIndex==0){

                for(var i=0; i< lnglats.length;i++) {
                    if(lnglats[i].content.job == zhiku.value) {		
						var text = "<div id='closeInfoWind' style='z-index: 1000;background: rgba(0,0,0,0.5);padding: 2vh;font-size: 1.8vh;width:fit-content;'><div style='color: #fff;position: absolute;right: 1vh;top: 1vh;padding: 0 1vh;cursor: pointer;' onclick=\"closeInfoWindow()\">x</div><div class='info' style='padding: 0 2vh;font-size:1.8vh;width:fit-content;'><div style='white-space:nowrap;'>" 
							+ lnglats[i].content.job + "</div><div class='info' style='width:100%;padding: 0 1vh;font-size:1.5vh;text-align: center;white-space: nowrap;'>" 
							+ lnglats[i].content.num + "人</div></div></div>"
							
						var infoWindow = new AMap.InfoWindow({
							isCustom: true,  //使用自定义窗体
							content: text,
							offset: new AMap.Pixel(0, -45)
						});
                        infoWindow.setContent(text);
                        infoWindow.open(map, lnglats[i].position);
						
                        var whichlist = lnglats[i].content.job;
                        var perLists = lnglats[i].content.info;
                        if(whichlist == perLists.job) {
                            var infos = perLists.infos;
                            document.getElementById("thbody").innerHTML = '';
                            for(var j=0; j<infos.length; j++) {
                                document.getElementById("thbody").innerHTML +=
                                    "<tr style=\"height:30px;\" onclick=\"openInfo("+
                                    infos[j].id +")\"><td style='width: 15%;'>"+
                                    infos[j].name +"</td><td style='width:45%;'>"+
                                    infos[j].post +"</td><td style='width: 20%;'>"+
                                    infos[j].phon.slice(0,3)+"****"+ infos[j].phon.slice(7,-1) +"</td><td style='width: 10%;'>"+
                                    infos[j].sex +"</td><td style='width: 10%;'>"+
                                    infos[j].age +"</td></tr>"
                            };

                        };
                    };
                };
            }else if(chooseIndex==1){
                for (var i = 0, marker; i < xmxxMark.length; i++) {
                    if(xmxxMark[i].content.title == zhiku.value){
                        //设置文本标注内容
						var text = "<div id='clearInfoWin1' style='z-index: 1000;background: rgba(0,0,0,0.5);padding: 2vh;font-size: 1.8vh;'><div style='color: #fff;position: absolute;right: 1vh;top: 1vh;padding: 0 1vh;cursor: pointer;' onclick=\"closeInfoWindow()\">x</div><div style='font-size: 1.6vh;line-height: 3vh;'><div style='text-align: center;color: #00e4f5; white-space:nowrap;'>"+
							xmxxMark[i].content.title +"</div><table><tr><td style='padding-right: 2vh;white-space:nowrap;'>状态："+
							xmxxMark[i].content.state +"</td><td style='white-space:nowrap;'>进度："+
							xmxxMark[i].content.plan +"</td></tr><tr><td style='padding-right: 2vh; white-space:nowrap;'>负责单位："+
							xmxxMark[i].content.unit +"</td><td style='white-space:nowrap;'>投资额："+
							xmxxMark[i].content.amount +"</td></tr><tr><td style='padding-right: 2vh; white-space:nowrap;'>项目负责人："+
							xmxxMark[i].content.principal +"</td><td style='white-space:nowrap;'>开始时间："+
							xmxxMark[i].content.start +"</td></tr><tr><td style='padding-right: 2vh; white-space:nowrap;'>项目类型："+
							xmxxMark[i].content.type +"</td><td style=' white-space:nowrap;'>更新时间："+
							xmxxMark[i].content.finish +"</td></tr></table></div></div>"
							
						var infoWindow = new AMap.InfoWindow({
							isCustom: true,  //使用自定义窗体
							content: text,
							offset: new AMap.Pixel(0, -45)
						});
							
                        infoWindow.setContent(text);
                        infoWindow.open(map, xmxxMark[i].position);
                    };
                }
                //alert("项目信息搜索");
            }else if(chooseIndex==2){
				// licaihong
                //alert("环境监测搜索");
            }else{
                for (var i = 0, marker; i < zstzMark.length; i++) {
                    if(zstzMark[i].content.title == zhiku.value){
                        //设置文本标注内容
						var text =	"<div style='z-index: 1000;background: rgba(0,0,0,0.5);padding: 2vh;font-size: 1.8vh;'><div style='color: #fff;position: absolute;right: 1vh;top: 1vh;padding: 0 1vh;cursor: pointer;' onclick=\"closeInfoWindow()\">x</div><div style='font-size: 1.6vh;line-height: 3vh;'><div style='text-align: center;color: #00e4f5;'>"+
							zstzMark[i].content.title +"</div><div style='background: url(<%=basePath %>dataview/img/xmgkTitBg.png);background-size: 100% 100%;'>项目概况</div><div style=' text-indent:2em;text-indent: 2em;line-height: 3vh;padding: 1vh;'>"+
							zstzMark[i].content.general +"</div><div style='background: url(<%=basePath %>dataview/img/xmgkTitBg.png);background-size: 100% 100%;'>投资详情</div><div><table style='width: 100%;'><tr><td style=' white-space:nowrap;'>计划投资额："+
							zstzMark[i].content.plan +"</td><td style=' white-space:nowrap;'>投资完成率："+
							zstzMark[i].content.finish +"</td></tr><tr><td style=' white-space:nowrap;'>实际投资额："+
							zstzMark[i].content.real +"</td><td style=' white-space:nowrap;'>投资性质："+
							zstzMark[i].content.nature +"</td></tr><tr><td style=' white-space:nowrap;'>项目当前进程："+
							zstzMark[i].content.course +"</td></tr></table></div></div></div>"
						var infoWindow = new AMap.InfoWindow({
							isCustom: true,  //使用自定义窗体
							content: text,
							offset: new AMap.Pixel(0, -45)
						});
                        infoWindow.setContent(text);
                        infoWindow.open(map, zstzMark[i].position);
                    }
                }
                //alert("招商投资搜索");
            }

        }else if( selval.innerHTML=='百科'){
			alert(selval.innerHTML)
            zhiku = document.getElementById("js-groupId");
            var cont='';
            $("#mybktitle").html(cont);
            $("#mybkdesc").html(cont);
            document.getElementById("groupid").innerHTML = '';
            
            searchBK(zhiku.value);            
            $(".info_title").html("搜索结果");
            document.getElementById("search02").style.display = 'block';
        }
    });
	
	//百科下拉框匹配
	 function findBKSeleTS(value){
	  bkstr='';
	  document.getElementById("groupid").innerHTML="";
	  var selteText=value;
	   $.ajax({
				 url:basePath + "zk/BigDataVies/findBKSeleTS.ajax?selteText="+selteText,
				 dataType: 'json',
				 async: true,
				 type:'get',
				 jsonp: 'callback',
				 success : function(data) {
				  var mybkdata=data.data
				  for(var i=0;i<mybkdata.bkarray.length;i++){
						bkstr+=  "<li data-id='"+mybkdata.bkarray[i]+"'><a href= \'javascript:void(0)\'>"+mybkdata.bkarray[i]+"</a></li>";
					 }
				  document.getElementById("groupid").innerHTML=bkstr;
				 },
				 error : function(html) {
				 }
			 });
	  
	 }
 
	//百科搜索请求
    function searchBK(value){
     var cont=value;
      $.ajax({
             url:basePath + "zk/BigDataVies/findBKSearch.ajax?cont="+cont,
             dataType: 'json',
             async: true,
             type:'get',
             jsonp: 'callback',
             success : function(data) {
				 console.log(data)
                 var list=data.data.list;
                 var content='';
                 for(var i=0;i<list.length;i++){
                    content+="<li class='ssjg ssjgli'>"+
                      " <p class='searchTit' id='mybktitle' >"+list[i].bktitle+"</p >"+
                      " <div id='mybkdesc'>"+list[i].bkdesc+"</div></li>";
                     }
                 if(list.length==0){
                   content+="<li class='ssjg ssjgli'>"+
                         " <p class='searchTit' id='mybktitle' >没有搜索到结果，请重新搜索</p >"+
                         " <div id='mybkdesc'></div></li>";
                 }
                 $("#bkSearchContent").html(content);
             },
             error : function(html) {
             }
         });
    }

    // 点击搜索关闭按钮
    $("#closeImg").click(function(){
        document.getElementById("search02").style.display = 'none';
        // document.getElementById("search01").style.display = 'block';
        //  document.getElementById("zhiku").value = '';
    });

    // 点击删除最近搜索标签
    $("#shanchu").click(function(){
        document.getElementById("nearSear").innerHTML = '';
    });

    // 人员列表 点击搜索
    $(document).ready(function(){
        $("#rylb_sear").click(function(){

            //alert("人员列表搜索");

			
        });
    });

	if(screen.width > 7600){
		// 数据总览
		var option1 = {
			title: {
				text: '数量：条',
				left:"left",
				textStyle: {
					color: '#657dbb',
					fontSize: 60,
					fontWeight: 300,
					paddingTop: 30
				}
			},
			color: ['#3398DB'],
			tooltip: {
				textStyle:{
					fontSize: 60
				},
				axisPointer: {            // 坐标轴指示器，坐标轴触发有效
					type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				}
			},
			grid: {
				top: '20%',
				left: '2%',
				right: '2%',
				bottom: '5%',
				containLabel: true
			},
			xAxis: {
				type: 'category',
				data: ['百科全书','专家智库','热点管理','政务要闻'],
				axisTick: {
					alignWithLabel: true
				},
				axisTick: {show: false},
				axisLine:{
					lineStyle:{
						show:false,
						fontSize:55,
						fontWeight: 300,
						color:'#114D94', //横轴上的颜色
					}
				},
				axisLabel: {
					interval:0,
					textStyle: {
						fontSize:60,
						color: '#72ABE2'
					}
				},
			},
			yAxis: {
				type: 'value',
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
					interval:0,
					textStyle: {
						fontSize:60,
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
									['#ffd701', '#fb9400'],
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
									fontSize: 60,

								}
							}
						}
					}
				},
			]
		};
	}else{
		// 数据总览
		var option1 = {
			title: {
				text: '数量：条',
				left:"left",
				textStyle: {
					color: '#657dbb',
					fontSize: 12,
					fontWeight: 30,
					paddingTop: 30
				}
			},
			color: ['#3398DB'],
			tooltip: {
				axisPointer: {            // 坐标轴指示器，坐标轴触发有效
					type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				}
			},
			grid: {
				top: '20%',
				left: '2%',
				right: '2%',
				bottom: '5%',
				containLabel: true
			},
			xAxis: {
				type: 'category',
				data: ['百科全书','专家智库','热点管理','政务要闻'],
				axisTick: {
					alignWithLabel: true
				},
				axisTick: {show: false},
				axisLine:{
					lineStyle:{
						show:false,
						fontSize:12,
						fontWeight: 30,
						color:'#114D94', //横轴上的颜色
					}
				},
				axisLabel: {
					textStyle: {
						fontSize:12,
						color: '#72ABE2'
					},
					interval:0
				},
			},
			yAxis: {
				type: 'value',
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
						fontSize:12,
						color: '#657dbb'
					},
					interval:0
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
									['#ffd701', '#fb9400'],
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
									fontSize: 12,

								}
							}
						}
					}
				},
			]
		};
	}


    //数据总览初始化echarts实例
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
	setTimeout(function (){
		window.onresize = function () {
		myChartone.resize();
		}
	},200)


	if(screen.width > 7600){
		// 高质量发展
		var option3 = {
			// legend: {
				// data: [],
				// itemWidth: 80,
				// itemHeight: 36,
				// textStyle: {
					// color: "#fff",
					// fontSize:60
				// }
			// },
			radar: {
				indicator: [],
				center: ['50%', '48%'],
				radius: '60%',
				splitNumber: 5,
				shape: 'polygon',
				name: {
					formatter: function(value) { 
						let list = value.split("");
						let result="";
						for(let i=1;i<=list.length;i++) {
							if(!(i%5)&&list[i]!=undefined) {
								result += list[i-1]+'\n';
							}else {
								result += list[i-1];
							}
						}
						return result;
					},
					color: '#fff',
					fontSize:60,
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
	}else{
		// 高质量发展
		var option3 = {
			// legend: {
				// data: [],
				// itemWidth: 10,
				// itemHeight: 6,
				// textStyle: {
					// color: "transparent"
				// }
			// },
			radar: {
				indicator: [],
				center: ['50%', '54%'],
				radius: '45%',
				splitNumber: 5,
				shape: 'polygon',
				name: {
					formatter: function(value) { 
						let list = value.split("");
						let result="";
						for(let i=1;i<=list.length;i++) {
							if(!(i%5)&&list[i]!=undefined) {
								result += list[i-1]+'\n';
							}else {
								result += list[i-1];
							}
						}
						return result;
					},
					// formatter: '{value}',
					color: '#fff',
					fontSize:14,
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
				
				
				var sele_content = '';
				//高质量发展大类选择框
                if($("#gzlfzdl").html()==null ||$("#gzlfzdl").html()=="" ){
                    for( var m=0;m<optdbnam.length;m++){
						sele_content += "<div  class='round'><div class='circle' onclick='changeSelet(this,\"\","+optdbids[m]+")' ><a>"+ optdbnam[m] +"</a></div><div class='circle_bottom animation'></div><div class='circle_bottom2 animation2'></div></div>"
                        // optionsdb+="<option style=\"background-color: #143276;color:#00ebfb\" value=\""+optdbids[m]+"\">"+optdbnam[m]+"</option>";
                    }
                    // $("#gzlfzdl").html(optionsdb);
                }
				
                //地区选择框
                if($("#gzlfzname").html()==null ||$("#gzlfzname").html()==""){
                    for( var k=0;k<optnam.length;k++){
						sele_content += "<div  class='round'><div class='circle' onclick='changeSelet(this,"+optids[k]+",\"\")'><a>"+ optnam[k] +"</a></div><div class='circle_bottom animation'></div><div class='circle_bottom2 animation2'></div></div>"
                        // options+="<option style=\"background-color: #000103;color:#eab56d\" value=\""+optids[k]+"\">"+optnam[k]+"</option>";
                    }
                    // $("#gzlfzname").html(options);
                }
				
				$("#select_id").html(sele_content);
                

                // option3.legend.data=mydata.legend;//两个地区的图例
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
	
	
	function changeSelet(el,dano,dbno){
		event.cancelBubble=true;
		getGZLFZ(dano,dbno)
		el.childNodes[0].style.color = "#f00 !important"
		if(dbno == '' ){
			document.getElementById("gzl_sele_html").innerHTML = el.childNodes[0].innerHTML
		}
		console.log(el.childNodes[0])

	}
	
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

	if(screen.width > 7600){
		// 项目信息
		//城建项目
		cjoption = {
			tooltip: {
				textStyle:{
					fontSize: 60
				},
				backgroundColor: 'rgba(0,0,0,0)',
				trigger: 'item',
				formatter: '{b}: {c} ({d}%)'
			},
			legend: {
				orient: 'vertical',
				right:-5,
				itemWidth: 50,
				itemHeight: 30,
				textStyle:{color:'#4f9de3',
					fontSize: 60},
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
						borderColor: '#fff ',
						textStyle:{fontSize:60}
					},
					labelLine: {
						show: false
					},
					data: []
				},
				{
					name: '访问来源',
					type: 'pie',
					radius: ['40%', '55%'],
					tooltip: {
						textStyle:{
							fontSize: 60
						}
					},
					label: {
						formatter: '{fs|{b}}: {fs|{c}}{per|{d}%} ',
						backgroundColor: 'transparent',
						borderColor: '#aaa ',
						borderWidth: 1,
						borderRadius: 4,
						rich: {
							per: {
								color: '#eee',
								fontSize: 50,
								backgroundColor: 'transparent',
								padding: [2, 4],
								borderRadius: 2
							},
							fs: {
								fontSize: 50,
								padding: 20
							}
						}
					},
					data: []
				}
			]
		};
		//产业项目
		cyoption = {
			tooltip: {
				textStyle:{
					fontSize: 60
				},
				backgroundColor: 'rgba(0,0,0,0)',
				trigger: 'item',
				formatter: '{b}: {c} ({d}%)'
			},
			legend: {
				orient: 'vertical',
				right: -5,
				itemWidth: 50,
				itemHeight: 30,
				textStyle:{
					color:'#4f9de3',
					fontSize: 50
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
						textStyle:{fontSize:50}
					},
					labelLine: {
						show: false
					},
					data: []
				},
				{
					name: '访问来源',
					type: 'pie',
					radius: ['40%', '55%'],
					tooltip: {
						textStyle:{
							fontSize: 60
						}
					},
					label: {
						formatter: '{fs|{b}}:{fs|{c}}{per|{d}%} ',
						backgroundColor: 'transparent',
						borderColor: '#aaa ',
						borderWidth: 1,
						borderRadius: 4,
						textStyle:{fontSize:8},
						rich: {
							per: {
								color: '#eee',
								fontSize: 50,
								backgroundColor: 'transparent',
								padding: [2, 4],
								borderRadius: 2
							},
							fs: {
								fontSize: 50,
								padding:20
							}
						}
					},
					data: []
				}
			]
		};
	}else{
		// 项目信息
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
				textStyle:{
					color:'#4f9de3',
					fontSize: 8
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
						// backgroundColor: 'transparent',
						borderColor: '#fff ',
						textStyle:{fontSize:8}
					},
					labelLine: {
						show: false
					},
					data: []
				},
				{
					name: '访问来源',
					type: 'pie',
					radius: ['40%', '55%'],
					tooltip: {
						textStyle:{
							fontSize: 8
						}
					},
					label: {
						formatter: '{b}:{c}{per|{d}%} ',
						backgroundColor: 'transparent',
						borderColor: '#aaa ',
						borderWidth: 1,
						borderRadius: 4,
						textStyle:{fontSize:8},
						rich: {
							a: {
								color: '#999',
								lineHeight: 22,
								align: 'center'
							},
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
					data: []
				}
			]
		};
		//产业项目
		cyoption = {
			tooltip: {
				backgroundColor: 'rgba(0,0,0,0.5)',
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
					data: []
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
						rich: {
							per: {
								color: '#eee',
								fontSize: 8,
								backgroundColor: 'transparent',
								padding: [2, 4],
								borderRadius: 2
							}
						}
					},
					data: []
				}
			]
		};
	}


    

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
			
			var content= "<span style=\"color:#00ebfb;font-size:2.5vh;\">"+mydata.xmlx[0]+"：<span style='font-size:2.5vh;'>"+mydata.xmzs[0]+"个";
			$("#xmxx_cj").html(content);
			content= "<span style=\"color:#00ebfb;font-size:2.5vh\">"+mydata.xmlx[1]+"：<span style='font-size:2.5vh;'>"+mydata.xmzs[1]+"个";
			$("#xmxx_cy").html(content);
        },
        error : function(html) {
        }
    });


    // 招商投资 饼状图
    //初始化echarts实例
    var myChartZSTZ = echarts.init(document.getElementById('zstz_pie'));
	setTimeout(function (){
		window.onresize = function () {
		myChartZSTZ.resize();
		}
	},200)
    //获取招商投资饼状图
    $.ajax({
        url:basePath + "zk/BigDataVies/findZSTZ.ajax",
        dataType: 'json',
        async: true,
        type:'get',
        jsonp: 'callback',
        success : function(data) {
            var mydata=data.data;
			if(screen.width > 7600 ){
				var option5 = {
					color: ["#07e3f4", "#f9b100"],
					tooltip: {
						textStyle:{
							fontSize: 60
						},
						trigger: 'item',
						formatter: '{b} : {c} ({d}%)'
					},
					legend: {
						data: ['内资', '外资'],
						icon: "circle",
						itemHeight: 40,
						itemWidth: 40,
						right: 350,
						top: "38%",
						bottom: 20,
						height: 80,
						width:90,
						textStyle: {
							color: "#fff",
							fontSize: 50
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
							radius: '89%',
							startAngle: 314,
							endAngle: -45,
							min: 0,
							max: 100,
							label: {
								position: 'inner',
								textStyle:{fontSize:50}
							},
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
								interval:0,
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
							radius: [80, 207],
							center: ['35%', '50%'],
							roseType: 'radius',
							label: {
								position: 'inner',
								textStyle:{fontSize:50}
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

			}else {
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
						right: 50,
						top: "30%",
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
							return name + "\n" + clientcounts[index];
						}
					},
					series: [
						{
							name: '管控率',
							type: 'gauge',
							center: ['30%', '50%'],
							radius: '79%',
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
								interval:0,
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
							center: ['30%', '50%'],
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
			}

            var arr=mydata.arr;
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
	setTimeout(function (){
		window.onresize = function () {
		myChartZZT.resize();
		}
	},200)
    //初始化数据
	if(screen.width > 7600) {
		var optionZZT = {
			tooltip: {
				textStyle:{
					fontSize: 60
				},
				trigger: 'axis',
				axisPointer: {
					type: 'shadow'
				}
			},
			grid: {
				top: '5%',
				left: '3%',
				right: '4%',
				bottom: '3%',
				containLabel: true
			},
			xAxis: {
				boundaryGap: ['0%', '5%'],//留白大小，坐标轴两边留白
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
				boundaryGap: ['5%', '5%'],//留白大小，坐标轴两边留白
				show : true,
				type: 'category',
				data: [],
				splitLine: {show: false},
				axisLabel: {
					interval:0,
					show: true,
					textStyle: {
						color: '#00ffff',
						fontSize: 60,
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
					fontSize: 50,
				}
			},
			series: [
				{
					name: '数量',
					type: 'bar',
					data: [],
					barWidth: 54,
					barGap: 10,
					smooth: true,
					label: {
						normal: {
							show: true,
							position: 'right',
							offset: [5, -2],
							textStyle: {
								color: '#00ffff',//#00ffff
								fontSize: 50
							}
						}
					},
					itemStyle: {
						emphasis: {
							barBorderRadius: 30
						},
						normal: {
							barBorderRadius: 37,
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
	}else{
		var optionZZT = {
			tooltip: {
				trigger: 'axis',
				axisPointer: {
					type: 'shadow'
				}
			},
			grid: {
				top: '5%',
				left: '3%',
				right: '4%',
				bottom: '3%',
				containLabel: true
			},
			xAxis: {
				boundaryGap: ['0%', '5%'],//留白大小，坐标轴两边留白
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
				boundaryGap: ['5%', '5%'],//留白大小，坐标轴两边留白
				show : true,
				type: 'category',
				data: [],
				splitLine: {show: false},
				axisLabel: {
					interval:0,
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
	}

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
            var cont="<div style=\"color: #00ffff;width: 100%;height: 100%;line-height: 5.3vh;\">"+mydata.tmoney+"</div>"

            $("#dqtzje").html(cont);
            $("#ndjhtze").html(mydata.pmoney);
			
			document.getElementById("ndjhtze").style.fontSize = "1.9vh";
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
            if(res!=''){
                for (var i = 0; i < res.length; i++){
                    var isimg="";
                    if(res[i].isimg==true){
                        isimg+="<img src=\"<%=basePath %>dataview/img/hot.png\" >";

                    }
                    content+="<li style=\"cursor:pointer\" onclick=\"showHotNews('"+res[i].title+"','"+res[i].no+"','"+res[i].table+"','"+res[i].field+"','"+res[i].pkvalue+"')\"><img src=\"<%=basePath %>dataview/img/sm_circle.png\" />"+res[i].title+
                        isimg+"</li>";

                }
            }
            $("#rdywlist").html(content);

        },
        error : function(html) {
        }
    });


    function showHotNews(title,no,table,field,pkvalue){
        // alert(no);
        aweto.ajax(basePath+"zk/BigDataVies/findSingleNews.ajax",{no:no,table:table,field:field,pkvalue:pkvalue},true,function(data){
            $("#mybktitle").html(title);
            $("#mybkdesc").html(data.data.content);
        });
        $(".info_title").html("热点要闻");
        document.getElementById("search02").style.display = 'block';
    }

    //人员搜索
    var value="";
    $("#searchContent").bind('input propertychange', function() {
        value=$("#searchContent").val();
        findRYLB(value);
    });

    //获得人员列表数据
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
                    content+=" <tr onclick='openInfo("+res[i].id+")'> <td style='width: 15%;'>"+
                        res[i].name+"</td><td style='width: 45%;'>"+
                        res[i].postname+"</td><td style='width: 20%;'>"+
                        res[i].phone+"</td><td style='width: 10%;'>"+
                        res[i].sex+"</td><td style='width:10%;'>"+
                        res[i].age+"</td> </tr>";

                }
                $("#thbody").html(content);

            },
            error : function(html) {
            }
        });
    }

    // findRYLB(value);

    //经济运行
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
        var title="<img src=\"<%=basePath %>dataview/img/left_sq.png\" onclick=\"leftChange()\" />"+"<div style='padding:0vh 1vh;height:2vh;'>"+res.title+"</div>"+"<img src=\"<%=basePath %>dataview/img/right_sq.png\" onclick=\"rightChange()\" />";
		document.getElementById("jjyxbt").innerHTML = title
		if(screen.width > 7600){
			var optionjjyx = {
				title: {
					text: res.unit,
					textStyle: {
						color:"#fff",
						fontSize:60,
						fontWeight: 30,
					},
				},
				color: ['#3398DB'],
				tooltip: {
					textStyle:{
						fontSize: 60,
						itemWidth:40,
					},
					axisPointer: {            // 坐标轴指示器，坐标轴触发有效
						type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
					}
				},
				
				grid: {
					top: '20%',
					left: '2%',
					right: '2%',
					bottom: '5%',
					containLabel: true
				},
				xAxis: {
					type: 'category',
					data: res.yearList,
					axisTick: {
						alignWithLabel: true
					},
					axisTick: {show: false},
					axisLine:{
						lineStyle:{
							show:false,
							fontSize:50,
							fontWeight: 300,
							color:'#fff', //横轴上的颜色
						}
					},
					axisLabel: {
						interval:0,
						textStyle: {
							fontSize:50,
							color: '#fff'
						}
					},
				},
				yAxis: {
					type: 'value',
					axisTick: {show: false},
					axisLine:{
						show: false,  // 不显示y轴
						lineStyle:{
							color:'#fff', //纵轴上的颜色
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
						interval:0,
						textStyle: {
							fontSize:60,
							color: '#fff'
						}
					},
				},
				series: [
					{
						type: 'bar',
						barWidth: '30%',
						data:res.numList,
						itemStyle: {   // 柱子渐变色
							normal: {
								barBorderRadius: 37,
								color: new echarts.graphic.LinearGradient(
									0, 0, 0, 1,
									[
										{offset: 0, color: '#65dfe3'},
										{offset: 1, color: '#0482df'}

									]
								),
								label: {
									show: true,
									position: 'top',
									textStyle: {
										color: '#fff',
										fontSize: 60,

									}
								}
							}
						}
					},
				]
			};
		}else{
			var optionjjyx = {
				title: {
					// text: title,
					text: res.unit,
					textStyle: {
						color:"#fff",
						fontSize:12,
						fontWeight: 30,
					},
				},
				color: ['#3398DB'],
				tooltip: {
					axisPointer: {            // 坐标轴指示器，坐标轴触发有效
						type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
					}
				},
				grid: {
					top: '20%',
					left: '2%',
					right: '2%',
					bottom: '5%',
					containLabel: true
				},
				xAxis: {
					type: 'category',

					data: res.yearList,
					axisTick: {
						alignWithLabel: true
					},
					axisTick: {show: false},
					axisLine:{
						lineStyle:{
							show:false,
							fontSize:12,
							fontWeight: 30,
							color:'#0D2B5C', //横轴上的颜色
						}
					},
					axisLabel: {
						interval:0,
						textStyle: {
							fontSize:12,
							color: '#fff'
						}
					},
				},
				yAxis: {
					type: 'value',
					// y轴最大值结尾处添加单位name
					// name: res.unit,
					// nameLocation: "end",
					// nameTextStyle:{
						// color:"#fff",
						// fontSize:12,
						// fontWeight: 30,
					// },
					axisTick: {show: false},
					axisLine:{
						show: false,  // 不显示y轴
						lineStyle:{
							color:'#0D2B5C', //纵轴上的颜色
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
						interval:0,
						textStyle: {
							fontSize:12,
							color: '#fff'
						}
					},
				},
				series: [
					{
						type: 'bar',
						barWidth: '30%',
						data:res.numList,
						itemStyle: {   // 柱子渐变色
							normal: {
								barBorderRadius: 7,
								color: new echarts.graphic.LinearGradient(
									0, 0, 0, 1,
									[
										{offset: 0, color: '#65dfe3'},
										{offset: 1, color: '#0482df'}

									]
								),
								
								label: {
									show: true,
									position: 'top',
									textStyle: {
										color: '#fff',
										fontSize: 12,

									}
								}
							}
						}
					},
				]
			};
		}
		//数据总览初始化echarts实例
		var myChartjjyx = echarts.init(document.getElementById('jjyx_echart'));
		//使用制定的配置项和数据显示图表
		myChartjjyx.setOption(optionjjyx);
		setTimeout(function (){
			window.onresize = function () {
			myChartjjyx.resize();
			}
		},200)
    }
	
	


		


</script>

</body>
</html>

