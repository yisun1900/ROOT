<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String khbh=request.getParameter("khbh");

	ls_sql="SELECT bj_sfxmmx.khbh,bj_sfxmmx.sfxmbm,sfxmmc,DECODE(bj_sfxmmx.sflx,'1','����ֱ�ӷѰٷֱȣ����ɸģ�','A','����ֱ�ӷѰٷֱȣ��ɸģ�','2','�̶����(�ɸ�)','3','˰��(�ٷֱ�)','4','�̶����(���ɸ�)','5','�����(�ٷֱ�)','6','���ķѰٷֱ�','7','���̼����ķѰٷֱ�') sflx,DECODE(bj_sfxmmx.sfjrqye,'1','����','2','������') sfjrqye,DECODE(bj_sfxmmx.jrsjbz,'1','����','2','������') jrsjbz,DECODE(bj_sfxmmx.jrglfbz,'1','����','2','������') jrglfbz,DECODE(bj_sfxmmx.sfkdz,'N','���ɴ���','Y','�ɴ���') sfkdz,TO_CHAR(zdzk) zdzk,bj_sfxmmx.sfbfb||'%' sfbfb,bj_sfxmmx.zqsfje,TO_CHAR(bj_sfxmmx.dxzkl) dxzkl,bj_sfxmmx.sfje,bj_sfxmmx.bz";
	ls_sql+=" FROM bj_sfxmmx  ";
    ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
    ls_sql+=" order by bj_sfxmmx.sfxmbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditZklBj_sfxmmx.jsp?khbh="+khbh);
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"khbh","sfxmmc","sflx","sfjrqye","jrsjbz","jrglfbz","sfkdz","zdzk","sfbfb","zqsfje","dxzkl","sfje","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"sfxmbm"};
	pageObj.setKey(keyName);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�����շ���Ŀ���������ۿ�
  </font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">�ͻ����</td>
	<td  width="12%">�շ���Ŀ</td>
	<td  width="11%">�շ�����</td>
	<td  width="5%">����ǩԼ��</td>
	<td  width="5%">����˰�����</td>
	<td  width="5%">�������ѻ���</td>
	<td  width="5%">�Ƿ�ɴ���</td>
	<td  width="5%">��������ۿ�</td>
	<td  width="5%">�շѰٷֱ�</td>
	<td  width="7%">��ǰ�շѽ��</td>
	<td  width="5%">�����ۿ���</td>
	<td  width="7%">�ۺ��շѽ��</td>
	<td  width="24%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>