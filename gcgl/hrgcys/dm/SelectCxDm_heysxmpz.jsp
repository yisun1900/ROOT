<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Dm_heysxmpzCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">���հ汾��</td> 
  <td width="31%"> 
    <select name="gcysbbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gcysbbh,gcysbbmc from dm_hegcysbb order by gcysbbh","");
%>
    </select>
  </td>
  <td align="right" width="19%">���հ汾����</td> 
  <td width="31%"> 
    <input type="text" name="dm_hegcysbb_gcysbbmc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������Ŀ����</td> 
  <td width="31%"> 
    <select name="gcysxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gcysxmbm,gcysxmmc from dm_heysxm order by gcysxmbm","");
%>
    </select>
  </td>
  <td align="right" width="19%">������Ŀ����</td> 
  <td width="31%"> 
    <input type="text" name="gcysxmmc" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������������</td> 
  <td width="31%"> 
    <input type="text" name="yszxsl" size="20" maxlength="8" >
  </td>
  <td align="right" width="19%">��������1����</td> 
  <td width="31%"> 
    <input type="text" name="ys1" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������1</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx1","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������1˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp1" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������1˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm1" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������2����</td> 
  <td width="31%"> 
    <input type="text" name="ys2" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������2</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx2","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������2˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp2" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������2˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm2" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������3����</td> 
  <td width="31%"> 
    <input type="text" name="ys3" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������3</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx3","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������3˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp3" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������3˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm3" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������4����</td> 
  <td width="31%"> 
    <input type="text" name="ys4" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������4</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx4","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������4˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp4" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������4˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm4" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������5����</td> 
  <td width="31%"> 
    <input type="text" name="ys5" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������5</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx5","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������5˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp5" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������5˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm5" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������6����</td> 
  <td width="31%"> 
    <input type="text" name="ys6" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������6</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx6","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������6˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp6" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������6˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm6" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������7����</td> 
  <td width="31%"> 
    <input type="text" name="ys7" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������7</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx7","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������7˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp7" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������7˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm7" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������8����</td> 
  <td width="31%"> 
    <input type="text" name="ys8" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������8</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx8","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������8˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp8" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������8˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm8" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������9����</td> 
  <td width="31%"> 
    <input type="text" name="ys9" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������9</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx9","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������9˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp9" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������9˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm9" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������10����</td> 
  <td width="31%"> 
    <input type="text" name="ys10" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������10</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx10","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������10˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp10" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������10˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm10" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������11����</td> 
  <td width="31%"> 
    <input type="text" name="ys11" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������11</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx11","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������11˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp11" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������11˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm11" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������12����</td> 
  <td width="31%"> 
    <input type="text" name="ys12" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������12</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx12","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������12˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp12" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������12˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm12" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������13����</td> 
  <td width="31%"> 
    <input type="text" name="ys13" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������13</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx13","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������13˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp13" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������13˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm13" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������14����</td> 
  <td width="31%"> 
    <input type="text" name="ys14" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������14</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx14","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������14˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp14" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������14˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm14" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������15����</td> 
  <td width="31%"> 
    <input type="text" name="ys15" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������15</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx15","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������15˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp15" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������15˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm15" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������16����</td> 
  <td width="31%"> 
    <input type="text" name="ys16" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������16</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx16","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������16˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp16" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������16˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm16" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������17����</td> 
  <td width="31%"> 
    <input type="text" name="ys17" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������17</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx17","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������17˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp17" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������17˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm17" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������18����</td> 
  <td width="31%"> 
    <input type="text" name="ys18" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������18</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx18","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������18˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp18" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������18˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm18" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������19����</td> 
  <td width="31%"> 
    <input type="text" name="ys19" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������19</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx19","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������19˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp19" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������19˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm19" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������20����</td> 
  <td width="31%"> 
    <input type="text" name="ys20" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������20</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx20","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������20˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp20" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������20˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm20" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������21����</td> 
  <td width="31%"> 
    <input type="text" name="ys21" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������21</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx21","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������21˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp21" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������21˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm21" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������22����</td> 
  <td width="31%"> 
    <input type="text" name="ys22" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������22</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx22","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������22˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp22" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������22˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm22" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������23����</td> 
  <td width="31%"> 
    <input type="text" name="ys23" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������23</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx23","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������23˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp23" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������23˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm23" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������24����</td> 
  <td width="31%"> 
    <input type="text" name="ys24" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������24</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx24","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������24˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp24" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������24˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm24" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������25����</td> 
  <td width="31%"> 
    <input type="text" name="ys25" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������25</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx25","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������25˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp25" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������25˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm25" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������26����</td> 
  <td width="31%"> 
    <input type="text" name="ys26" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������26</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx26","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������26˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp26" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������26˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm26" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������27����</td> 
  <td width="31%"> 
    <input type="text" name="ys27" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������27</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx27","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������27˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp27" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������27˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm27" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������28����</td> 
  <td width="31%"> 
    <input type="text" name="ys28" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������28</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx28","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������28˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp28" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������28˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm28" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������29����</td> 
  <td width="31%"> 
    <input type="text" name="ys29" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������29</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx29","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������29˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp29" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������29˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm29" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������30����</td> 
  <td width="31%"> 
    <input type="text" name="ys30" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������30</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx30","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������30˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp30" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������30˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm30" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������31����</td> 
  <td width="31%"> 
    <input type="text" name="ys31" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������31</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx31","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������31˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp31" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������31˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm31" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������32����</td> 
  <td width="31%"> 
    <input type="text" name="ys32" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������32</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx32","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������32˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp32" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������32˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm32" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������33����</td> 
  <td width="31%"> 
    <input type="text" name="ys33" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������33</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx33","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������33˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp33" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������33˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm33" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������34����</td> 
  <td width="31%"> 
    <input type="text" name="ys34" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������34</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx34","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������34˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp34" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������34˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm34" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������35����</td> 
  <td width="31%"> 
    <input type="text" name="ys35" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������35</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx35","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������35˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp35" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������35˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm35" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������36����</td> 
  <td width="31%"> 
    <input type="text" name="ys36" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������36</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx36","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������36˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp36" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������36˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm36" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������37����</td> 
  <td width="31%"> 
    <input type="text" name="ys37" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������37</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx37","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������37˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp37" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������37˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm37" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������38����</td> 
  <td width="31%"> 
    <input type="text" name="ys38" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������38</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx38","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������38˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp38" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������38˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm38" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������39����</td> 
  <td width="31%"> 
    <input type="text" name="ys39" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������39</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx39","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������39˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp39" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������39˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm39" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������40����</td> 
  <td width="31%"> 
    <input type="text" name="ys40" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������40</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx40","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������40˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp40" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������40˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm40" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������41����</td> 
  <td width="31%"> 
    <input type="text" name="ys41" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������41</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx41","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������41˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp41" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������41˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm41" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������42����</td> 
  <td width="31%"> 
    <input type="text" name="ys42" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������42</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx42","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������42˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp42" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������42˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm42" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������43����</td> 
  <td width="31%"> 
    <input type="text" name="ys43" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������43</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx43","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������43˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp43" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������43˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm43" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������44����</td> 
  <td width="31%"> 
    <input type="text" name="ys44" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������44</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx44","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������44˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp44" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������44˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm44" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������45����</td> 
  <td width="31%"> 
    <input type="text" name="ys45" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������45</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx45","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������45˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp45" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������45˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm45" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������46����</td> 
  <td width="31%"> 
    <input type="text" name="ys46" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������46</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx46","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������46˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp46" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������46˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm46" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������47����</td> 
  <td width="31%"> 
    <input type="text" name="ys47" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������47</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx47","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������47˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp47" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������47˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm47" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������48����</td> 
  <td width="31%"> 
    <input type="text" name="ys48" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������48</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx48","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������48˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp48" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������48˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm48" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������49����</td> 
  <td width="31%"> 
    <input type="text" name="ys49" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������49</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx49","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������49˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp49" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������49˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm49" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">��������50����</td> 
  <td width="31%"> 
    <input type="text" name="ys50" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������50</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "byx50","0+��&1+������","");
%>
  </td>
  <td align="right" width="19%">��������50˵��ͼƬ</td> 
  <td width="31%"> 
    <input type="text" name="ysbztp50" size="20" maxlength="800" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������50˵������</td> 
  <td width="31%"> 
    <input type="text" name="ysbzsm50" size="20" maxlength="1000" >
  </td>
  <td align="right" width="19%">&nbsp;  </td>
  <td width="31%">&nbsp;  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">
  </td>
</tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.yszxsl, "������������"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
