<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertDm_heysxmpz.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
    </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收版本号</td> 
  <td width="31%"> 
    <select name="gcysbbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gcysbbh,gcysbbmc from dm_hegcysbb order by gcysbbh","");
%>
    </select>  </td>
  <td align="right" width="19%">验收项目编码</td> 
  <td width="31%"> 
    <select name="gcysxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gcysxmbm,gcysxmmc from dm_heysxm order by gcysxmbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项数量</td> 
  <td width="31%"><input type="text" name="yszxsl" value="" size="20" maxlength="8" ></td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项1名称</td>
  <td colspan="3"><input type="text" name="ys1" value="" size="73" maxlength="200" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">必验项1</td> 
  <td width="31%"><input type="radio" name="byx1"  value="0">
    否
      <input type="radio" name="byx1"  value="1">
      必验项 </td>
  <td align="right" width="19%">验收子项1说明图片</td> 
  <td width="31%"><input type="text" name="ysbztp1" value="" size="20" maxlength="800" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项1说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm1" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项2名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys2" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项2</td>
  <td><input type="radio" name="byx2"  value="0">
    否
      <input type="radio" name="byx2"  value="1">
      必验项 </td>
  <td align="right">验收子项2说明图片</td>
  <td><input type="text" name="ysbztp2" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项2说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm2" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项3名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys3" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项3</td>
  <td><input type="radio" name="byx3"  value="0">
    否
      <input type="radio" name="byx3"  value="1">
      必验项 </td>
  <td align="right">验收子项3说明图片</td>
  <td><input type="text" name="ysbztp3" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项3说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm3" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项4名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys4" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项4</td>
  <td><input type="radio" name="byx4"  value="0">
    否
      <input type="radio" name="byx4"  value="1">
      必验项 </td>
  <td align="right">验收子项4说明图片</td>
  <td><input type="text" name="ysbztp4" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项4说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm4" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项5名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys5" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项5</td>
  <td><input type="radio" name="byx5"  value="0">
    否
      <input type="radio" name="byx5"  value="1">
      必验项 </td>
  <td align="right">验收子项5说明图片</td>
  <td><input type="text" name="ysbztp5" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项5说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm5" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项6名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys6" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项6</td>
  <td><input type="radio" name="byx6"  value="0">
    否
      <input type="radio" name="byx6"  value="1">
      必验项 </td>
  <td align="right">验收子项6说明图片</td>
  <td><input type="text" name="ysbztp6" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项6说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm6" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项7名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys7" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项7</td>
  <td><input type="radio" name="byx7"  value="0">
    否
      <input type="radio" name="byx7"  value="1">
      必验项 </td>
  <td align="right">验收子项7说明图片</td>
  <td><input type="text" name="ysbztp7" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项7说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm7" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项8名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys8" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项8</td>
  <td><input type="radio" name="byx8"  value="0">
    否
      <input type="radio" name="byx8"  value="1">
      必验项 </td>
  <td align="right">验收子项8说明图片</td>
  <td><input type="text" name="ysbztp8" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项8说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm8" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项9名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys9" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项9</td>
  <td><input type="radio" name="byx9"  value="0">
    否
      <input type="radio" name="byx9"  value="1">
      必验项 </td>
  <td align="right">验收子项9说明图片</td>
  <td><input type="text" name="ysbztp9" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项9说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm9" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项10名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys10" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项10</td>
  <td><input type="radio" name="byx10"  value="0">
    否
      <input type="radio" name="byx10"  value="1">
      必验项 </td>
  <td align="right">验收子项10说明图片</td>
  <td><input type="text" name="ysbztp10" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项10说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm10" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项11名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys11" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项11</td>
  <td><input type="radio" name="byx11"  value="0">
    否
      <input type="radio" name="byx11"  value="1">
      必验项 </td>
  <td align="right">验收子项11说明图片</td>
  <td><input type="text" name="ysbztp11" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项11说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm11" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项12名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys12" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项12</td>
  <td><input type="radio" name="byx12"  value="0">
    否
      <input type="radio" name="byx12"  value="1">
      必验项 </td>
  <td align="right">验收子项12说明图片</td>
  <td><input type="text" name="ysbztp12" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项12说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm12" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项13名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys13" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项13</td>
  <td><input type="radio" name="byx13"  value="0">
    否
      <input type="radio" name="byx13"  value="1">
      必验项 </td>
  <td align="right">验收子项13说明图片</td>
  <td><input type="text" name="ysbztp13" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项13说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm13" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项14名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys14" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项14</td>
  <td><input type="radio" name="byx14"  value="0">
    否
      <input type="radio" name="byx14"  value="1">
      必验项 </td>
  <td align="right">验收子项14说明图片</td>
  <td><input type="text" name="ysbztp14" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项14说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm14" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项15名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys15" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项15</td>
  <td><input type="radio" name="byx15"  value="0">
    否
      <input type="radio" name="byx15"  value="1">
      必验项 </td>
  <td align="right">验收子项15说明图片</td>
  <td><input type="text" name="ysbztp15" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项15说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm15" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项16名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys16" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项16</td>
  <td><input type="radio" name="byx16"  value="0">
    否
      <input type="radio" name="byx16"  value="1">
      必验项 </td>
  <td align="right">验收子项16说明图片</td>
  <td><input type="text" name="ysbztp16" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项16说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm16" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项17名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys17" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项17</td>
  <td><input type="radio" name="byx17"  value="0">
    否
      <input type="radio" name="byx17"  value="1">
      必验项 </td>
  <td align="right">验收子项17说明图片</td>
  <td><input type="text" name="ysbztp17" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项17说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm17" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项18名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys18" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项18</td>
  <td><input type="radio" name="byx18"  value="0">
    否
      <input type="radio" name="byx18"  value="1">
      必验项</td>
  <td align="right">验收子项18说明图片</td>
  <td><input type="text" name="ysbztp18" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项18说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm18" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项19名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys19" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项19</td>
  <td><input type="radio" name="byx19"  value="0">
    否
      <input type="radio" name="byx19"  value="1">
      必验项 </td>
  <td align="right">验收子项19说明图片</td>
  <td><input type="text" name="ysbztp19" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项19说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm19" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项20名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys20" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项20</td>
  <td><input type="radio" name="byx20"  value="0">
    否
      <input type="radio" name="byx20"  value="1">
      必验项 </td>
  <td align="right">验收子项20说明图片</td>
  <td><input type="text" name="ysbztp20" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项20说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm20" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项21名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys21" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项21</td>
  <td><input type="radio" name="byx21"  value="0">
    否
      <input type="radio" name="byx21"  value="1">
      必验项</td>
  <td align="right">验收子项21说明图片</td>
  <td><input type="text" name="ysbztp21" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项21说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm21" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项22名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys22" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项22</td>
  <td><input type="radio" name="byx22"  value="0">
    否
      <input type="radio" name="byx22"  value="1">
      必验项 </td>
  <td align="right">验收子项22说明图片</td>
  <td><input type="text" name="ysbztp22" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项22说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm22" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项23名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys23" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项23</td>
  <td><input type="radio" name="byx23"  value="0">
    否
      <input type="radio" name="byx23"  value="1">
      必验项 </td>
  <td align="right">验收子项23说明图片</td>
  <td><input type="text" name="ysbztp23" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项23说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm23" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项24名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys24" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项24</td>
  <td><input type="radio" name="byx24"  value="0">
    否
      <input type="radio" name="byx24"  value="1">
      必验项 </td>
  <td align="right">验收子项24说明图片</td>
  <td><input type="text" name="ysbztp24" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项24说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm24" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项25名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys25" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项25</td>
  <td><input type="radio" name="byx25"  value="0">
    否
      <input type="radio" name="byx25"  value="1">
      必验项 </td>
  <td align="right">验收子项25说明图片</td>
  <td><input type="text" name="ysbztp25" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项25说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm25" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项26名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys26" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项26</td>
  <td><input type="radio" name="byx26"  value="0">
    否
      <input type="radio" name="byx26"  value="1">
      必验项 </td>
  <td align="right">验收子项26说明图片</td>
  <td><input type="text" name="ysbztp26" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项26说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm26" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项27名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys27" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项27</td>
  <td><input type="radio" name="byx27"  value="0">
    否
      <input type="radio" name="byx27"  value="1">
      必验项 </td>
  <td align="right">验收子项27说明图片</td>
  <td><input type="text" name="ysbztp27" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项27说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm27" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项28名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys28" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项28</td>
  <td><input type="radio" name="byx28"  value="0">
    否
      <input type="radio" name="byx28"  value="1">
      必验项 </td>
  <td align="right">验收子项28说明图片</td>
  <td><input type="text" name="ysbztp28" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项28说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm28" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项29名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys29" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项29</td>
  <td><input type="radio" name="byx29"  value="0">
    否
      <input type="radio" name="byx29"  value="1">
      必验项 </td>
  <td align="right">验收子项29说明图片</td>
  <td><input type="text" name="ysbztp29" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项29说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm29" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项30名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys30" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项30</td>
  <td><input type="radio" name="byx30"  value="0">
    否
      <input type="radio" name="byx30"  value="1">
      必验项 </td>
  <td align="right">验收子项30说明图片</td>
  <td><input type="text" name="ysbztp30" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项30说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm30" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项31名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys31" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项31</td>
  <td><input type="radio" name="byx31"  value="0">
    否
      <input type="radio" name="byx31"  value="1">
      必验项 </td>
  <td align="right">验收子项31说明图片</td>
  <td><input type="text" name="ysbztp31" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项31说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm31" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项32名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys32" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项32</td>
  <td><input type="radio" name="byx32"  value="0">
    否
      <input type="radio" name="byx32"  value="1">
      必验项 </td>
  <td align="right">验收子项32说明图片</td>
  <td><input type="text" name="ysbztp32" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项32说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm32" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项33名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys33" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项33</td>
  <td><input type="radio" name="byx33"  value="0">
    否
      <input type="radio" name="byx33"  value="1">
      必验项 </td>
  <td align="right">验收子项33说明图片</td>
  <td><input type="text" name="ysbztp33" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项33说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm33" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项34名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys34" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项34</td>
  <td><input type="radio" name="byx34"  value="0">
    否
      <input type="radio" name="byx34"  value="1">
      必验项 </td>
  <td align="right">验收子项34说明图片</td>
  <td><input type="text" name="ysbztp34" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项34说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm34" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项35名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys35" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项35</td>
  <td><input type="radio" name="byx35"  value="0">
    否
      <input type="radio" name="byx35"  value="1">
      必验项 </td>
  <td align="right">验收子项35说明图片</td>
  <td><input type="text" name="ysbztp35" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项35说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm35" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项36名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys36" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项36</td>
  <td><input type="radio" name="byx36"  value="0">
    否
      <input type="radio" name="byx36"  value="1">
      必验项 </td>
  <td align="right">验收子项36说明图片</td>
  <td><input type="text" name="ysbztp36" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项36说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm36" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项37名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys37" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项37</td>
  <td><input type="radio" name="byx37"  value="0">
    否
      <input type="radio" name="byx37"  value="1">
      必验项 </td>
  <td align="right">验收子项37说明图片</td>
  <td><input type="text" name="ysbztp37" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项37说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm37" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项38名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys38" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项38</td>
  <td><input type="radio" name="byx38"  value="0">
    否
      <input type="radio" name="byx38"  value="1">
      必验项 </td>
  <td align="right">验收子项38说明图片</td>
  <td><input type="text" name="ysbztp38" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项38说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm38" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项39名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys39" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项39</td>
  <td><input type="radio" name="byx39"  value="0">
    否
      <input type="radio" name="byx39"  value="1">
      必验项 </td>
  <td align="right">验收子项39说明图片</td>
  <td><input type="text" name="ysbztp39" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项39说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm39" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项40名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys40" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项40</td>
  <td><input type="radio" name="byx40"  value="0">
    否
      <input type="radio" name="byx40"  value="1">
      必验项</td>
  <td align="right">验收子项40说明图片</td>
  <td><input type="text" name="ysbztp40" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项40说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm40" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项41名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys41" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项41</td>
  <td><input type="radio" name="byx41"  value="0">
    否
      <input type="radio" name="byx41"  value="1">
      必验项 </td>
  <td align="right">验收子项41说明图片</td>
  <td><input type="text" name="ysbztp41" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项41说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm41" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项42名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys42" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项42</td>
  <td><input type="radio" name="byx42"  value="0">
    否
      <input type="radio" name="byx42"  value="1">
      必验项 </td>
  <td align="right">验收子项42说明图片</td>
  <td><input type="text" name="ysbztp42" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项42说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm42" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项43名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys43" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项43</td>
  <td><input type="radio" name="byx43"  value="0">
    否
      <input type="radio" name="byx43"  value="1">
      必验项 </td>
  <td align="right">验收子项43说明图片</td>
  <td><input type="text" name="ysbztp43" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项43说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm43" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项44名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys44" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项44</td>
  <td><input type="radio" name="byx44"  value="0">
    否
      <input type="radio" name="byx44"  value="1">
      必验项</td>
  <td align="right">验收子项44说明图片</td>
  <td><input type="text" name="ysbztp44" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项44说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm44" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项45名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys45" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项45</td>
  <td><input type="radio" name="byx45"  value="0">
    否
      <input type="radio" name="byx45"  value="1">
      必验项 </td>
  <td align="right">验收子项45说明图片</td>
  <td><input type="text" name="ysbztp45" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项45说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm45" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项46名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys46" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项46</td>
  <td><input type="radio" name="byx46"  value="0">
    否
      <input type="radio" name="byx46"  value="1">
      必验项 </td>
  <td align="right">验收子项46说明图片</td>
  <td><input type="text" name="ysbztp46" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项46说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm46" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项47名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys47" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项47</td>
  <td><input type="radio" name="byx47"  value="0">
    否
      <input type="radio" name="byx47"  value="1">
      必验项 </td>
  <td align="right">验收子项47说明图片</td>
  <td><input type="text" name="ysbztp47" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项47说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm47" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项48名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys48" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项48</td>
  <td><input type="radio" name="byx48"  value="0">
    否
      <input type="radio" name="byx48"  value="1">
      必验项</td>
  <td align="right">验收子项48说明图片</td>
  <td><input type="text" name="ysbztp48" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项48说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm48" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项49名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys49" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项49</td>
  <td><input type="radio" name="byx49"  value="0">
    否
      <input type="radio" name="byx49"  value="1">
      必验项</td>
  <td align="right">验收子项49说明图片</td>
  <td><input type="text" name="ysbztp49" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项49说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm49" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项50名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys50" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项50</td>
  <td><input type="radio" name="byx50"  value="0">
    否
      <input type="radio" name="byx50"  value="1">
      必验项 </td>
  <td align="right">验收子项50说明图片</td>
  <td><input type="text" name="ysbztp50" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收子项50说明文字</td> 
  <td colspan="3"><input type="text" name="ysbzsm50" value="" size="73" maxlength="1000" ></td>
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
	if(	javaTrim(FormName.gcysbbh)=="") {
		alert("请选择[验收版本号]！");
		FormName.gcysbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gcysxmbm)=="") {
		alert("请选择[验收项目编码]！");
		FormName.gcysxmbm.focus();
		return false;
	}

	if(	javaTrim(FormName.yszxsl)=="") {
		alert("请输入[验收子项数量]！");
		FormName.yszxsl.focus();
		return false;
	}
	if(!(isNumber(FormName.yszxsl, "验收子项数量"))) {
		return false;
	}

	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
