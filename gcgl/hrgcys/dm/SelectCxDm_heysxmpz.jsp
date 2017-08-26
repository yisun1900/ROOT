<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Dm_heysxmpzCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收版本号</td> 
  <td width="31%"> 
    <select name="gcysbbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gcysbbh,gcysbbmc from dm_hegcysbb order by gcysbbh","");
%>
    </select>
  </td>
  <td align="right" width="19%">验收版本名称</td> 
  <td width="31%"> 
    <input type="text" name="dm_hegcysbb_gcysbbmc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收项目编码</td> 
  <td width="31%"> 
    <select name="gcysxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gcysxmbm,gcysxmmc from dm_heysxm order by gcysxmbm","");
%>
    </select>
  </td>
  <td align="right" width="19%">验收项目名称</td> 
  <td width="31%"> 
    <input type="text" name="gcysxmmc" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项数量</td> 
  <td width="31%"> 
    <input type="text" name="yszxsl" size="20" maxlength="8" >
  </td>
  <td align="right" width="19%">验收子项1名称</td> 
  <td width="31%"> 
    <input type="text" name="ys1" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项1</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx1","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项1说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp1" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项1说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm1" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项2名称</td> 
  <td width="31%"> 
    <input type="text" name="ys2" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项2</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx2","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项2说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp2" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项2说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm2" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项3名称</td> 
  <td width="31%"> 
    <input type="text" name="ys3" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项3</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx3","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项3说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp3" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项3说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm3" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项4名称</td> 
  <td width="31%"> 
    <input type="text" name="ys4" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项4</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx4","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项4说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp4" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项4说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm4" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项5名称</td> 
  <td width="31%"> 
    <input type="text" name="ys5" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项5</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx5","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项5说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp5" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项5说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm5" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项6名称</td> 
  <td width="31%"> 
    <input type="text" name="ys6" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项6</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx6","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项6说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp6" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项6说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm6" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项7名称</td> 
  <td width="31%"> 
    <input type="text" name="ys7" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项7</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx7","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项7说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp7" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项7说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm7" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项8名称</td> 
  <td width="31%"> 
    <input type="text" name="ys8" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项8</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx8","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项8说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp8" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项8说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm8" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项9名称</td> 
  <td width="31%"> 
    <input type="text" name="ys9" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项9</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx9","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项9说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp9" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项9说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm9" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项10名称</td> 
  <td width="31%"> 
    <input type="text" name="ys10" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项10</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx10","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项10说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp10" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项10说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm10" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项11名称</td> 
  <td width="31%"> 
    <input type="text" name="ys11" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项11</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx11","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项11说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp11" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项11说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm11" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项12名称</td> 
  <td width="31%"> 
    <input type="text" name="ys12" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项12</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx12","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项12说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp12" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项12说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm12" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项13名称</td> 
  <td width="31%"> 
    <input type="text" name="ys13" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项13</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx13","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项13说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp13" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项13说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm13" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项14名称</td> 
  <td width="31%"> 
    <input type="text" name="ys14" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项14</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx14","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项14说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp14" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项14说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm14" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项15名称</td> 
  <td width="31%"> 
    <input type="text" name="ys15" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项15</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx15","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项15说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp15" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项15说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm15" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项16名称</td> 
  <td width="31%"> 
    <input type="text" name="ys16" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项16</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx16","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项16说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp16" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项16说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm16" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项17名称</td> 
  <td width="31%"> 
    <input type="text" name="ys17" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项17</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx17","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项17说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp17" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项17说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm17" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项18名称</td> 
  <td width="31%"> 
    <input type="text" name="ys18" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项18</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx18","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项18说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp18" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项18说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm18" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项19名称</td> 
  <td width="31%"> 
    <input type="text" name="ys19" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项19</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx19","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项19说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp19" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项19说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm19" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项20名称</td> 
  <td width="31%"> 
    <input type="text" name="ys20" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项20</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx20","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项20说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp20" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项20说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm20" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项21名称</td> 
  <td width="31%"> 
    <input type="text" name="ys21" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项21</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx21","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项21说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp21" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项21说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm21" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项22名称</td> 
  <td width="31%"> 
    <input type="text" name="ys22" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项22</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx22","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项22说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp22" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项22说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm22" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项23名称</td> 
  <td width="31%"> 
    <input type="text" name="ys23" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项23</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx23","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项23说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp23" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项23说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm23" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项24名称</td> 
  <td width="31%"> 
    <input type="text" name="ys24" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项24</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx24","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项24说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp24" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项24说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm24" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项25名称</td> 
  <td width="31%"> 
    <input type="text" name="ys25" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项25</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx25","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项25说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp25" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项25说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm25" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项26名称</td> 
  <td width="31%"> 
    <input type="text" name="ys26" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项26</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx26","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项26说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp26" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项26说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm26" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项27名称</td> 
  <td width="31%"> 
    <input type="text" name="ys27" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项27</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx27","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项27说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp27" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项27说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm27" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项28名称</td> 
  <td width="31%"> 
    <input type="text" name="ys28" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项28</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx28","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项28说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp28" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项28说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm28" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项29名称</td> 
  <td width="31%"> 
    <input type="text" name="ys29" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项29</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx29","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项29说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp29" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项29说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm29" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项30名称</td> 
  <td width="31%"> 
    <input type="text" name="ys30" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项30</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx30","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项30说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp30" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项30说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm30" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项31名称</td> 
  <td width="31%"> 
    <input type="text" name="ys31" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项31</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx31","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项31说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp31" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项31说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm31" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项32名称</td> 
  <td width="31%"> 
    <input type="text" name="ys32" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项32</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx32","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项32说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp32" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项32说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm32" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项33名称</td> 
  <td width="31%"> 
    <input type="text" name="ys33" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项33</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx33","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项33说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp33" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项33说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm33" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项34名称</td> 
  <td width="31%"> 
    <input type="text" name="ys34" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项34</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx34","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项34说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp34" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项34说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm34" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项35名称</td> 
  <td width="31%"> 
    <input type="text" name="ys35" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项35</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx35","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项35说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp35" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项35说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm35" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项36名称</td> 
  <td width="31%"> 
    <input type="text" name="ys36" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项36</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx36","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项36说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp36" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项36说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm36" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项37名称</td> 
  <td width="31%"> 
    <input type="text" name="ys37" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项37</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx37","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项37说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp37" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项37说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm37" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项38名称</td> 
  <td width="31%"> 
    <input type="text" name="ys38" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项38</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx38","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项38说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp38" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项38说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm38" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项39名称</td> 
  <td width="31%"> 
    <input type="text" name="ys39" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项39</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx39","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项39说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp39" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项39说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm39" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项40名称</td> 
  <td width="31%"> 
    <input type="text" name="ys40" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项40</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx40","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项40说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp40" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项40说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm40" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项41名称</td> 
  <td width="31%"> 
    <input type="text" name="ys41" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项41</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx41","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项41说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp41" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项41说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm41" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项42名称</td> 
  <td width="31%"> 
    <input type="text" name="ys42" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项42</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx42","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项42说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp42" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项42说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm42" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项43名称</td> 
  <td width="31%"> 
    <input type="text" name="ys43" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项43</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx43","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项43说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp43" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项43说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm43" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项44名称</td> 
  <td width="31%"> 
    <input type="text" name="ys44" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项44</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx44","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项44说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp44" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项44说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm44" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项45名称</td> 
  <td width="31%"> 
    <input type="text" name="ys45" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项45</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx45","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项45说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp45" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项45说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm45" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项46名称</td> 
  <td width="31%"> 
    <input type="text" name="ys46" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项46</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx46","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项46说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp46" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项46说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm46" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项47名称</td> 
  <td width="31%"> 
    <input type="text" name="ys47" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项47</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx47","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项47说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp47" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项47说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm47" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项48名称</td> 
  <td width="31%"> 
    <input type="text" name="ys48" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项48</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx48","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项48说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp48" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项48说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm48" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项49名称</td> 
  <td width="31%"> 
    <input type="text" name="ys49" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项49</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx49","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项49说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp49" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项49说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm49" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">验收子项50名称</td> 
  <td width="31%"> 
    <input type="text" name="ys50" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项50</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx50","0+否&1+必验项","");
%>
  </td>
  <td align="right" width="19%">验收子项50说明图片</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp50" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项50说明文字</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm50" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">&nbsp;  </td>
  <td width="31%">&nbsp;  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">
  </td>
</tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.yszxsl, "验收子项数量"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
