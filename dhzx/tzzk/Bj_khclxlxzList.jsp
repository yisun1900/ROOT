<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>
<%
	String khbh=request.getParameter("khbh");
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�ͻ�����С���������ƣ�<%=khbh%>��</font></B>
</CENTER>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="8%">����С�����</td>
	<td  width="22%">����С������</td>
	<td  width="22%">���ϴ���</td>
	<td  width="10%">�Ƿ���������</td>
	<td  width="8%"><span class="STYLE1">�ײ���������</span></td>
	<td  width="8%"><span class="STYLE1">�������ּӼ�</span></td>
	<td  width="10%"><span class="STYLE1">�Ƿ����Ƽ�������</span></td>
	<td  width="8%"><span class="STYLE1">��������������</span></td>

</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;

	ls_sql="SELECT '�޸�' xg,bj_khclxlxz.clxlbm,jxc_clxlbm.clxlmc,jxc_clxlbm.cldlmc,DECODE(bj_khclxlxz.sfxzsl,'1','������','2','���ܳ���','3','�ɳ�����Ӽ�'),bj_khclxlxz.tcslxz,bj_khclxlxz.ccbfjj,DECODE(bj_khclxlxz.sfkjm,'1','������','2','����'),bj_khclxlxz.yxjmzdsl";
	ls_sql+=" FROM bj_khclxlxz,jxc_clxlbm ";
    ls_sql+=" where bj_khclxlxz.clxlbm=jxc_clxlbm.clxlbm(+) and bj_khclxlxz.khbh='"+khbh+"'";
    ls_sql+=" order by jxc_clxlbm.cldlmc,bj_khclxlxz.clxlbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

 
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("cldlmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"clxlbm"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="EditBj_khclxlxz.jsp?khbh="+khbh;//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("xg",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
	pageObj.printFoot();
%> 
</body>
</html>

<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
