<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertDm_heysxmpz.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      </td>
    </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">���հ汾��</td> 
  <td width="31%"> 
    <select name="gcysbbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gcysbbh,gcysbbmc from dm_hegcysbb order by gcysbbh","");
%>
    </select>  </td>
  <td align="right" width="19%">������Ŀ����</td> 
  <td width="31%"> 
    <select name="gcysxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gcysxmbm,gcysxmmc from dm_heysxm order by gcysxmbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������������</td> 
  <td width="31%"><input type="text" name="yszxsl" value="" size="20" maxlength="8" ></td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��������1����</td>
  <td colspan="3"><input type="text" name="ys1" value="" size="73" maxlength="200" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������1</td> 
  <td width="31%"><input type="radio" name="byx1"  value="0">
    ��
      <input type="radio" name="byx1"  value="1">
      ������ </td>
  <td align="right" width="19%">��������1˵��ͼƬ</td> 
  <td width="31%"><input type="text" name="ysbztp1" value="" size="20" maxlength="800" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������1˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm1" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������2����</td> 
  <td colspan="3"> 
    <input type="text" name="ys2" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������2</td>
  <td><input type="radio" name="byx2"  value="0">
    ��
      <input type="radio" name="byx2"  value="1">
      ������ </td>
  <td align="right">��������2˵��ͼƬ</td>
  <td><input type="text" name="ysbztp2" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������2˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm2" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������3����</td> 
  <td colspan="3"> 
    <input type="text" name="ys3" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������3</td>
  <td><input type="radio" name="byx3"  value="0">
    ��
      <input type="radio" name="byx3"  value="1">
      ������ </td>
  <td align="right">��������3˵��ͼƬ</td>
  <td><input type="text" name="ysbztp3" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������3˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm3" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������4����</td> 
  <td colspan="3"> 
    <input type="text" name="ys4" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������4</td>
  <td><input type="radio" name="byx4"  value="0">
    ��
      <input type="radio" name="byx4"  value="1">
      ������ </td>
  <td align="right">��������4˵��ͼƬ</td>
  <td><input type="text" name="ysbztp4" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������4˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm4" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������5����</td> 
  <td colspan="3"> 
    <input type="text" name="ys5" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������5</td>
  <td><input type="radio" name="byx5"  value="0">
    ��
      <input type="radio" name="byx5"  value="1">
      ������ </td>
  <td align="right">��������5˵��ͼƬ</td>
  <td><input type="text" name="ysbztp5" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������5˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm5" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������6����</td> 
  <td colspan="3"> 
    <input type="text" name="ys6" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������6</td>
  <td><input type="radio" name="byx6"  value="0">
    ��
      <input type="radio" name="byx6"  value="1">
      ������ </td>
  <td align="right">��������6˵��ͼƬ</td>
  <td><input type="text" name="ysbztp6" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������6˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm6" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������7����</td> 
  <td colspan="3"> 
    <input type="text" name="ys7" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������7</td>
  <td><input type="radio" name="byx7"  value="0">
    ��
      <input type="radio" name="byx7"  value="1">
      ������ </td>
  <td align="right">��������7˵��ͼƬ</td>
  <td><input type="text" name="ysbztp7" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������7˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm7" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������8����</td> 
  <td colspan="3"> 
    <input type="text" name="ys8" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������8</td>
  <td><input type="radio" name="byx8"  value="0">
    ��
      <input type="radio" name="byx8"  value="1">
      ������ </td>
  <td align="right">��������8˵��ͼƬ</td>
  <td><input type="text" name="ysbztp8" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������8˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm8" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������9����</td> 
  <td colspan="3"> 
    <input type="text" name="ys9" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������9</td>
  <td><input type="radio" name="byx9"  value="0">
    ��
      <input type="radio" name="byx9"  value="1">
      ������ </td>
  <td align="right">��������9˵��ͼƬ</td>
  <td><input type="text" name="ysbztp9" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������9˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm9" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������10����</td> 
  <td colspan="3"> 
    <input type="text" name="ys10" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������10</td>
  <td><input type="radio" name="byx10"  value="0">
    ��
      <input type="radio" name="byx10"  value="1">
      ������ </td>
  <td align="right">��������10˵��ͼƬ</td>
  <td><input type="text" name="ysbztp10" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������10˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm10" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������11����</td> 
  <td colspan="3"> 
    <input type="text" name="ys11" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������11</td>
  <td><input type="radio" name="byx11"  value="0">
    ��
      <input type="radio" name="byx11"  value="1">
      ������ </td>
  <td align="right">��������11˵��ͼƬ</td>
  <td><input type="text" name="ysbztp11" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������11˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm11" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������12����</td> 
  <td colspan="3"> 
    <input type="text" name="ys12" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������12</td>
  <td><input type="radio" name="byx12"  value="0">
    ��
      <input type="radio" name="byx12"  value="1">
      ������ </td>
  <td align="right">��������12˵��ͼƬ</td>
  <td><input type="text" name="ysbztp12" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������12˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm12" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������13����</td> 
  <td colspan="3"> 
    <input type="text" name="ys13" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������13</td>
  <td><input type="radio" name="byx13"  value="0">
    ��
      <input type="radio" name="byx13"  value="1">
      ������ </td>
  <td align="right">��������13˵��ͼƬ</td>
  <td><input type="text" name="ysbztp13" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������13˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm13" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������14����</td> 
  <td colspan="3"> 
    <input type="text" name="ys14" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������14</td>
  <td><input type="radio" name="byx14"  value="0">
    ��
      <input type="radio" name="byx14"  value="1">
      ������ </td>
  <td align="right">��������14˵��ͼƬ</td>
  <td><input type="text" name="ysbztp14" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������14˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm14" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������15����</td> 
  <td colspan="3"> 
    <input type="text" name="ys15" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������15</td>
  <td><input type="radio" name="byx15"  value="0">
    ��
      <input type="radio" name="byx15"  value="1">
      ������ </td>
  <td align="right">��������15˵��ͼƬ</td>
  <td><input type="text" name="ysbztp15" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������15˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm15" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������16����</td> 
  <td colspan="3"> 
    <input type="text" name="ys16" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������16</td>
  <td><input type="radio" name="byx16"  value="0">
    ��
      <input type="radio" name="byx16"  value="1">
      ������ </td>
  <td align="right">��������16˵��ͼƬ</td>
  <td><input type="text" name="ysbztp16" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������16˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm16" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������17����</td> 
  <td colspan="3"> 
    <input type="text" name="ys17" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������17</td>
  <td><input type="radio" name="byx17"  value="0">
    ��
      <input type="radio" name="byx17"  value="1">
      ������ </td>
  <td align="right">��������17˵��ͼƬ</td>
  <td><input type="text" name="ysbztp17" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������17˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm17" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������18����</td> 
  <td colspan="3"> 
    <input type="text" name="ys18" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������18</td>
  <td><input type="radio" name="byx18"  value="0">
    ��
      <input type="radio" name="byx18"  value="1">
      ������</td>
  <td align="right">��������18˵��ͼƬ</td>
  <td><input type="text" name="ysbztp18" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������18˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm18" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������19����</td> 
  <td colspan="3"> 
    <input type="text" name="ys19" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������19</td>
  <td><input type="radio" name="byx19"  value="0">
    ��
      <input type="radio" name="byx19"  value="1">
      ������ </td>
  <td align="right">��������19˵��ͼƬ</td>
  <td><input type="text" name="ysbztp19" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������19˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm19" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������20����</td> 
  <td colspan="3"> 
    <input type="text" name="ys20" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������20</td>
  <td><input type="radio" name="byx20"  value="0">
    ��
      <input type="radio" name="byx20"  value="1">
      ������ </td>
  <td align="right">��������20˵��ͼƬ</td>
  <td><input type="text" name="ysbztp20" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������20˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm20" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������21����</td> 
  <td colspan="3"> 
    <input type="text" name="ys21" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������21</td>
  <td><input type="radio" name="byx21"  value="0">
    ��
      <input type="radio" name="byx21"  value="1">
      ������</td>
  <td align="right">��������21˵��ͼƬ</td>
  <td><input type="text" name="ysbztp21" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������21˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm21" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������22����</td> 
  <td colspan="3"> 
    <input type="text" name="ys22" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������22</td>
  <td><input type="radio" name="byx22"  value="0">
    ��
      <input type="radio" name="byx22"  value="1">
      ������ </td>
  <td align="right">��������22˵��ͼƬ</td>
  <td><input type="text" name="ysbztp22" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������22˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm22" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������23����</td> 
  <td colspan="3"> 
    <input type="text" name="ys23" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������23</td>
  <td><input type="radio" name="byx23"  value="0">
    ��
      <input type="radio" name="byx23"  value="1">
      ������ </td>
  <td align="right">��������23˵��ͼƬ</td>
  <td><input type="text" name="ysbztp23" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������23˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm23" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������24����</td> 
  <td colspan="3"> 
    <input type="text" name="ys24" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������24</td>
  <td><input type="radio" name="byx24"  value="0">
    ��
      <input type="radio" name="byx24"  value="1">
      ������ </td>
  <td align="right">��������24˵��ͼƬ</td>
  <td><input type="text" name="ysbztp24" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������24˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm24" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������25����</td> 
  <td colspan="3"> 
    <input type="text" name="ys25" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������25</td>
  <td><input type="radio" name="byx25"  value="0">
    ��
      <input type="radio" name="byx25"  value="1">
      ������ </td>
  <td align="right">��������25˵��ͼƬ</td>
  <td><input type="text" name="ysbztp25" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������25˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm25" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������26����</td> 
  <td colspan="3"> 
    <input type="text" name="ys26" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������26</td>
  <td><input type="radio" name="byx26"  value="0">
    ��
      <input type="radio" name="byx26"  value="1">
      ������ </td>
  <td align="right">��������26˵��ͼƬ</td>
  <td><input type="text" name="ysbztp26" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������26˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm26" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������27����</td> 
  <td colspan="3"> 
    <input type="text" name="ys27" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������27</td>
  <td><input type="radio" name="byx27"  value="0">
    ��
      <input type="radio" name="byx27"  value="1">
      ������ </td>
  <td align="right">��������27˵��ͼƬ</td>
  <td><input type="text" name="ysbztp27" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������27˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm27" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������28����</td> 
  <td colspan="3"> 
    <input type="text" name="ys28" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������28</td>
  <td><input type="radio" name="byx28"  value="0">
    ��
      <input type="radio" name="byx28"  value="1">
      ������ </td>
  <td align="right">��������28˵��ͼƬ</td>
  <td><input type="text" name="ysbztp28" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������28˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm28" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������29����</td> 
  <td colspan="3"> 
    <input type="text" name="ys29" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������29</td>
  <td><input type="radio" name="byx29"  value="0">
    ��
      <input type="radio" name="byx29"  value="1">
      ������ </td>
  <td align="right">��������29˵��ͼƬ</td>
  <td><input type="text" name="ysbztp29" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������29˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm29" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������30����</td> 
  <td colspan="3"> 
    <input type="text" name="ys30" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������30</td>
  <td><input type="radio" name="byx30"  value="0">
    ��
      <input type="radio" name="byx30"  value="1">
      ������ </td>
  <td align="right">��������30˵��ͼƬ</td>
  <td><input type="text" name="ysbztp30" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������30˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm30" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������31����</td> 
  <td colspan="3"> 
    <input type="text" name="ys31" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������31</td>
  <td><input type="radio" name="byx31"  value="0">
    ��
      <input type="radio" name="byx31"  value="1">
      ������ </td>
  <td align="right">��������31˵��ͼƬ</td>
  <td><input type="text" name="ysbztp31" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������31˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm31" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������32����</td> 
  <td colspan="3"> 
    <input type="text" name="ys32" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������32</td>
  <td><input type="radio" name="byx32"  value="0">
    ��
      <input type="radio" name="byx32"  value="1">
      ������ </td>
  <td align="right">��������32˵��ͼƬ</td>
  <td><input type="text" name="ysbztp32" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������32˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm32" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������33����</td> 
  <td colspan="3"> 
    <input type="text" name="ys33" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������33</td>
  <td><input type="radio" name="byx33"  value="0">
    ��
      <input type="radio" name="byx33"  value="1">
      ������ </td>
  <td align="right">��������33˵��ͼƬ</td>
  <td><input type="text" name="ysbztp33" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������33˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm33" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������34����</td> 
  <td colspan="3"> 
    <input type="text" name="ys34" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������34</td>
  <td><input type="radio" name="byx34"  value="0">
    ��
      <input type="radio" name="byx34"  value="1">
      ������ </td>
  <td align="right">��������34˵��ͼƬ</td>
  <td><input type="text" name="ysbztp34" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������34˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm34" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������35����</td> 
  <td colspan="3"> 
    <input type="text" name="ys35" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������35</td>
  <td><input type="radio" name="byx35"  value="0">
    ��
      <input type="radio" name="byx35"  value="1">
      ������ </td>
  <td align="right">��������35˵��ͼƬ</td>
  <td><input type="text" name="ysbztp35" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������35˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm35" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������36����</td> 
  <td colspan="3"> 
    <input type="text" name="ys36" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������36</td>
  <td><input type="radio" name="byx36"  value="0">
    ��
      <input type="radio" name="byx36"  value="1">
      ������ </td>
  <td align="right">��������36˵��ͼƬ</td>
  <td><input type="text" name="ysbztp36" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������36˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm36" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������37����</td> 
  <td colspan="3"> 
    <input type="text" name="ys37" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������37</td>
  <td><input type="radio" name="byx37"  value="0">
    ��
      <input type="radio" name="byx37"  value="1">
      ������ </td>
  <td align="right">��������37˵��ͼƬ</td>
  <td><input type="text" name="ysbztp37" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������37˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm37" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������38����</td> 
  <td colspan="3"> 
    <input type="text" name="ys38" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������38</td>
  <td><input type="radio" name="byx38"  value="0">
    ��
      <input type="radio" name="byx38"  value="1">
      ������ </td>
  <td align="right">��������38˵��ͼƬ</td>
  <td><input type="text" name="ysbztp38" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������38˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm38" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������39����</td> 
  <td colspan="3"> 
    <input type="text" name="ys39" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������39</td>
  <td><input type="radio" name="byx39"  value="0">
    ��
      <input type="radio" name="byx39"  value="1">
      ������ </td>
  <td align="right">��������39˵��ͼƬ</td>
  <td><input type="text" name="ysbztp39" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������39˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm39" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������40����</td> 
  <td colspan="3"> 
    <input type="text" name="ys40" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������40</td>
  <td><input type="radio" name="byx40"  value="0">
    ��
      <input type="radio" name="byx40"  value="1">
      ������</td>
  <td align="right">��������40˵��ͼƬ</td>
  <td><input type="text" name="ysbztp40" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������40˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm40" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������41����</td> 
  <td colspan="3"> 
    <input type="text" name="ys41" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������41</td>
  <td><input type="radio" name="byx41"  value="0">
    ��
      <input type="radio" name="byx41"  value="1">
      ������ </td>
  <td align="right">��������41˵��ͼƬ</td>
  <td><input type="text" name="ysbztp41" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������41˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm41" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������42����</td> 
  <td colspan="3"> 
    <input type="text" name="ys42" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������42</td>
  <td><input type="radio" name="byx42"  value="0">
    ��
      <input type="radio" name="byx42"  value="1">
      ������ </td>
  <td align="right">��������42˵��ͼƬ</td>
  <td><input type="text" name="ysbztp42" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������42˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm42" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������43����</td> 
  <td colspan="3"> 
    <input type="text" name="ys43" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������43</td>
  <td><input type="radio" name="byx43"  value="0">
    ��
      <input type="radio" name="byx43"  value="1">
      ������ </td>
  <td align="right">��������43˵��ͼƬ</td>
  <td><input type="text" name="ysbztp43" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������43˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm43" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������44����</td> 
  <td colspan="3"> 
    <input type="text" name="ys44" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������44</td>
  <td><input type="radio" name="byx44"  value="0">
    ��
      <input type="radio" name="byx44"  value="1">
      ������</td>
  <td align="right">��������44˵��ͼƬ</td>
  <td><input type="text" name="ysbztp44" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������44˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm44" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������45����</td> 
  <td colspan="3"> 
    <input type="text" name="ys45" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������45</td>
  <td><input type="radio" name="byx45"  value="0">
    ��
      <input type="radio" name="byx45"  value="1">
      ������ </td>
  <td align="right">��������45˵��ͼƬ</td>
  <td><input type="text" name="ysbztp45" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������45˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm45" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������46����</td> 
  <td colspan="3"> 
    <input type="text" name="ys46" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������46</td>
  <td><input type="radio" name="byx46"  value="0">
    ��
      <input type="radio" name="byx46"  value="1">
      ������ </td>
  <td align="right">��������46˵��ͼƬ</td>
  <td><input type="text" name="ysbztp46" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������46˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm46" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������47����</td> 
  <td colspan="3"> 
    <input type="text" name="ys47" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������47</td>
  <td><input type="radio" name="byx47"  value="0">
    ��
      <input type="radio" name="byx47"  value="1">
      ������ </td>
  <td align="right">��������47˵��ͼƬ</td>
  <td><input type="text" name="ysbztp47" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������47˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm47" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������48����</td> 
  <td colspan="3"> 
    <input type="text" name="ys48" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������48</td>
  <td><input type="radio" name="byx48"  value="0">
    ��
      <input type="radio" name="byx48"  value="1">
      ������</td>
  <td align="right">��������48˵��ͼƬ</td>
  <td><input type="text" name="ysbztp48" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������48˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm48" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������49����</td> 
  <td colspan="3"> 
    <input type="text" name="ys49" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������49</td>
  <td><input type="radio" name="byx49"  value="0">
    ��
      <input type="radio" name="byx49"  value="1">
      ������</td>
  <td align="right">��������49˵��ͼƬ</td>
  <td><input type="text" name="ysbztp49" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������49˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm49" value="" size="73" maxlength="1000" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������50����</td> 
  <td colspan="3"> 
    <input type="text" name="ys50" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������50</td>
  <td><input type="radio" name="byx50"  value="0">
    ��
      <input type="radio" name="byx50"  value="1">
      ������ </td>
  <td align="right">��������50˵��ͼƬ</td>
  <td><input type="text" name="ysbztp50" value="" size="20" maxlength="800" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��������50˵������</td> 
  <td colspan="3"><input type="text" name="ysbzsm50" value="" size="73" maxlength="1000" ></td>
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
	if(	javaTrim(FormName.gcysbbh)=="") {
		alert("��ѡ��[���հ汾��]��");
		FormName.gcysbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gcysxmbm)=="") {
		alert("��ѡ��[������Ŀ����]��");
		FormName.gcysxmbm.focus();
		return false;
	}

	if(	javaTrim(FormName.yszxsl)=="") {
		alert("������[������������]��");
		FormName.yszxsl.focus();
		return false;
	}
	if(!(isNumber(FormName.yszxsl, "������������"))) {
		return false;
	}

	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
